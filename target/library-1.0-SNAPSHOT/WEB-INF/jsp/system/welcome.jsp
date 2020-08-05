<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
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
    <title>欢迎进入本系统</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/xadmin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/cutsom-style.css">
    <script type="text/javascript"
            src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<div class="x-body">
    <blockquote class="layui-elem-quote">欢迎进入校园图书借阅系统！v1.0；登录时间：${LOGINTIME }；</blockquote>
    <fieldset class="layui-elem-field">
        <legend>信息一览</legend>
        <div class="layui-field-box">

            <%--<shiro:hasRole name="xgsj">--%>
            <table class="layui-table">
                <thead>
                <tr>
                    <th colspan="2" scope="col">图书信息</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th width="30%">书目总数</th>
                    <td>${smNum}本</td>
                </tr>
                <tr>
                    <td>现存图书总数</td>
                    <td>${tuNum}本</td>
                </tr>
                <tr>
                    <td>图书类型总数</td>
                    <td>${zlNum}种</td>
                </tr>
                <tr>
                    <td>历史借阅总数</td>
                    <td>${jyNum}本</td>
                </tr>
                <tr>
                    <td>现待还图书总数</td>
                    <td>${ghNum}本</td>
                </tr>

                </tbody>
            </table>
            <%--</shiro:hasRole>--%>
        </div>
    </fieldset>
</div>
</body>
</html>