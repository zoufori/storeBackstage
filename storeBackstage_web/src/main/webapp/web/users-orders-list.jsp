<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="_meta.jsp"></jsp:include>

<title>订单列表</title>
</head>
<body>
<jsp:include page="_header.jsp"></jsp:include>

<jsp:include page="_menu.jsp"></jsp:include>

<section class="Hui-article-box">
    <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页
        <span class="c-gray en">&gt;</span>
        订单管理
        <span class="c-gray en">&gt;</span>
        订单列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
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
            </div>
            <div class="cl pd-5 bg-1 bk-gray mt-20">
                <span class="r">共有数据：<strong>${orderList.total}</strong> 条</span>
            </div>
            <table class="table table-border table-bordered table-bg">
                <thead>
                <tr>
                    <th scope="col" colspan="9">订单列表</th>
                </tr>
                <tr class="text-c">
                    <th width="40">ID</th>
                    <th width="90">用户ID</th>
                    <th width="150">商品ID</th>
                    <th width="90">下订单时间</th>
                    <th width="90">商品数量</th>
                    <th width="90">收货时间</th>
                    <th width="90">是否在购物车中</th>
                    <th width="90">是否已付款</th>
                    <th width="90">是否删除</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${orderList.list}" var="list">
                    <tr class="text-c">
                        <td>${list.id}</td>
                        <td>${list.userid}</td>
                        <td>${list.goodsid}</td>
                        <td>${list.orderTimeStr}</td>
                        <td>${list.count}</td>
                        <td>
                            <c:if test="${list.receiveTimeStr != null}">
                                ${list.receiveTimeStr}
                            </c:if>
                        </td>
                        <td>${list.is_cart}</td>
                        <td>${list.is_paid}</td>
                        <td>${list.is_cancel}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div style="float: left">显示 ${(orderList.pageNum - 1) * orderList.pageSize + 1} 到 ${orderList.size}
                ，共 ${orderList.total} 条
            </div>
            <nav aria-label="Page navigation" style="float: right">
                <ul class="pagination">
                    <c:if test="${!orderList.isFirstPage}">
                        <li>
                            <a href="" aria-label="FirstPage">
                                <span>首页</span>
                            </a>
                        </li>
                    </c:if>
                    <c:if test="${orderList.hasPreviousPage}">
                        <li>
                            <a href="" aria-label="Previous">
                                <span>«</span>
                            </a>
                        </li>
                    </c:if>
                    <c:forEach begin="1" end="${orderList.pages}" var="pageNum">
                        <li><a href="">${pageNum}</a></li>
                    </c:forEach>
                    <c:if test="${orderList.hasNextPage}">
                        <li>
                            <a href="" aria-label="Next">
                                <span>»</span>
                            </a>
                        </li>
                    </c:if>
                    <c:if test="${!orderList.isLastPage}">
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
            currentPage:${orderList.pageNum},
//pageInfo.pages是总页数
            totalPages:${orderList.pages},
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
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>