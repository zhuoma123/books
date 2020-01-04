<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/16
  Time: 8:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        #en_tr:hover{
           background-color: blue;
        }
    </style>
    <%--引入bootstrap的css样式文件--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.css">
    <script src="${pageContext.request.contextPath}/static/js/jquery-1.12.4.js"></script>
    <%--引入bootstrap的js文件--%>
    <script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.js"></script>
    <%--引入分页查询的js文件--%>
    <script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap-paginator.js"></script>
</head>
<body>
<center>
<h1>电子图书列表</h1>
    <form action="${pageContext.request.contextPath}/list" method="post" id="myform" class="form-inline">
        <input type="hidden" name="pageNum" id="pageNum">
        图书分类:
        <select name="searchCategoryId" id="" class="form-control">
            <option value="-1">全部</option>
            <c:forEach items="${categoryList}" var="cate">
                <option value="${cate.id}"
                        <c:if test="${cate.id==searchCategoryId}">selected</c:if>
                >${cate.name}</option>
            </c:forEach>
         </select>
        <input type="submit" value="查询" class="btn btn-primary">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button" value="新增电子图书"class="btn btn-info" data-toggle="modal" data-target="#mymodal">
    </form>
    <table class="table table-hover table-bordered table-striped">
        <tr>
            <td>图书编号</td>
            <td>图书名称</td>
            <td>图书摘要</td>
            <td>上传人</td>
            <td>上传时间</td>
            <td>操作</td>
        </tr>
        <%--动态--%>
        <c:forEach items="${pageInfo.list}" var="entry" varStatus="vs">
            <tr <c:if test="${vs.index%2==0}">bgcolor="#dcdcdc" </c:if> id="en_tr">
                <td>${entry.id}</td>
                <td>${entry.title}</td>
                <td>${entry.summary}</td>
                <td>${entry.uploaduser}</td>
                <td><fmt:formatDate value="${entry.createdate}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
                <td>
                    <a href="javascript:toUpdate(${entry.id})">修改</a>&nbsp;&nbsp;&nbsp;
                    <a href="javascript:toDel(${entry.id})">删除</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <%--<table>
        <tr>
            <td><a href="javascript:toPage(1)">首页</a></td>
            <td><a href="javascript:toPage(${pageInfo.pageNum-1})">上一页</a></td>
            <td>
                <c:forEach var="i" begin="1" end="${pageInfo.pages}">
                    <a href="javascript:toPage(${i})">${i}</a>
                </c:forEach>
            </td>
            <td><a href="javascript:toPage(${pageInfo.pageNum+1})">下一页</a></td>
            <td><a href="javascript:toPage(${pageInfo.pages})">尾页</a></td>
            <td>
                跳转到第 <input type="text"  id="tp">
            </td>
            <td><input type="button" value="跳转" onclick="goToPage()"></td>
        </tr>
    </table>--%>
    <%--分页组件--%>
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <ul id="pagination"></ul>
        </div>
    </div>
</center>
</body>
<script>
    $(function () {
        var element = $('#pagination');
        options = {
            bootstrapMajorVersion:3, //对应的bootstrap版本
            currentPage: ${pageInfo.pageNum}, //当前页数，这里是用的EL表达式，获取从后台传过来的值
            totalPages:${pageInfo.pages}, //总页数，这里是用的EL表达式，获取从后台传过来的值
            itemTexts: function (type, page, current) {//设置显示的样式，默认是箭头
                switch (type) {
                    case "first":
                        return "首页";
                    case "prev":
                        return "上一页";
                    case "next":
                        return "下一页";
                    case "last":
                        return "末页";
                    case "page":
                        return page;
                }
            },
            //点击事件  page:当前的页码
            onPageClicked: function (event, originalEvent, type, page) {
                //处理具体的业务
                /*把当前页码发送到后台的controller做分页查询*/
                //1.给隐藏域赋值
                $("#pageNum").val(page)
                //2.提交表单
                $("#myform").submit();
            }
        };
        element.bootstrapPaginator(options);
    })
</script>
<script>
    function toPage(pageNum) {
        //给隐藏域赋值
        $("#pageNum").val(pageNum);
        //提交表单
        $("#myform").submit();
    }
    function goToPage() {
        toPage($("#tp").val());
    }
    function add() {
        location.href="${pageContext.request.contextPath}/addEntryUI";
    }
    function toUpdate(id) {
        location.href="${pageContext.request.contextPath}/updateEntryUI?id="+id;
    }
    function toDel(id) {
        if(confirm("是否确认删除？")){
            location.href="${pageContext.request.contextPath}/deleteEntry?id="+id;
        }
    }
</script>
<script>
    <c:if test="${insert=='success'}">
    alert("添加成功！");
    </c:if>
    <c:if test="${insert=='fail'}">
    alert("添加失败！");
    </c:if>
    <c:if test="${update=='success'}">
    alert("修改成功！");
    </c:if>
    <c:if test="${update=='fail'}">
    alert("修改失败！");
    </c:if>
    <c:if test="${delete=='success'}">
    alert("删除成功！");
    </c:if>
    <c:if test="${delete=='fail'}">
    alert("删除失败！");
    </c:if>
</script>
</html>
