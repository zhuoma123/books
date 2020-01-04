<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/13
  Time: 11:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<center>
    <h1>修改图书信息</h1>
    <form action="${pageContext.request.contextPath}/updateEntry" method="post">
        <%--隐藏域--%>
            <input type="hidden" name="id" value="${entry.id}">
        <table border="1" cellspacing="0" cellpadding="5" width="50%">
            <tr>
                <td>图书编号：</td>
                <td>${entry.id}</td>
            </tr>
            <tr>
                <td>图书名称：</td>
                <td><input type="text" name="title" value="${entry.title}"></td>
            </tr>
            <tr>
                <td>图书摘要：</td>
                <td>
                    <textarea name="summary" id="" cols="30" rows="10" >${entry.summary}</textarea>
                </td>
            </tr>
            <tr>
                <td>上传人：</td>
                <td><input type="text" name="uploaduser" id="" value="${entry.uploaduser}"></td>
            </tr>
            <tr>
                <td>上传时间：</td>
                <td><input type="date" name="createdate" value="<fmt:formatDate value="${entry.createdate}" pattern="yyyy-MM-dd"></fmt:formatDate>">(yyyy-MM-dd)</td>
            </tr>
            <tr>
                <td>图书分类：</td>
                <select name="categoryid" id="">
                    <option value="-1">全部</option>
                    <c:forEach items="${categoryList}" var="cat">
                        <option value="${cat.id}"
                           <if test="${cat.id==entry.categoryid}">selected</if>
                        >${cat.name}</option>
                    </c:forEach>
                </select>
            </tr>
            <tr>
                <th colspan="2">
                    <input type="submit" value="提交">
                    <input type="button" value="返回" onclick="toList()">
                </th>
            </tr>
        </table>
    </form>
</center>
</body>
<script>
    function toList() {
        location.href="${pageContext.request.contextPath}/list"
    }
</script>
</html>
