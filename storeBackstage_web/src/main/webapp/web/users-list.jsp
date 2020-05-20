<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="_meta.jsp"></jsp:include>

<title>用户列表</title>
</head>
<body>
<jsp:include page="_header.jsp"></jsp:include>

<jsp:include page="_menu.jsp"></jsp:include>

<section class="Hui-article-box">
    <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页
        <span class="c-gray en">&gt;</span>
        用户管理
        <span class="c-gray en">&gt;</span>
        用户列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
                href="javascript:location.replace(location.href);" title="刷新"><i class="Hui-iconfont">&#xe68f;</i></a>
    </nav>
    <div class="Hui-article">
        <article class="cl pd-20">
            <div class="text-c">
                <form action="${pageContext.request.contextPath}/user/findByUsername.do" method="post">
                    <input type="text" class="input-text" style="width:250px" placeholder="输入用户名称" id="" name="text">
                    <button type="submit" class="btn btn-success" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜用户
                    </button>
                </form>
            </div>
            <div class="cl pd-5 bg-1 bk-gray mt-20">
                <span class="l">  <a href="javascript:;"
                                     onclick="admin_add('添加用户','${pageContext.request.contextPath}/user/addUser.do','800','500')"
                                     class="btn btn-primary radius"><i
                        class="Hui-iconfont">&#xe600;</i> 添加用户</a> </span>
                <span class="r">共有数据：<strong>${userList.total}</strong> 条</span>
            </div>
            <table class="table table-border table-bordered table-bg">
                <thead>
                <tr>
                    <th scope="col" colspan="9">用户列表</th>
                </tr>
                <tr class="text-c">
                    <th width="40">ID</th>
                    <th width="150">昵称</th>
                    <th width="90">密码</th>
                    <th width="90">手机号</th>
                    <th width="90">电子邮箱</th>
                    <th width="90">头像</th>
                    <th width="90">性别</th>
                    <th width="90">地址</th>
                    <th width="90">角色</th>
                    <th width="90">余额</th>
                    <th width="130">加入时间</th>
                    <th width="100">是否已启用</th>
                    <th width="100">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${userList.list}" var="list">
                    <tr class="text-c">
                        <td>${list.id}</td>
                        <td>${list.username}</td>
                        <td>${list.password}</td>
                        <td>${list.telephone}</td>
                        <td>${list.email}</td>
                        <td>${list.head_img}</td>
                        <td>${list.gender}</td>
                        <td>${list.address}</td>
                        <td>${list.role}</td>
                        <td>${list.money}</td>
                        <td>${list.dateStr}</td>
                        <c:if test="${list.is_ban == 2}">
                            <td class="td-status"><span class="label label-success radius">已启用</span></td>
                        </c:if>
                        <c:if test="${list.is_ban == 1}">
                            <td class="td-status"><span class="label label-default radius">已禁用</span></td>
                        </c:if>
                        <td class="td-manage"><a style="text-decoration:none" onClick="admin_stop(this,${list.id})"
                                                 href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a>
                            <a
                                    title="编辑" href="javascript:;"
                                    onclick="admin_edit('用户编辑','${pageContext.request.contextPath}/user/addUser.do','${list.id}','800','500')"
                                    class="ml-5"
                                    style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a> <a title="删除"
                                                                                                             href="javascript:;"
                                                                                                             onclick="admin_del(this,'${list.id}')"
                                                                                                             class="ml-5"
                                                                                                             style="text-decoration:none"><i
                                    class="Hui-iconfont">&#xe6e2;</i></a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div style="float: left">显示 ${(userList.pageNum - 1) * userList.pageSize + 1} 到 ${userList.size}
                ，共 ${userList.total} 条
            </div>
            <nav aria-label="Page navigation" style="float: right">
                <ul class="pagination">
                    <c:if test="${!userList.isFirstPage}">
                        <li>
                            <a href="" aria-label="FirstPage">
                                <span>首页</span>
                            </a>
                        </li>
                    </c:if>
                    <c:if test="${userList.hasPreviousPage}">
                        <li>
                            <a href="" aria-label="Previous">
                                <span>«</span>
                            </a>
                        </li>
                    </c:if>
                    <c:forEach begin="1" end="${userList.pages}" var="pageNum">
                        <li><a href="">${pageNum}</a></li>
                    </c:forEach>
                    <c:if test="${userList.hasNextPage}">
                        <li>
                            <a href="" aria-label="Next">
                                <span>»</span>
                            </a>
                        </li>
                    </c:if>
                    <c:if test="${!userList.isLastPage}">
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
            currentPage:${userList.pageNum},
//pageInfo.pages是总页数
            totalPages:${userList.pages},
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
                url: "${pageContext.request.contextPath}/user/deleteUser.do",
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

    /*管理员-停用*/
    function admin_stop(obj, id) {
        layer.confirm('确认要停用吗？', function (index) {
            //此处请求后台程序，下方是成功后的前台处理……
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/user/doStatus.do",
                data: {
                    id: id
                },
                success: function (data) {
                    $(obj).parents("tr").find(".td-manage").prepend('<a onClick="admin_start(this,' + data + ')" href="javascript:;" title="启用或停用" style="text-decoration:none"><i class="Hui-iconfont">&#xe615;</i></a>');
                    $(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">已禁用</span>');
                    $(obj).remove();
                    layer.msg('已变更!', {icon: 6, time: 1000});
                },
                error: function (err) {
                    console.log(err);
                    layer.msg('错误!', {icon: 6, time: 1000});
                }
            })
        });
    }

    /*管理员-启用*/
    function admin_start(obj, id) {
        layer.confirm('确认要启用吗？', function (index) {
            //此处请求后台程序，下方是成功后的前台处理……
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/user/doStatus.do",
                data: {
                    id: id
                },
                success: function (data) {
                    $(obj).parents("tr").find(".td-manage").prepend('<a onClick="admin_stop(this,' + data + ')" href="javascript:;" title="启用或停用" style="text-decoration:none"><i class="Hui-iconfont">&#xe615;</i></a>');
                    $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
                    $(obj).remove();
                    layer.msg('已变更!', {icon: 6, time: 1000});
                },
                error: function (err) {
                    console.log(err);
                    layer.msg('错误!', {icon: 6, time: 1000});
                }
            })

        });
    }
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>