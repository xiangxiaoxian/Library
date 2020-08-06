<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2020/8/4
  Time: 9:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改页面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
</head>
<body>
<form action="${pageContext.request.contextPath}/rc/update.do" method="post">
    <table class="table" border="0">
        <tr>
            <td>编号</td>
            <td><input type="hidden" name="rId" value="${rea.rId}"></td>
        </tr>
        <tr>
            <td>姓名</td>
            <td><input type="text" name="rName" value="${rea.rName}"></td>
        </tr>
        <tr>
            <td>性别</td>
            <td><input type="text" name="rSex" value="${rea.rSex}"></td>
        </tr>
        <tr>
            <td>生日</td>
            <td><input type="date" name="rBirthday" value="${rea.rBirthday}"></td>
        </tr>
        <tr>
            <td>电话</td>
            <td><input type="text" name="rContact" value="${rea.rContact}"></td>
        </tr>
        <tr>
            <td>邮箱</td>
            <td><input type="text" name="rEmail" value="${rea.rEmail}"></td>
        </tr>

        <tr>
            <td><span style="color:red">${info}</span></td>
            <td colspan="2"><button type="submit" class="btn btn-success btn-sm">保存</button></td>
            <a class="btn btn-success btn-sm" href="${pageContext.request.contextPath}/rc/rx.do">返回</a>
        </tr>
    </table>
</form>
</body>
</html>
