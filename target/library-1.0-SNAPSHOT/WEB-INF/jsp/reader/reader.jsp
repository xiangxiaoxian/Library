<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2020/8/3
  Time: 17:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>读者首页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>

</head>
<body>
<a class="btn btn-success btn-sm" href="${pageContext.request.contextPath}/rc/updatePage.do?id=${rea.rId}">修改</a>
    <div >
        <p >用户ID:${rea.rId}</p>
        <p>姓名:${rea.rName }</p>
        <p>性别:${rea.rSex }</p>
        <p>生日:${rea.rBirthday }</p>
        <p>电话:${rea.rContact }</p>
        <p>邮箱:${rea.rEmail }</p>
        <p>信誉度:${rea.rCredibility }</p>
        <p>可借阅量:${rea.rNumber }</p>
    </div>
<a class="btn btn-success btn-sm" href="${pageContext.request.contextPath}/rc/bookBw.do">查看我已借阅</a>
</body>
</html>

