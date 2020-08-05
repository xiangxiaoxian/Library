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
    <title>图书信息管理</title>
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
		<span class="layui-breadcrumb"> <a>管理员</a> <a> <cite>图书管理</cite></a>
		</span> <a class="layui-btn layui-btn-small"
                   style="line-height: 1.6em; margin-top: 3px; float: right"
                   href="javascript:location.replace(location.href);" title="刷新"> <i
        class="layui-icon" style="line-height: 30px">ဂ</i></a>
</div>
<div class="x-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so">
            <span>快速查询：</span>
            <input type="text" class="layui-input" placeholder="请输入书名" name="tName"  value="${tName}">
            <input type="text" name="tAuthor" placeholder="请输入作者名"  value="${tAuthor}"
                   autocomplete="off" class="layui-input">
            <button type="button" class="layui-btn" onclick="load(1)" lay-filter="sreach">
                <i class="layui-icon">&#xe615;</i>
            </button>
        </form>
    </div>

    <xblock>
        <span class="x-right" style="line-height: 40px">共有数据：${bnum} 条</span>
    </xblock>
        <button class="layui-btn"
                onclick="x_admin_show('添加用户','bc/add.do',500,500)">
            <i class="layui-icon">&#xe608;</i>添加
        </button>
    <table class="layui-table">
        <thead>
        <tr>
            <th>编号</th>
            <th>书名</th>
            <th>作者</th>
            <th>价格</th>
            <th>出版时间</th>
            <th>库存量</th>
            <th colspan="2">操作</th>
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
    /*用户-删除*/
    function member_del(obj, id) {
        layer.confirm('确认要删除吗？', function (index) {
            $.ajax({
                type: "post",
                url:"${pageContext.request.contextPath}/bc/del.ajax?id="+id,
                dataType: "json",
                success:function (info) {
                    if(info=="success"){
                        //发异步删除数据
                        layer.msg('已删除!', {
                            icon: 1,
                            time: 500
                        });
                    }
                },
                error:function () {
                }
            })
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
            url: "${pageContext.request.contextPath}/bc/bookList.ajax?page="+p,
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
                    html += "<tr>" + "<td>" + data.list[i].tId + "</td>" +
                        "<td>" + data.list[i].tName + "</td>" +
                        "<td>" + data.list[i].tAuthor + "</td>" +
                        "<td>" + data.list[i].tPress + "</td>" +
                        "<td>" + new Date(data.list[i].tPublication).format("yyyy-MM-dd") + "</td>" +
                        "<td>" + data.list[i].tInventory + "</td>" +
                        "<td><a title='编辑' onclick='x_admin_show(\"编辑\",\"member-edit.html\",600,400)' href='javascript:;' > <i class='layui-icon'>&#xe642;</i> </a> " +
                        "<a title='删除' onclick='member_del(this,"+data.list[i].tId+")' href = 'javascript:;'> <i class = 'layui-icon' > &#xe640; </i> </a> </td>" +
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