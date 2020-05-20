<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="_meta.jsp"></jsp:include>
<title>添加管理员</title>

</head>
<body>
<article class="cl pd-20">
    <form action="${pageContext.request.contextPath}/admin/doAddAdmin.do" method="post" class="form form-horizontal"
          id="form-admin-add">
        <c:if test="${admin.id != null}">
            <input type="hidden" value="${admin.id}" name="id">
        </c:if>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>管理员：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${admin.username}" placeholder="登录用户名" id="username"
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
            <label class="form-label col-xs-4 col-sm-3">角色：</label>
            <div class="formControls col-xs-8 col-sm-9"> <span class="select-box" style="width:150px;">
				<select class="select" name="roleid" size="1">
                    <c:choose>
                        <c:when test="${admin.roleid == 1}">
                            <option value="1" selected>超级管理员</option>
                            <option value="2">经理</option>
                            <option value="3">商家</option>
                        </c:when>
                        <c:when test="${admin.roleid == 2}">
                            <option value="1">超级管理员</option>
                            <option value="2" selected>经理</option>
                            <option value="3">商家</option>
                        </c:when>
                        <c:when test="${admin.roleid == 3}">
                            <option value="1">超级管理员</option>
                            <option value="2">经理</option>
                            <option value="3" selected>商家</option>
                        </c:when>
                        <c:otherwise>
                            <option value="1">超级管理员</option>
                            <option value="2">经理</option>
                            <option value="3">商家</option>
                        </c:otherwise>
                    </c:choose>
				</select>
				</span></div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>禁用</label>
            <div class="formControls col-xs-8 col-sm-9">
                <c:choose>
                    <c:when test="${admin.is_ban == 1}">
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
                <input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
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
                    minlength: 4,
                    maxlength: 16
                },
                password: {
                    required: true,
                },
                password2: {
                    required: true,
                    equalTo: "#password"
                }
            },
            onkeyup:false,
            focusCleanup:true,
            success:"valid",
            submitHandler:function(form){
                $(form).submit();
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