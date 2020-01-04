<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/11
  Time: 13:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/static/js/jquery-1.12.4.js"></script>
    <script>
        function check() {
            var $title=$("#title");
            var $createdate=$("#createdate");
            if($title.val()==""){
                alert("图书名称不能为空！")
                return false;
            }
            if($createdate.val()==""){
                alert("上传时间不能为空！")
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
<center>
    <h1>新增图书信息</h1>
    <form action="${pageContext.request.contextPath}/addEntry" method="post" onsubmit="return check()">

        <table border="1" cellspacing="0" cellpadding="5" width="50%">
            <tr>
                <td>图书名称(*)：</td>
                <td><input type="text" name="title" id="title"></td>
            </tr>
            <tr>
                <td>图书摘要：</td>
                <td>
                    <textarea name="summary" id="" cols="30" rows="10"></textarea>
                </td>
            </tr>
            <tr>
                <td>上传人：</td>
                <td><input type="text" name="uploaduser" id=""></td>
            </tr>
            <tr>
                <td>上传时间(*)：</td>
                <td><input type="date" name="createdate" id="createdate">(yyyy-MM-dd)</td>
            </tr>
            <tr>
                <td>图书分类：</td>
                <select name="categoryid" id="">
                    <option value="-1">全部</option>
                    <c:forEach items="${categoryList}" var="cat">
                        <option value="${cat.id}">${cat.name}</option>
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
        location.href="${pageContext.request.contextPath}/list";
    }
</script>
</html>
