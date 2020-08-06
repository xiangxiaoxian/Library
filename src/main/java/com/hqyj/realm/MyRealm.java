package com.hqyj.realm;

import com.hqyj.mapper.PermissionsMapper;
import com.hqyj.mapper.ReaderMapper;
import com.hqyj.pojo.Permissions;
import com.hqyj.pojo.Reader;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.ByteSource;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * @author admin
 * @version 1.0.0
 * @ClassName MyRealm.java
 * @Description TODO
 * @createTime 2020年08月03日 13:34:00
 */
public class MyRealm extends AuthorizingRealm {

    @Autowired
    private ReaderMapper rm;
    @Autowired
    private PermissionsMapper pm;
    public String m(String password,String username){
        //设置加密方式
        String alg="MD5";
        //加载加密密码
        Object pas=password;
        //设置加盐方式
        Object salt=username;
        //加密次数
        int num=1024;
        String newPassword=new SimpleHash(alg,pas,salt,num).toHex();
        System.out.println(newPassword);
        return newPassword;
    }

    public static void main(String[] args) {
        MyRealm myRealm=new MyRealm();
        myRealm.m("123","kkk");
    }
    //授权
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        System.out.println("进入授权方法");
        //通过principal获取用户信息
        String principal=(String) principals.getPrimaryPrincipal();//拿到用户名
        //给用户添加角色
        Set<String> roles=new HashSet<>();
        //查询数据库拿到权限
        List<Permissions> permissionsList=pm.queryPermissionsByPersonName(principal);
        for (Permissions permissions : permissionsList) {
            System.out.println("permissions = " + permissions);
            roles.add(permissions.getPermissionsName());
        }
     /*   roles.add("user");
        if ("admin".equals(principal) || "xxx".equals(principal)){
            roles.add("admin");
        }*/
        return new SimpleAuthorizationInfo(roles);
    }
    //认证
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
       // System.out.println("------我进来了----");
        //将token强转为UsernamePasswordToken 类型（可以通过这个类型拿到身份(用户名)）
        UsernamePasswordToken token1 = (UsernamePasswordToken)token;
        Reader r=rm.queryReaderByRName(token1.getUsername());
        Subject s= SecurityUtils.getSubject();
        s.getSession().setAttribute("ID",r.getrId());
        System.err.println(r);
        if (r != null) {
            //设置比对器里面的身份
            Object principal = r.getrName();
            //设置比对器里面的的密码(把数据库里面的密码作为比对密码)
            Object credentials = r.getrPassword();
            //自动给令牌类里的密码设置加盐方式
            ByteSource salt = ByteSource.Util.bytes(r.getrName());
            //设置realm的名称
            String realmName = this.getName();
            //new SimpleAuthenticationInfo(principal,credentials,salt,realmName)才是真正的认证
            /*
           如何认证：
           将上面的principal和token1里面的用户名来比对
           将上面的credentials和token1里面的密码来比对
           因为spring-shiro.xml里面配置加密方式 所以会自动把token1里面的密码以MD5加密，加密1024次
          因为上面传了个salt，表示再把token1里面的密码再以salt加盐
           * */
            return new SimpleAuthenticationInfo(principal, credentials, salt, realmName);
        } else {
            throw new AuthenticationException();
        }

    }
}
