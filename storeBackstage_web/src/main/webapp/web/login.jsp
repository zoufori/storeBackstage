﻿<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <!--[if lt IE 9]>
<script type="text/javascript" src="${pageContext.request.contextPath}/web/lib/html5.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/web/lib/respond.min.js"></script>
<![endif]-->
    <link href="${pageContext.request.contextPath}/web/static/h-ui/css/H-ui.min.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/web/static/h-ui/css/H-ui.login.css" rel="stylesheet"
          type="text/css"/>
    <link href="${pageContext.request.contextPath}/web/static/h-ui.admin/css/style.css" rel="stylesheet"
          type="text/css"/>
    <link href="${pageContext.request.contextPath}/web/lib/Hui-iconfont/1.0.8/iconfont.css" rel="stylesheet"
          type="text/css"/>
    <!--[if IE 6]>
    <script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js"></script>
    <script>DD_belatedPNG.fix('*');</script><![endif]-->
    <title>后台登录</title>
</head>
<body>
<input type="hidden" id="TenantId" name="TenantId" value=""/>
<div class="header"></div>
<div class="loginWraper">
    <div id="loginform" class="loginBox">
        <form class="form form-horizontal" action="${pageContext.request.contextPath}/login.do" method="post">
            <div class="row cl">
                <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60d;</i></label>
                <div class="formControls col-xs-8">
                    <input id="username" name="username" type="text" placeholder="账户" class="input-text size-L">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60e;</i></label>
                <div class="formControls col-xs-8">
                    <input id="password" name="password" type="password" placeholder="密码" class="input-text size-L">
                </div>
            </div>
            <div class="row cl">
                <div class="formControls col-xs-8 col-xs-offset-3">
                    <input name="imageCode" class="input-text size-L" type="text" placeholder="验证码"
                           onblur="if(this.value==''){this.value='验证码:'}"
                           onclick="if(this.value=='验证码:'){this.value='';}" value="" style="width:150px;">
                    <img id="captcha" src="${pageContext.request.contextPath}/imageCode.do">
                </div>
            </div>
            <div class="row cl">
                <div class="formControls col-xs-8 col-xs-offset-3">
                    <label for="online">
                        <input type="checkbox" name="remember-me" id="online" value="">
                        使我保持登录状态</label>
                </div>
            </div>
            <div class="row cl">
                <div class="formControls col-xs-8 col-xs-offset-3">
                    <input name="" type="submit" class="btn btn-success radius size-L"
                           value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;">
                    <input name="" type="reset" class="btn btn-default radius size-L"
                           value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;">
                </div>
            </div>
        </form>
    </div>
</div>
<div class="footer">Copyright Jimmy</div>
<c:if test="${sessionScope.msg != null && sessionScope.msg != ''}">
    <script type="text/javascript">
        window.onload = function(){
            alert("${sessionScope.msg}");
        }
    </script>
</c:if>
<script type="text/javascript" src="${pageContext.request.contextPath}/web/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/web/static/h-ui/js/H-ui.js"></script>
<script>
        var captcha = document.getElementById("captcha");

        captcha.onclick = function () {
            captcha.src = "${pageContext.request.contextPath}/imageCode.do?" + Math.floor(Math.random() * 100);
        }
</script>
</body>
</html>