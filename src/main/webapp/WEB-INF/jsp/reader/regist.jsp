<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>欢迎注册读者</title>
    <!-- for-mobile-apps -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Collective Forms Widget Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
    function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- //for-mobile-apps -->
    <link href="static/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <link href='//fonts.googleapis.com/css?family=Source+Sans+Pro:400,300,400italic,300italic,600italic,700' rel='stylesheet' type='text/css'>
</head>
<body>
<div class="main">
    <h1>Collective Forms Widget</h1>
    <div class="wthree_top_forms">
        <div class="agile-info_w3ls hvr-buzz-out">
            <h3>Register</h3>
            <div class="agile-info_w3ls_grid">
                <form action="#" method="post">
                    <input type="text" name="rName" placeholder="Name" id="rName" required=" ">
                    <input type="password" name="rPassword" placeholder="Password" id="rPassword" required=" ">
                    <input type="password" name="rPassword" placeholder="Confirm Password" id="rPassword1" required=" ">
                    <tr>
                        <label id="rSex">性别:</label>
                        <td>
                            <input type="radio" value="男" name="rSex" required=" " class="radio">男
                            <input type="radio" value="女" name="rSex" required=" " class="radio">女
                        </td>
                    </tr>
                    <tr>
                        <td>生日</td>
                        <td><input type="date" id="rBirthday" class="date-picker" required=" "></td>
                    </tr>
                    <input type="email" name="rContact" id="rContact" placeholder="联系方式" required=" ">
                    <input type="email" name="rEmail" id="rEmail" placeholder="Email" required=" ">
                    <div class="check">
                        <label class="checkbox"><input type="checkbox" name="checkbox" checked><i> </i>i agree to the <span>terms of services</span></label>
                    </div>
                    <input type="submit" value="Sign Up">
                </form>
                <h5>Already a member? <a href="#">Sign In</a></h5>
            </div>
        </div>
    </div>
</div>
</body>
</html>
