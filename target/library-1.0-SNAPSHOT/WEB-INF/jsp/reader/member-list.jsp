<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html>

<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>用户信息管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/xadmin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/kkpager_orange.css">
    <script type="text/javascript"
            src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/xadmin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/kkpager.min.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body onload="load(1)">
<div class="x-nav">
		<span class="layui-breadcrumb"> <a>管理员</a> <a> <cite>用户信息管理</cite></a>
		</span> <a class="layui-btn layui-btn-small"
                   style="line-height: 1.6em; margin-top: 3px; float: right"
                   href="javascript:location.replace(location.href);" title="刷新"> <i
        class="layui-icon" style="line-height: 30px">ဂ</i></a>
</div>
<div class="x-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so">
            <span>快速查询：</span>
            <input class="layui-input" placeholder="请输入工号" name="rId">
            <input type="text" name="rName" placeholder="请输入姓名"
                   autocomplete="off" class="layui-input">
            <button type="button" class="layui-btn" onclick="load(1)" lay-filter="sreach">
                <i class="layui-icon">&#xe615;</i>
            </button>
        </form>
    </div>

    <xblock>
        <span class="x-right" style="line-height: 40px">共有数据：${rnum} 条</span>
    </xblock>
    <table class="layui-table">
        <thead>
        <tr>
            <th>账号</th>
            <th>姓名</th>
            <th>性别</th>
            <th align="center">生日</th>
            <th>联系方式</th>
            <th>E-mail</th>
            <th>信誉值</th>
            <th>可借阅数</th>
            <th align="center" colspan="2">操作</th>
        </tr>
        </thead>
        <tbody id="tb">
        <!-- 数据示例 -->
        <!-- end 数据示例 -->
        </tbody>
    </table>
    <!-- 分页部分 -->
    <a href="javascript:void(0)" onclick="startPage()" class="btn btn-success btn-sm">首页</a>
    <a href="javascript:void(0)" onclick="prePage()" class="btn btn-success btn-sm">上一页</a>
    <a href="javascript:void(0)" onclick="nextPage()" class="btn btn-success btn-sm">下一页</a>
    <a href="javascript:void(0)" onclick="endPage()" class="btn btn-success btn-sm">尾页</a>
    <!-- end 分页 -->
</div>
<script>
    /*用户-控制*/
    function member_stop(obj, id) {
        layer.confirm('确认要停用/启用该用户吗？', function (index) {
            if ($(obj).attr('title') == '启用') {
                //发异步把用户状态进行更改
                $(obj).attr('title', '停用')
                $(obj).find('i').html('&#xe62f;');
                $(obj).parents("tr").find(".td-status").find('span')
                    .addClass('layui-btn-disabled').html('已拉黑');
                layer.msg('停用成功!', {
                    icon: 1,
                    time: 500
                });
            } else {
                $(obj).attr('title', '启用')
                $(obj).find('i').html('&#xe601;');
                $(obj).parents("tr").find(".td-status").find('span')
                    .removeClass('layui-btn-disabled').html('已启用');
                layer.msg('启用成功!', {
                    icon: 1,
                    time: 500
                });
            }

        });
    }

    var pPage;
    var nPage;
    var sPage;
    var ePage;
    var cpage;

    function prePage() {
        load(pPage)
    }

    function nextPage() {
        load(nPage)
    }

    function startPage() {
        load(sPage)
    }

    function endPage() {
        load(ePage)
    }

    function load(p) {
        $.ajax({
            url: "${pageContext.request.contextPath}/rc/userList.ajax?page=" + p,
            type: "get",
            data: $("form").serialize(),
            dataType: "json",
            success: function (data) {
                var html = "";
                pPage = data.prePage;
                nPage = data.nextPage;
                sPage = data.firstPage;
                ePage = data.lastPage;
                for (var i = 0; i < data.list.length; i++) {
                    html += "<tr>" + "<td>" + data.list[i].rId + "</td>" +
                        "<td>" + data.list[i].rName + "</td>" +
                        "<td>" + data.list[i].rSex + "</td>" +
                        "<td>" + new Date(data.list[i].rBirthday).format("yyyy-MM-dd:hh:mm:ss") + "</td>" +
                        "<td>" + data.list[i].rContact + "</td>" +
                        "<td>" + data.list[i].rEmail + "</td>" +
                        "<td>" + data.list[i].rCredibility + "</td>" +
                        "<td>" + data.list[i].rNumber + "</td>" +
                        "<td class='td-status'><span class ='layui-btn layui-btn-normal layui-btn-mini'>已启用</span></td>" +
                        "<td class='td-manage'><a onclick='member_stop(this,\"10001\")' href = 'javascript:;' title = '启用'> " +
                        "<i class='layui-icon' > &#xe601; </i></a> </td>" +
                        "</tr>"
                }
                $("#tb").html(html)
            },
            error: function () {
            }
        })
    }
</script>
</body>
</html>