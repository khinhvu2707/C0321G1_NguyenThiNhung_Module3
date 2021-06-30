<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 6/29/2021
  Time: 1:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/products" method="post">
    <input type="hidden" name="action" value="create">
    <table>
        <tr>
            <td>Tên sản phẩm : </td>
            <td><input type="text" name="ten"></td>
        </tr>
        <tr>
            <td>Giá sản phẩm : </td>
            <td><input type="number" name="gia"></td>
        </tr>
        <tr>
            <td>Mô tả sản phẩm : </td>
            <td><input type="text" name="mtsp"></td>
        </tr>
        <tr>
            <td>Hãng sản xuất : </td>
            <td><input type="text" name="hsx"></td>
        </tr>
        <tr>
            <td><input type="submit" name="Submit"></td>
        </tr>
    </table>
</form>
</body>
</html>
