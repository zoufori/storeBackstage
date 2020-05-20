<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="_meta.jsp"></jsp:include>

<title>商品类型列表</title>
</head>
<body>
<jsp:include page="_header.jsp"></jsp:include>

<jsp:include page="_menu.jsp"></jsp:include>

<section class="Hui-article-box">
    <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页
        <span class="c-gray en">&gt;</span>
        商品类型管理
        <span class="c-gray en">&gt;</span>
        商品类型列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
                  href="javascript:location.replace(location.href);" title="刷新"><i class="Hui-iconfont">&#xe68f;</i></a>
    </nav>
    <div class="Hui-article">
        <article class="cl pd-20">
            <div class="text-c"> 日期范围：
                <input type="text" onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}'})" id="datemin"
                       class="input-text Wdate" style="width:120px;">
                -
                <input type="text" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d'})"
                       id="datemax" class="input-text Wdate" style="width:120px;">
                <form action="${pageContext.request.contextPath}/goodsType/findByName.do" method="get">
                    <input type="text" class="input-text" style="width:250px" placeholder="输入种类名称" id="" name="text">
                    <button type="submit" class="btn btn-success" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜种类
                    </button>
                </form>
            </div>
            <div class="cl pd-5 bg-1 bk-gray mt-20">
                <span class="l"> <a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i
                        class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a href="javascript:;"
                                                                      onclick="admin_add('添加种类','${pageContext.request.contextPath}/goodsType/addGoodsType.do','800','500')"
                                                                      class="btn btn-primary radius"><i
                        class="Hui-iconfont">&#xe600;</i> 添加种类</a> </span>
                <span class="r">共有数据：<strong>${typeList.total}</strong> 条</span>
            </div>
            <table class="table table-border table-bordered table-bg">
                <thead>
                <tr>
                    <th scope="col" colspan="9">商品类型列表</th>
                </tr>
                <tr class="text-c">
                    <th width="40">ID</th>
                    <th width="40">名称</th>
                    <th width="40">父类</th>
                    <th width="40">URL</th>
                    <th width="100">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${typeList.list}" var="list">
                    <tr class="text-c">
                        <td>${list.id}</td>
                        <td>${list.name}</td>
                        <td>${list.parent}</td>
                        <td>${list.url}</td>
                        <td class="td-manage"><a title="编辑" href="javascript:;"
                                                 onclick="admin_edit('商品种类编辑','${pageContext.request.contextPath}/goodsType/addGoodsType.do','${list.id}','800','500')"
                                                 class="ml-5" style="text-decoration:none"><i
                                class="Hui-iconfont">&#xe6df;</i></a> <a title="删除" href="javascript:;"
                                                                         onclick="admin_del(this,'${list.id}')"
                                                                         class="ml-5"
                                                                         style="text-decoration:none"><i
                                class="Hui-iconfont">&#xe6e2;</i></a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div style="float: left">显示 ${(typeList.pageNum - 1) * typeList.pageSize + 1} 到 ${typeList.size}
                ，共 ${typeList.total} 条
            </div>
            <nav aria-label="Page navigation" style="float: right">
                <ul class="pagination">
                    <c:if test="${!typeList.isFirstPage}">
                        <li>
                            <a href="" aria-label="FirstPage">
                                <span>首页</span>
                            </a>
                        </li>
                    </c:if>
                    <c:if test="${typeList.hasPreviousPage}">
                        <li>
                            <a href="" aria-label="Previous">
                                <span>«</span>
                            </a>
                        </li>
                    </c:if>
                    <c:forEach begin="1" end="${typeList.pages}" var="pageNum">
                        <li><a href="">${pageNum}</a></li>
                    </c:forEach>
                    <c:if test="${typeList.hasNextPage}">
                        <li>
                            <a href="" aria-label="Next">
                                <span>»</span>
                            </a>
                        </li>
                    </c:if>
                    <c:if test="${!typeList.isLastPage}">
                        <li>
                            <a href="#" aria-label="LastPage">
                                <span>尾页</span>
                            </a>
                        </li>
                    </c:if>
                </ul>
            </nav>
        </article>
    </div>
</section>

<jsp:include page="_footer.jsp"></jsp:include>
<script type="text/javascript" src="${pageContext.request.contextPath}/web/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript">
    $(function () {
// 使用bootstrap paginator初始化页面
        $('.pagination').bootstrapPaginator({
            bootstrapMajorVersion: 3,
//pageInfo.pageNum是当前页面的页码
            currentPage:${typeList.pageNum},
//pageInfo.pages是总页数
            totalPages:${typeList.pages},
//配置页面跳转函数，向后端传入数据，发送跳转请求,
//type：选择的页码所显示的文字，如第一页默认type为first
//page:选择的页码
//current：当前页码
            pageUrl: function (type, page, current) {
                var url = window.location.href;
                if (/page/.test(url)) {
                    var newUrl = url.slice(0, url.search(/page=/) + 5) + page;
                    return newUrl;
                }
                if (/\?/.test(url))
                    return url + '&page=' + page;
                else
                    return url + '?page=' + page;
            },
        });
    });
    /*
        参数解释：
        title	标题
        url		请求的url
        id		需要操作的数据id
        w		弹出层宽度（缺省调默认值）
        h		弹出层高度（缺省调默认值）
    */
    /*管理员-增加*/
    function admin_add(title, url, w, h) {
        layer_show(title, url, w, h);
    }

    /*管理员-删除*/
    function admin_del(obj, id) {
        layer.confirm('确认要删除吗？', function (index) {
            //此处请求后台程序，下方是成功后的前台处理……
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/goodsType/deleteGoodsType.do",
                data: {
                    "id": id
                },
                success: function (data) {
                    $(obj).parents("tr").remove();
                    layer.msg('已删除!', {icon: 1, time: 1000});
                },
                fail: function (err) {
                    layer.msg('删除失败!', {icon: 1, time: 1000});
                },
                error: function (e) {
                    layer.msg('删除出错!', {icon: 1, time: 1000});
                    console.log(e.responseText);
                }
            });
        });
    }

    /*管理员-编辑*/
    function admin_edit(title, url, id, w, h) {
        var newUrl = url + "?id=" + id;
        layer_show(title, newUrl, w, h);
    }

</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>