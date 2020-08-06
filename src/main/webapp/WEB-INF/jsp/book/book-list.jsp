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
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/xadmin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/kkpager_orange.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css">
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/static/js/jquery-3.5.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/xadmin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/kkpager.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
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
            onclick="addWin()">
        <i class="layui-icon">&#xe608;</i>添加
    </button>
    <table class="layui-table">
        <thead>
        <tr>
            <th>编号</th>
            <th>书名</th>
            <th>作者</th>
            <th>出版社</th>
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
<div class="modal fade" id="one" style="top:200px">
    <div class="modal-dialog">
        <div class="modal-content">
            <!--头部-->
            <div class="modal-header" style="background-color: green; height: 20px;">
            </div>
            <div class="modal-body">
                <table class="table" border="0">
                    <tr>
                        <td><input type="hidden" id="tId"></td>
                    </tr>
                    <tr>
                        <td>书名</td>
                        <td><input type="text" id="tName"></td>
                    </tr>
                    <tr>
                        <td>作者</td>
                        <td>
                            <input type="text" id="tAuthor" name="tAuthor">

                        </td>
                    </tr>
                    <tr>
                        <td>价格</td>
                        <td>
                            <input type="text" id="tPress" name="tPress">
                        </td>
                    </tr>
                    <tr>
                        <td>出版时间</td>
                        <td>
                            <input type="date" id="tPublication" name="tPublication">
                        </td>
                    </tr>
                    <tr>
                        <td>库存</td>
                        <td>
                            <input type="text" id="tInventory" name="tInventory">
                        </td>
                    </tr>
                    <tr>
                        <td><span style="color:#fd8080" id="info"></span></td>
                        <td colspan="2">
                            <button type="button" class="btn btn-success btn-sm" onclick="save()">保存
                            </button>
                        </td>

                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>

<script>
    /*用户-删除*/
    function member_del(obj, id) {
        layer.confirm('确认要删除吗？', function (index) {
            $.ajax({
                type: "get",
                url: "${pageContext.request.contextPath}/bc/del.ajax?id=" + id,
                dataType: "text",
                success: function (info) {
                    if (info == "success") {
                        //发异步删除数据
                        layer.msg('已删除!', {
                            icon: 1,
                            time: 500
                        });
                        load(1);
                    }
                },
                error: function () {
                    alert("ajax请求失败")
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
                        "<td><a title='编辑' onclick='updatePage(this)' href='javascript:;' > <i class='layui-icon'>&#xe642;</i> </a> " +
                        "<a title='删除' onclick='member_del(this," + data.list[i].tId + ")' href = 'javascript:;'> <i class = 'layui-icon' > &#xe640; </i> </a> </td>" +
                        "</tr>"
                }
                $("#tb").html(html)
            },
            error: function () {
            }
        })
    }
    function addWin() {
        $("#tId").val("");
        $("#tName").val("");
        $("#tAuthor").val("");
        $("#tPress").val("");
        $("#tPublication").val("");
        $("#tInventory").val("");
        $("#one").modal("show");
    }
    function updatePage(obj) {
        var tId = $(obj).parent().parent().find("td").eq(0).text();
        var tName = $(obj).parent().parent().find("td").eq(1).text();
        var tAuthor = $(obj).parent().parent().find("td").eq(2).text();
        var tPress = $(obj).parent().parent().find("td").eq(3).text();
        var tPublication = $(obj).parent().parent().find("td").eq(4).text();
        var tInventory = $(obj).parent().parent().find("td").eq(5).text();

        //显示模态框
        $("#one").modal("show");

        $("#tId").val(tId);
        $("#tName").val(tName);
        $("#tAuthor").val(tAuthor);
        $("#tPress").val(tPress);
        $("#tPublication").val(tPublication);
        $("#tInventory").val(tInventory);
    }

    function save() {
        var tId = $("#tId").val();
        var tName = $("#tName").val();
        var tAuthor = $("#tAuthor").val();
        var tPress = $("#tPress").val();
        var tPublication = $("#tPublication").val();
        var tInventory = $("#tInventory").val();
        var params;
        var url;
        if (tId != "") {
            url = "${pageContext.request.contextPath}/bc/bookUpdate.ajax"
            //构架js对象
            params = {
                "tId": tId,
                "tName": tName,
                "tAuthor": tAuthor,
                "tPress": tPress,
                "tPublication": new Date(tPublication).format("yyyy-MM-dd"),
                "tInventory": tInventory,
            };
        } else {
            url = "${pageContext.request.contextPath}/bc/bookAdd.ajax";
            //构架js对象
            params = {
                "tId": tId,
                "tName": tName,
                "tAuthor": tAuthor,
                "tPress": tPress,
                "tPublication": new Date(tPublication).format("yyyy-MM-dd"),
                "tInventory": tInventory,
            };
        }
        //发送ajax请求
        $.ajax({
            url: url,
            type: "get",
            data: params,
            dataType: "text",
            success: function (info) {
                if(info=="success"){
                    $("#one").modal("hide");
                }
                load(1)
            },
            error:function () {
                alert("ajax请求失败")
            }
        })
    }
</script>
</body>
</html>