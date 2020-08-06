<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2020/8/4
  Time: 17:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>所有书籍</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
</head>
<body>
<div >
    <div>
        <button type="button" class="btn btn-success btn-sm" onclick="alljie()">借书</button>
    </div>
    <p><span style="color:red">${info}</span></p>
    <form action="${pageContext.request.contextPath}/bc/bookLists.do">
        查询信息：<input type="text" name="s" value="${s}">
        <button type="submit" class="btn btn-success btn-sm">查询</button>
    </form>
    <table class="table">
        <thead>
        <th><input type="checkbox" name="all" onclick="allSelect()">全选</th>
        <th>书名</th>
        <th>作者</th>
        <th>出版社</th>
        <th>出版日期</th>
        <th>库存</th>
        </thead>
        <tbody id="tb">
        <c:forEach items="${bookList.list}" var="b">
            <tr>
                <td><input type="checkbox" name="allId" value="${b.tId}" />
                        ${b.tId}</td>
                <td>${b.tName}</td>
                <td>${b.tAuthor}</td>
                <td>${b.tPress}</td>
                <td>${b.tPublication}</td>
                <td>${b.tInventory}</td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="8"><div class="pagelist"> <a href="${pageContext.request.contextPath}/bc/bookLists.do?page=${bookList.prePage}&s=${s}">上一页</a>
                <a href="${pageContext.request.contextPath}/bc/bookLists.do?page=${bookList.nextPage}&s=${s}">下一页</a>
                <a href="">尾页</a> </div></td>
        </tr>
        </tbody>
    </table>

    </div >
</body>

</html>
<script>
    //全选
    function allSelect() {
        $("input[name='allId']").prop("checked",$("input[name='all']").prop("checked"));
    }
    //借书
    function alljie() {
        //确认框
        var rr = confirm("你确定要借吗");
        //点击确定返回的true
        if (rr) {
            var allId = "";
            $("input[name='allId']:checked").each(function () {
                allId += $(this).val() + ",";
            })
            console.log(allId)
            $.ajax({
                url:"${pageContext.request.contextPath}/bc/borrow.ajax",
                type:"get",
                data:{"id":allId},
                dataType:"json",
                success:function (data) {
                    alert(data.info);
                    window.location.href="${pageContext.request.contextPath}/rc/bookBw.do"
                }
            })
        }
    }
</script>
