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
    <script src="${pageContext.request.contextPath}/static/js/pintuer.js"></script>
</head>
<body>
<div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 内容列表</strong></div>
    <div class="padding border-bottom">
        <button type="button" class="button border-yellow" onclick="window.location.href='/pc/add.do'"><span class="icon-plus-square-o"></span> 添加权限</button>
    </div>
    <table class="table table-hover text-center">
        <thead>
        <tr>
            <th width="5%">ID</th>
            <th width="15%">名称</th>
            <th width="10%">说明</th>
            <th width="10%">操作</th>
        </tr>
        </thead>
        <tbody>

            <c:forEach items="${list}" var="x">
            <tr>
                <td>${x.permissionsId}</td>
                <td>${x.permissionsName}</td>
                <td>${x.permissionsDesc}</td>
                <td>
                    <div class="button-group"> <a class="button border-main" href="${pageContext.request.contextPath}/pc/update.do?permissionsId=${x.permissionsId}">
                        <span class="icon-edit" ></span> 修改</a>
                    <a class="button border-red" href="${pageContext.request.contextPath}/pc/del.do?permissionsId=${x.permissionsId}">
                        <span class="icon-trash-o" ></span> 删除</a>
                    </div>
                </td>
            </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>