<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="_meta.jsp"></jsp:include>
<title>添加用户</title>

</head>
<body>
<article class="cl pd-20">
    <form action="http://localhost:8080/store_web/personal/doAddUser" method="post" class="form form-horizontal"
          id="form-admin-add" enctype="multipart/form-data">
        <c:if test="${user.id != null}">
            <input type="hidden" value="${user.id}" name="id">
        </c:if>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>昵称：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${user.username}" placeholder="" id="username"
                       name="username">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>初始密码：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="password" class="input-text" autocomplete="off" value="" placeholder="密码" id="password"
                       name="password">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>确认密码：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="password" class="input-text" autocomplete="off" placeholder="确认新密码" id="password2"
                       name="password2">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>电子邮箱：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" autocomplete="off" value="${user.email}" placeholder="电子邮箱"
                       id="email" name="email">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>手机号：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" autocomplete="off" placeholder="手机号" value="${user.telephone}"
                       id="telephone"
                       name="telephone">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>头像路径：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="file" class="input-text" autocomplete="off" placeholder="头像路径" value="${user.head_img}"
                       id="img" name="img">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>性别：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <c:choose>
                    <c:when test="${user.gender == 1}">
                        <input type="radio" name="gender" value="1" checked>男
                        <input type="radio" name="gender" value="2">女
                        <input type="radio" name="gender" value="3">私密
                    </c:when>
                    <c:when test="${user.gender == 2}">
                        <input type="radio" name="gender" value="1">男
                        <input type="radio" name="gender" value="2" checked>女
                        <input type="radio" name="gender" value="3">私密
                    </c:when>
                    <c:when test="${user.gender == 3}">
                        <input type="radio" name="gender" value="1">男
                        <input type="radio" name="gender" value="2">女
                        <input type="radio" name="gender" value="3" checked>私密
                    </c:when>
                    <c:otherwise>
                        <input type="radio" name="gender" value="1">男
                        <input type="radio" name="gender" value="2">女
                        <input type="radio" name="gender" value="3" checked>私密
                    </c:otherwise>
                </c:choose>

            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>地址：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" autocomplete="off" placeholder="地址" value="${user.address}"
                       id="address"
                       name="address">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>余额：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" autocomplete="off" placeholder="余额" value="${user.money}"
                       id="money"
                       name="money">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>禁用</label>
            <div class="formControls col-xs-8 col-sm-9">
                <c:choose>
                    <c:when test="${user.is_ban == 1}">
                        <input type="radio" name="is_ban" value="2">否
                        <input type="radio" name="is_ban" value="1" checked>是
                    </c:when>
                    <c:otherwise>
                        <input type="radio" name="is_ban" value="2" checked>否
                        <input type="radio" name="is_ban" value="1">是
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                <input class="btn btn-primary radius" id="button" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
            </div>
        </div>
    </form>
</article>

<jsp:include page="_footer.jsp"></jsp:include>

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript">
    $(function () {

        $("#form-admin-add").validate({
            rules: {
                username: {
                    required: true,
                },
                password: {
                    required: true,
                },
                password2: {
                    required: true,
                    equalTo: "#password"
                },
                telephone: {
                    required: true,
                    isPhone: true,
                },
                email: {
                    required: true,
                    email: true,
                },
                address: {
                    required: true,
                }
            },
            onkeyup: false,
            focusCleanup: true,
            success: "valid",
            cors: true,
            submitHandler: function (form) {
                $(form).ajaxSubmit();
                var index = parent.layer.getFrameIndex(window.name);
                parent.$('.btn-refresh').click();
                parent.layer.close(index);
            }
        });
    });
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>