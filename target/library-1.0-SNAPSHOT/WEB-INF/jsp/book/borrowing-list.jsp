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
    <title>图书借阅管理</title>
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
		<span class="layui-breadcrumb"> <a>管理员</a> <a> <cite>图书借阅管理</cite></a>
		</span> <a class="layui-btn layui-btn-small"
                   style="line-height: 1.6em; margin-top: 3px; float: right"
                   href="javascript:location.replace(location.href);" title="刷新"> <i
        class="layui-icon" style="line-height: 30px">ဂ</i></a>
</div>
<div class="x-body">

    <xblock>
        <span class="x-right" style="line-height: 40px">共有数据：${bwnum} 条</span>
    </xblock>
    <table class="layui-table">
        <thead>
        <th>借书编号</th>
        <th>读者名</th>
        <th>借书时间</th>
        <th>应还时间</th>
        <th hidden>邮箱信息</th>
        <th>催还</th>
        </thead>
        <tbody id="tb">

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
    /*用户-催还*/
    function Recall(obj) {
        layer.confirm('确认要催还该用户吗？', function () {
            var email = $(obj).parent().parent().find("td").eq(4).text();
            $.ajax({
                type: "get",
                url:"${pageContext.request.contextPath}/brc/recall.ajax?email="+email,
                dataType: "json",
                success:function (info) {
                    if(info!=""){
                        layer.msg('已发送!', {
                            icon: 1,
                            time: 500
                        });
                    }else{
                        layer.msg('发送失败!', {
                            icon: 2,
                            time: 500
                        });
                    }
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
            url: "${pageContext.request.contextPath}/brc/BorrowingList.ajax?page=" + p,
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
                    html += "<tr>" +
                        "<td>" + data.list[i].bId + "</td>" +
                        "<td>" + data.list[i].reader.rName + "</td>" +
                        "<td>" + new Date(data.list[i].bTime).format("yyyy-MM-dd:hh:mm:ss") + "</td>" +
                        "<td>" + new Date(data.list[i].bLimit).format("yyyy-MM-dd:hh:mm:ss") + "</td>" +
                        "<td hidden>" + data.list[i].reader.rEmail + "</td>" +
                        "<td class='td-manage'><button type='button' onclick='Recall(this)'><i class='layui-icon' > &#xe601; </i></button> </td>" +
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