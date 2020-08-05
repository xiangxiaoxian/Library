<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-cn">
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
<form action="${pageContext.request.contextPath}/book/bookList.do">
    查询信息：<input type="text" name="s" value="${s}">
    <button type="submit" class="btn btn-success btn-sm">查询</button>
</form>
<form method="post" action="">
    <div class="panel admin-panel">
        <div class="panel-head"><strong class="icon-reorder"> 留言管理</strong></div>
        <div class="padding border-bottom">
            <ul class="search">
                <li>
                    <button type="button"  class="button border-green" id="checkall"><span class="icon-check"></span> 全选</button>
                    <button type="submit" class="button border-red"><span class="icon-trash-o"></span> 批量删除</button>
                </li>
            </ul>
        </div>
        <table class="table table-hover text-center">
            <tr>
                <th width="120">ID</th>
                <th>书名</th>
                <th>作者</th>
                <th>出版社</th>
                <th>出版时间</th>
                <th >库存量</th>
                <th>操作</th>
            </tr>

                <c:forEach items="${bookList.list}" var="b">
            <tr>
                    <td><input type="checkbox" name="id[]" value="${b.tId}" />
                        ${b.tId}</td>
                    <td>${b.tName}</td>
                    <td>${b.tAuthor}</td>
                    <td>${b.tPress}</td>
                    <td>${b.tPublication}</td>
                    <td>${b.tInventory}</td>
                    <td><div class="button-group"> <a class="button border-red" href="javascript:void(0)" onclick="return del(1)"><span class="icon-trash-o"></span> 删除</a> </div></td>
            </tr>
                </c:forEach>


            <tr>
                <td colspan="8"><div class="pagelist"> <a href="${pageContext.request.contextPath}/book/bookList.do?page=${bookList.prePage}&s=${s}">上一页</a>
                    <a href="${pageContext.request.contextPath}/book/bookList.do?page=${bookList.nextPage}&s=${s}">下一页</a>
                    <a href="">尾页</a> </div></td>
            </tr>
        </table>
    </div>
</form>
<script type="text/javascript">

    function del(id){
        if(confirm("您确定要删除吗?")){

        }
    }

    $("#checkall").click(function(){
        $("input[name='id[]']").each(function(){
            if (this.checked) {
                this.checked = false;
            }
            else {
                this.checked = true;
            }
        });
    })

    function DelSelect(){
        var Checkbox=false;
        $("input[name='id[]']").each(function(){
            if (this.checked==true) {
                Checkbox=true;
            }
        });
        if (Checkbox){
            var t=confirm("您确认要删除选中的内容吗？");
            if (t==false) return false;
        }
        else{
            alert("请选择您要删除的内容!");
            return false;
        }
    }

</script>
</body></html>
