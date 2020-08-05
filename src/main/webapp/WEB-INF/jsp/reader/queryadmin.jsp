<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/pintuer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/admin.css">
    <script src="${pageContext.request.contextPath}/static/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}static/js/pintuer.js"></script>
</head>
<body>
<div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 内容列表</strong></div>
    <%--<form action="/rc/likeAdmin.do">
        <center>
            <input type="text" class="input w50" name="rName" />
        </center>
        <input type="submit" class="button button-little bg-blue" value="查询">
    </form>--%>
    <table class="table table-hover text-center">
        <thead>
        <tr>
            <th>ID</th>
            <th width="10%">用户名</th>
            <th width="10%">性别</th>
            <th width="10%">出生日期</th>
            <th width="10%">电话</th>
            <th width="10%">邮箱</th>
            <th width="10%">信誉度</th>
            <th width="10%">借阅量</th>
            <th width="20%">操作</th>
        </tr>
        </thead>
        <tbody>

        <c:forEach items="${xiang.list}" var="x">
            <tr>
                <td>${x.rId}</td>
                <td>${x.rName}</td>
                <td>${x.rSex}</td>
                <td>${x.rBirthday}</td>
                <td>${x.rContact}</td>
                <td>${x.rEmail}</td>
                <td>${x.rCredibility}</td>
                <td>${x.rNumber}</td>
                <td>
                    <div class="button-group">
                        <a class="button border-red" href="${pageContext.request.contextPath}/rc/cancel.do?rId=${x.rId}">
                            <span class="icon-edit" ></span> 取消管理员</a>
                        <a class="button border-blue" href="${pageContext.request.contextPath}/rc/setper.do?rId=${x.rId}">
                            <span class="icon-wrench" ></span> 设置权限</a>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <hr class="color-bar">
    <center>
        <a href="${pageContext.request.contextPath}/rc/query.do?page=${xiang.first}&rId=${rId}&pId=${pId}" class="button button-little bg-green">首页</a>
        <a href="${pageContext.request.contextPath}/rc/query.do?page=${xiang.prePage}&rId=${rId}&pId=${pId}" class="button button-little bg-green">上一页</a>
        <a class="button button-little bg-green">第${xiang.num}页</a>
        <a href="${pageContext.request.contextPath}/rc/query.do?page=${xiang.next}&rId=${rId}&pId=${pId}" class="button button-little bg-green">下一页</a>
        <a href="${pageContext.request.contextPath}/rc/query.do?page=${xiang.end}&rId=${rId}&pId=${pId}" class="button button-little bg-green">尾页</a>
        <a class="button button-little bg-green">共${xiang.pages}页</a>
        <a class="button button-little bg-green">共${xiang.total}条数据</a>
    </center>
</div>
</body>
</html>