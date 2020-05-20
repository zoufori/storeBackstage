<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="_meta.jsp"></jsp:include>
<title>添加商品</title>

</head>
<body>
<article class="cl pd-20">
    <form action="http://localhost:8080/store_web/goods/doAddGoods" method="post" class="form form-horizontal"
          id="form-admin-add" enctype="multipart/form-data">
        <c:if test="${user.id != null}">
            <input type="hidden" value="${goods.id}" name="id">
        </c:if>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>名称：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${goods.name}" placeholder="名称" id="name" name="name">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>类型id：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <select name="typeid" class="select" id="select" size="1">
                    <c:forEach items="${typesList}" var="list">
                        <option value="${list.id}" data-index="${list.id}">${list.name}</option>
                    </c:forEach>
                </select>

            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>折扣：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" autocomplete="off" value="${goods.discount}" placeholder="折扣"
                       id="discount" name="discount">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>价格：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" autocomplete="off" placeholder="价格" value="${goods.price}"
                       id="price" name="price">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>描述：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" autocomplete="off" placeholder="描述" id="desc"
                       value="${goods.desc}" name="desc">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>图片：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="file" class="input-text" autocomplete="off" placeholder="图片" id="img_url" name="img_url"
                       value="${goods.thumb_img}"">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>内容图片：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="file" class="input-text" autocomplete="off" placeholder="内容图片" id="content_img_url"
                       value="${goods.content_img}"
                       name="content_img_url">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>内容</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" autocomplete="off" placeholder="内容" id="content" name="content"
                       value="${goods.content}">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>库存：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" autocomplete="off" placeholder="库存" id="inventory"
                       value="${goods.inventory}"
                       name="inventory">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>商家地址：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" autocomplete="off" placeholder="商家地址" id="address" name="address"
                       value="${goods.address}">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>是否推荐：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <c:choose>
                    <c:when test="${goods.is_recommend == 1}">
                        <input type="radio" name="is_recommend" value="1" checked>是
                        <input type="radio" name="is_recommend" value="2">否
                    </c:when>
                    <c:otherwise>
                        <input type="radio" name="is_recommend" value="1">是
                        <input type="radio" name="is_recommend" value="2" checked>否
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
    window.onload = function () {
        var index = ${goods.typeid};
        var option = document.getElementsByTagName("option");

        for (var i = 0; i < option.length; i++) {
            if ((index == option[i].getAttribute("data-index")){
                option[i].setAttribute("selected", "selected");
            }
        }
    }

    $(function () {
        $("#form-admin-add").validate({
            rules: {
                name: {
                    required: true,
                },
                price: {
                    required: true,
                },
                desc: {
                    required: true,
                },
                content: {
                    required: true,
                },
                inventory: {
                    required: true,
                },
                address: {
                    required: true,
                }
            },
            onkeyup: false,
            focusCleanup: true,
            success: "valid",
            submitHandler: function (form) {
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