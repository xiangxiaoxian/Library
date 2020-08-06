<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2020/7/23
  Time: 17:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>List</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>

</head>
<body onload="loadbw()">
<div >
    <a class="btn btn-success btn-sm" href="${pageContext.request.contextPath}/bc/bookLists.do">借书</a>
    <a class="btn btn-success btn-sm" href="${pageContext.request.contextPath}/rc/rx.do">返回个人主页面</a>
    <h3>未还记录</h3>
    <table class="table">
        <thead>
        <th><input type="checkbox" name="all" onclick="allSelect()">全选</th>
        <th>借书编号</th>
        <th>书名</th>
        <th>作者</th>
        <th>出版社</th>
        <th>出版日期</th>
        <th>借书时间</th>
        <th>还书时间</th>
        <th>借书到期时间</th>

        </thead>
        <tbody id="tb1">

        </tbody>
    </table>
    <button type="button" class="btn btn-success btn-sm" onclick="huanall()">还书</button>
</div>

<hr/>
<div>
    <h3>借书记录</h3>
    <div><button type="button" class="btn btn-success btn-sm" onclick="deleteAll()">删除记录</button></div>
    <table class="table">
        <thead>
        <th><input type="checkbox" name="all2" onclick="allSelect2()">全选</th>
        <th>借书编号</th>
        <th>书名</th>
        <th>作者</th>
        <th>出版社</th>
        <th>出版日期</th>
        <th>借书时间</th>
        <th>还书时间</th>
        <th>借书到期时间</th>
        </thead>
        <tbody id="tb2">

        </tbody>
    </table>
    <div >
        <button type="button" class="btn btn-success btn-sm" onclick="prePage()">上一页</button>
        <button type="button" class="btn btn-success btn-sm" onclick="nextPage()">下一页</button>
    </div>
</div>
</body>
</html>
<script>
    var pPage;
    var nPage;
    var iPage;
    var ePage;
    function indexPage() {
        loadbwjl(iPage)
    }
    function endPage() {
        loadbwjl(ePage)
    }
    function prePage() {
        loadbwjl(pPage)
    }
    function nextPage() {
        loadbwjl(nPage)
    }
    //借书未还记录且调用历史记录
    function loadbw() {
        $.ajax({
            url:"${pageContext.request.contextPath}/rc/bookBw.ajax",//请求地址
            type:"get",//请求方式
            dataType:"json",//返回的数据类型 :对象:json,字符串和数字:text
            success:function (data) { //响应成功需要执行的函数s
                console.log(data.list)
                // pPage = data.prePage;
                // nPage = data.nextPage;
                // ePage = data.endPage;
                // iPage = data.indexPage;
                var html="";
                for(var i=0;i<data.list.length;i++){
                    html+="<tr>" +
                        "<td><input type='checkbox' name='allId' value='"+data.list[i].bId+"'></td>" +
                        "<td>"+data.list[i].bId+"</td>"  +
                        "<td>"+data.list[i].book.tName+"</td>" +
                        "<td>"+data.list[i].book.tAuthor+"</td>" +
                        "<td>"+data.list[i].book.tPress+"</td>" +
                        "<td>"+data.list[i].book.tPublication+"</td>"  +
                        "<td>"+data.list[i].bTime+"</td>"  +
                        "<td>"+data.list[i].bRtime+"</td>"  +
                        "<td>"+data.list[i].bLimit+"</td>"  +
                        "</tr>"
                }
                //把拼接的html变量信息显示在id=tb的标签上
                $("#tb1").html(html)
            },
            error:function(data){
                //响应失败需要的做的事情
                alert("1请求失败")
            }
        })
        loadbwjl(1);
    }
    //借书历史记录
    function loadbwjl(p) {
        $.ajax({
            url:"${pageContext.request.contextPath}/rc/bookBwjl.ajax",//请求地址
            type:"get",//请求方式
            data:{"page":p},
            dataType:"json",//返回的数据类型 :对象:json,字符串和数字:text
            success:function (data) { //响应成功需要执行的函数s
                console.log(data.list)
                pPage = data.prePage;
                nPage = data.nextPage;
                ePage = data.endPage;
                iPage = data.indexPage;
                var html="";

                for(var i=0;i<data.list.length;i++){
                    html+="<tr>" +
                        "<td><input type='checkbox' name='allId2' value='"+data.list[i].bId+"'></td>" +
                        "<td>"+data.list[i].bId+"</td>"  +
                        "<td>"+data.list[i].book.tName+"</td>" +
                        "<td>"+data.list[i].book.tAuthor+"</td>" +
                        "<td>"+data.list[i].book.tPress+"</td>" +
                        "<td>"+data.list[i].book.tPublication+"</td>"  +
                        "<td>"+data.list[i].bTime+"</td>"  +
                        "<td>"+data.list[i].bRtime+"</td>"  +
                        "<td>"+data.list[i].bLimit+"</td>"  +
                        "</tr>"
                }
                //把拼接的html变量信息显示在id=tb的标签上
                $("#tb2").html(html)
            },
            error:function(data){
                //响应失败需要的做的事情
                alert("2请求失败")
            }
        })
    }
    //借书未还全选
    function allSelect() {
        $("input[name='allId']").prop("checked",$("input[name='all']").prop("checked"));
    }
    //历史记录全选
    function allSelect2() {
        $("input[name='allId2']").prop("checked",$("input[name='all2']").prop("checked"));
    }
    //还书
    function huanall() {
        //确认框
        var rr = confirm("你确定要吗");
        //点击确定返回的true
        if (rr) {
            var allId = "";
            $("input[name='allId']:checked").each(function () {
                allId += $(this).val() + ",";
            })
            console.log(allId)
            $.ajax({
                url:"${pageContext.request.contextPath}/rc/huanshu.ajax",
                type:"get",
                data:{"id":allId},
                dataType:"json",
                success:function (data) {
                    alert(data.info);
                    //刷新
                    loadbw()
                }
            })
        }
    }
    //删除记录
    function deleteAll() {
        //确认框
        var rr = confirm("你确定要删除吗");
        //点击确定返回的true
        if (rr) {
            var allId = "";
            $("input[name='allId2']:checked").each(function () {
                allId += $(this).val() + ",";
            })
            console.log(allId)
            $.ajax({
                url:"${pageContext.request.contextPath}/bc/deleteAll.ajax",
                type:"get",
                data:{"id":allId},
                dataType:"json",
                success:function (data) {
                    alert(data.info);
                    //刷新
                    loadbwjl(1)
                }
            })
        }
    }
</script>


