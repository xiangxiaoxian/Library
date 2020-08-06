<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>图书管理系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
    <style>
        html, body
        {
            height: 100%;
        }
        body
        {
            font: 12px '微软雅黑', 'Trebuchet MS', Arial, Helvetica;
            margin: 0;
            background-color: #d9dee2;
            background-image: -webkit-gradient(linear, left top, left bottom, from(#ebeef2), to(#d9dee2));
            background-image: -webkit-linear-gradient(top, #ebeef2, #d9dee2);
            background-image: -moz-linear-gradient(top, #ebeef2, #d9dee2);
            background-image: -ms-linear-gradient(top, #ebeef2, #d9dee2);
            background-image: -o-linear-gradient(top, #ebeef2, #d9dee2);
            background-image: linear-gradient(top, #ebeef2, #d9dee2);
        }
        #logins
        {
            background-color: #fff;
            background-image: -webkit-gradient(linear, left top, left bottom, from(#fff), to(#eee));
            background-image: -webkit-linear-gradient(top, #fff, #eee);
            background-image: -moz-linear-gradient(top, #fff, #eee);
            background-image: -ms-linear-gradient(top, #fff, #eee);
            background-image: -o-linear-gradient(top, #fff, #eee);
            background-image: linear-gradient(top, #fff, #eee);
            height: 350px;
            width: 400px;
            margin: -150px 0 0 -230px;
            padding: 30px;
            position: absolute;
            top: 50%;
            left: 50%;
            z-index: 0;
            -moz-border-radius: 3px;
            -webkit-border-radius: 3px;
            border-radius: 3px;
            -webkit-box-shadow:
                    0 0 2px rgba(0, 0, 0, 0.2),
                    0 1px 1px rgba(0, 0, 0, .2),
                    0 3px 0 #fff,
                    0 4px 0 rgba(0, 0, 0, .2),
                    0 6px 0 #fff,
                    0 7px 0 rgba(0, 0, 0, .2);
            -moz-box-shadow:
                    0 0 2px rgba(0, 0, 0, 0.2),
                    1px 1px   0 rgba(0,   0,   0,   .1),
                    3px 3px   0 rgba(255, 255, 255, 1),
                    4px 4px   0 rgba(0,   0,   0,   .1),
                    6px 6px   0 rgba(255, 255, 255, 1),
                    7px 7px   0 rgba(0,   0,   0,   .1);
            box-shadow:
                    0 0 2px rgba(0, 0, 0, 0.2),
                    0 1px 1px rgba(0, 0, 0, .2),
                    0 3px 0 #fff,
                    0 4px 0 rgba(0, 0, 0, .2),
                    0 6px 0 #fff,
                    0 7px 0 rgba(0, 0, 0, .2);
        }
        #logins:before
        {
            content: '';
            position: absolute;
            z-index: -1;
            border: 1px dashed #ccc;
            top: 5px;
            bottom: 5px;
            left: 5px;
            right: 5px;
            -moz-box-shadow: 0 0 0 1px #fff;
            -webkit-box-shadow: 0 0 0 1px #fff;
            box-shadow: 0 0 0 1px #fff;
        }
        h1
        {
            text-shadow: 0 1px 0 rgba(255, 255, 255, .7), 0px 2px 0 rgba(0, 0, 0, .5);
            text-transform: uppercase;
            text-align: center;
            color: #666;
            margin: 0 0 30px 0;
            letter-spacing: 4px;
            font: normal 26px/1 Verdana, Helvetica;
            position: relative;
        }
        h1:after, h1:before
        {
            background-color: #777;
            content: "";
            height: 1px;
            position: absolute;
            top: 15px;
            width: 120px;
        }
        h1:after
        {
            background-image: -webkit-gradient(linear, left top, right top, from(#777), to(#fff));
            background-image: -webkit-linear-gradient(left, #777, #fff);
            background-image: -moz-linear-gradient(left, #777, #fff);
            background-image: -ms-linear-gradient(left, #777, #fff);
            background-image: -o-linear-gradient(left, #777, #fff);
            background-image: linear-gradient(left, #777, #fff);
            right: 0;
        }
        h1:before
        {
            background-image: -webkit-gradient(linear, right top, left top, from(#777), to(#fff));
            background-image: -webkit-linear-gradient(right, #777, #fff);
            background-image: -moz-linear-gradient(right, #777, #fff);
            background-image: -ms-linear-gradient(right, #777, #fff);
            background-image: -o-linear-gradient(right, #777, #fff);
            background-image: linear-gradient(right, #777, #fff);
            left: 0;
        }
        fieldset
        {
            border: 0;
            padding: 0;
            margin: 0;
        }
        #inputs input
        {
            background: #f1f1f1 url(http://www.srcfans.com/jscode/img/201506/images/login-sprite.png) no-repeat;
            padding: 15px 15px 15px 30px;
            margin: 0 0 10px 0;
            width: 353px; /* 353 + 2 + 45 = 400 */
            border: 1px solid #ccc;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            -moz-box-shadow: 0 1px 1px #ccc inset, 0 1px 0 #fff;
            -webkit-box-shadow: 0 1px 1px #ccc inset, 0 1px 0 #fff;
            box-shadow: 0 1px 1px #ccc inset, 0 1px 0 #fff;
        }
        #username
        {
            background-position: 5px -2px !important;
        }
        #password
        {
            background-position: 5px -52px !important;
        }
        #inputs input:focus
        {
            background-color: #fff;
            border-color: #e8c291;
            outline: none;
            -moz-box-shadow: 0 0 0 1px #e8c291 inset;
            -webkit-box-shadow: 0 0 0 1px #e8c291 inset;
            box-shadow: 0 0 0 1px #e8c291 inset;
        }
        #actions
        {
            margin: 25px 0 0 0;
        }
        #submit
          {
              background-color: #ffb94b;
              background-image: -webkit-gradient(linear, left top, left bottom, from(#fddb6f), to(#ffb94b));
              background-image: -webkit-linear-gradient(top, #fddb6f, #ffb94b);
              background-image: -moz-linear-gradient(top, #fddb6f, #ffb94b);
              background-image: -ms-linear-gradient(top, #fddb6f, #ffb94b);
              background-image: -o-linear-gradient(top, #fddb6f, #ffb94b);
              background-image: linear-gradient(top, #fddb6f, #ffb94b);
              -moz-border-radius: 3px;
              -webkit-border-radius: 3px;
              border-radius: 3px;
              text-shadow: 0 1px 0 rgba(255,255,255,0.5);
              -moz-box-shadow: 0 0 1px rgba(0, 0, 0, 0.3), 0 1px 0 rgba(255, 255, 255, 0.3) inset;
              -webkit-box-shadow: 0 0 1px rgba(0, 0, 0, 0.3), 0 1px 0 rgba(255, 255, 255, 0.3) inset;
              box-shadow: 0 0 1px rgba(0, 0, 0, 0.3), 0 1px 0 rgba(255, 255, 255, 0.3) inset;
              border-width: 1px;
              border-style: solid;
              border-color: #d69e31 #e3a037 #d5982d #e3a037;
              float: left;
              height: 35px;
              padding: 0;
              width: 120px;
              cursor: pointer;
              font: bold 15px Arial, Helvetica;
              color: #8f5a0a;
          }
        #submit1
        {
            background-color: #ffb94b;
            background-image: -webkit-gradient(linear, left top, left bottom, from(#fddb6f), to(#ffb94b));
            background-image: -webkit-linear-gradient(top, #fddb6f, #ffb94b);
            background-image: -moz-linear-gradient(top, #fddb6f, #ffb94b);
            background-image: -ms-linear-gradient(top, #fddb6f, #ffb94b);
            background-image: -o-linear-gradient(top, #fddb6f, #ffb94b);
            background-image: linear-gradient(top, #fddb6f, #ffb94b);
            -moz-border-radius: 3px;
            -webkit-border-radius: 3px;
            border-radius: 3px;
            text-shadow: 0 1px 0 rgba(255,255,255,0.5);
            -moz-box-shadow: 0 0 1px rgba(0, 0, 0, 0.3), 0 1px 0 rgba(255, 255, 255, 0.3) inset;
            -webkit-box-shadow: 0 0 1px rgba(0, 0, 0, 0.3), 0 1px 0 rgba(255, 255, 255, 0.3) inset;
            box-shadow: 0 0 1px rgba(0, 0, 0, 0.3), 0 1px 0 rgba(255, 255, 255, 0.3) inset;
            border-width: 1px;
            border-style: solid;
            border-color: #d69e31 #e3a037 #d5982d #e3a037;
            float: right;
            height: 35px;
            padding: 0;
            width: 120px;
            cursor: pointer;
            font: bold 15px Arial, Helvetica;
            color: #8f5a0a;
        }
        #submit2
        {
            background-color: #ffb94b;
            background-image: -webkit-gradient(linear, left top, left bottom, from(#fddb6f), to(#ffb94b));
            background-image: -webkit-linear-gradient(top, #fddb6f, #ffb94b);
            background-image: -moz-linear-gradient(top, #fddb6f, #ffb94b);
            background-image: -ms-linear-gradient(top, #fddb6f, #ffb94b);
            background-image: -o-linear-gradient(top, #fddb6f, #ffb94b);
            background-image: linear-gradient(top, #fddb6f, #ffb94b);
            -moz-border-radius: 3px;
            -webkit-border-radius: 3px;
            border-radius: 3px;
            text-shadow: 0 1px 0 rgba(255,255,255,0.5);
            -moz-box-shadow: 0 0 1px rgba(0, 0, 0, 0.3), 0 1px 0 rgba(255, 255, 255, 0.3) inset;
            -webkit-box-shadow: 0 0 1px rgba(0, 0, 0, 0.3), 0 1px 0 rgba(255, 255, 255, 0.3) inset;
            box-shadow: 0 0 1px rgba(0, 0, 0, 0.3), 0 1px 0 rgba(255, 255, 255, 0.3) inset;
            border-width: 1px;
            border-style: solid;
            border-color: #d69e31 #e3a037 #d5982d #e3a037;
            float: right;
            height: 35px;
            padding: 0;
            width: 120px;
            cursor: pointer;
            font: bold 15px Arial, Helvetica;
            color: #8f5a0a;
        }
        #submit:hover,#submit:focus
        {
            background-color: #fddb6f;
            background-image: -webkit-gradient(linear, left top, left bottom, from(#ffb94b), to(#fddb6f));
            background-image: -webkit-linear-gradient(top, #ffb94b, #fddb6f);
            background-image: -moz-linear-gradient(top, #ffb94b, #fddb6f);
            background-image: -ms-linear-gradient(top, #ffb94b, #fddb6f);
            background-image: -o-linear-gradient(top, #ffb94b, #fddb6f);
            background-image: linear-gradient(top, #ffb94b, #fddb6f);
        }
        #submit:active
        {
            outline: none;
            -moz-box-shadow: 0 1px 4px rgba(0, 0, 0, 0.5) inset;
            -webkit-box-shadow: 0 1px 4px rgba(0, 0, 0, 0.5) inset;
            box-shadow: 0 1px 4px rgba(0, 0, 0, 0.5) inset;
        }
        #submit::-moz-focus-inner
        {
            border: none;
        }
        #actions a
        {
            color: #3151A2;
            float: right;
            line-height: 35px;
            margin-left: 10px;
        }
        #back
        {
            display: block;
            text-align: center;
            position: relative;
            top: 60px;
            color: #999;
        }
    </style>
</head>
<body>
<form action="${pageContext.request.contextPath}/login.do" id="logins" method="post">
    <h1>Log In</h1>
    <fieldset id="inputs">
        <input id="username" name="rName" type="text" placeholder="Username" id="u" autofocus required>
        <input id="password" name="rPassword" type="password" placeholder="Password" id="p" required>
    </fieldset>
    <fieldset id="actions">
        <input type="submit" id="submit" value="Log in">
        <button id="submit1" data-toggle="modal" data-target="#two">注册</button>
        <button id="submit2" data-toggle="modal" data-target="#one">忘记密码？</button>
    </fieldset>
</form>
<br><br>
<div style="text-align:center;clear:both">
</div>
<div class="modal fade" id="two" style="top:200px">
    <div class="modal-dialog">
        <div class="modal-content">
            <!--头部-->
            <div class="modal-header" style="background-color: green; height: 20px;">
            </div>
            <div class="modal-body">
                <table class="table" border="0">
                    <tr>
                        <td>用户名</td>
                        <td><input type="text" id="rName" name="rName" placeholder="用户名"></td>
                    </tr>
                    <tr>
                        <td>密码</td>
                        <td><input type="text" id="rPassword" name="rPassword" placeholder="请输入"></td>
                    </tr>
                    <tr>
                        <td>确认密码</td>
                        <td><input type="text" id="rPassword1" name="rPassword1" placeholder="请再次输入"></td>
                    </tr>
                    <tr>
                        <td>性别</td>
                        <td>
                            <input type="radio" value="男" name="sex">男
                            <input type="radio" value="女" name="sex">女
                        </td>
                    </tr>
                    <tr>
                        <td>出生日期</td>
                        <td><input type="date" id="rTime"></td>
                    </tr>
                    <tr>
                        <td>联系方式</td>
                        <td><input type="text" id="rContact" name="rContact" placeholder="联系方式"></td>
                    </tr>
                    <tr>
                        <td>邮箱</td>
                        <td><input type="text" id="rEmail" name="rEmail" placeholder="邮箱"></td>
                    </tr>
                    <tr>
                        <td><span style="color:red" id="info1"></span></td>
                        <td colspan="2">
                            <button type="button" class="btn btn-success btn-sm" onclick="regist()">注册</button>
                        </td>

                    </tr>
                </table>
            </div>

        </div>
    </div>
</div>
<div class="modal fade" id="one" style="top:200px">
    <div class="modal-dialog">
        <div class="modal-content">
            <!--头部-->
            <div class="modal-header" style="background-color: green; height: 20px;">
            </div>
            <div class="modal-body">
                <table class="table" border="0">
                    <tr>
                        <td>请输入注册此账号时的邮箱</td>
                       <td></td>
                    </tr>
                    <tr>
                        <td>邮箱</td>
                        <td><input type="text" id="rEmail1"></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <button type="button" class="btn btn-success btn-sm" onclick="forgotPassword()">确定</button>
                        </td>

                    </tr>
                </table>
            </div>

        </div>
    </div>
</div>
</body>
</html>
<script>
    //发送登出请求
    $(function () {
        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath}/logout.do",
            dataType:"json",
            success:function (info) {
                if (info.username!=""){
                    $("#u").val(info.username);
                    $("#p").val(info.password);
                    $("#memoryuser").prop("checked","checked");
                }else {

                }
            }
        })
    })
    function regist() {
        var rName=$("#rName").val()
        var rPassword=$("#rPassword").val()
        var rPassword1 =$("#rPassword1").val();
        var rSex = $("input[name='sex']:checked").val()
        var rBirthday=$("#rTime").val()
        var rContact=$("#rContact").val()
        var rEmail=$("#rEmail").val()
        var par={
            "rName":rName,
            "rPassword":rPassword,
            "rSex":rSex,
            "rBirthday":rBirthday,
            "rContact":rContact,
            "rEmail":rEmail
        };
        if (rName==""){
            alert("用户名不能为空。");
            return false;
        }else if (rPassword!=rPassword1) {
            alert("两次输入密码不一致。");
            return false;
        }else if (rSex==""){
            alert("性别不能为空。");
            return false;
        }else if (rBirthday==""){
            alert("出生日期不能为空。");
            return false;
        }else if (rContact==""){
            alert("联系方式不能为空。");
            return false;
        }else if (rEmail==""){
            alert("email不能为空。");
            return false;
        }else {
            $.ajax({
                url:"${pageContext.request.contextPath}/regist.do",
                data:par,
                type:"get",
                dataType:"json",
                success: function (data) {
                    if (data == 0) {
                        alert("该用户名已经存在，请重新更换用户名");
                    } else {
                        alert("注册成功");
                        $("#two").modal("hide");
                    }
                },
                error: function () {
                    alert("注册失败");
                }

            })
        }
    }
    function forgotPassword() {
        $.ajax({
            url:"${pageContext.request.contextPath}/forgotPassword.do",
            data:{"rEmail":$("#rEmail1").val()},
            type:"get",
            dataType:"json",
            success:function (info) {
                if (info!=""){
                    alert("发送成功");
                    $("#one").modal("hide");
                }else {
                    alert("注册失败")
                }
            }
        })

    }
</script>