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
    <title>添加用户</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="css/font.css">
    <link rel="stylesheet" href="css/xadmin.css">
    <script type="text/javascript"
            src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="lib/layui/layui.js"
            charset="utf-8"></script>
    <script type="text/javascript" src="js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<div class="x-body">
    <form class="layui-form">
        <div class="layui-form-item">
            <label for="T_id" class="layui-form-label"> <span
                    class="x-red">*</span>编号
            </label>
            <div class="layui-input-inline">
                <input type="text" id="T_id" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="T_name" class="layui-form-label"> <span
                    class="x-red">*</span>图书名
            </label>
            <div class="layui-input-inline">
                <input type="password" id="T_name" autocomplete="off"
                       class="layui-input">
            </div>

        </div>

        <div class="layui-form-item">
            <label for="T-author" class="layui-form-label"> <span
                    class="x-red">*</span>作者名
            </label>
            <div class="layui-input-inline">
                <input type="text" id="T-author" autocomplete="off"
                       class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">输入作者姓名</div>
        </div>
        <div class="layui-form-item">
            <label for="T-price" class="layui-form-label"> <span
                    class="x-red">*</span>价格
            </label>
            <div class="layui-input-inline">
                <input type="text" id="T-price" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="T-date" class="layui-form-label"> <span
                    class="x-red">*</span>出版时间
            </label>
            <div class="layui-input-inline">
                <input type="date" id="T-date" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="T-num" class="layui-form-label">库存 </label>
            <div class="layui-input-inline">
                <input type="text" id="T-num" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item" align="center">
            <button class="layui-btn" type="button" onclick="addmember()">
                增加
            </button>
        </div>
    </form>
</div>
<script>

    function addmember() {
        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath}/bc/add.ajax",
            data:$("form").serialize(),
            dataType:"json",
            success:function (info) {
                if(info=="success"){
                    layer.msg('添加成功!', {
                        icon: 1,
                        time: 500
                    });
                    load(1);
                }else{
                    layer.msg('添加失败!', {
                        icon: 2,
                        time: 500
                    });
                    load(1);
                }

            },
            error:function () {
            }
        })
    }
</script>
</body>

</html>