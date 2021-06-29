<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 6/28/2021
  Time: 9:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Deleting Product</title>
</head>
<body>
<h1>Delete Product</h1>
<p>
    <a href="/products">Back to Product list</a>
</p>
<form method="post">
    <h3>Are you sure?</h3>
    <fieldset>
        <legend>Customer information</legend>
        <table>
            <tr>
                <td> ID : </td>
                <td>${requestScope["product"].getId()}</td>
            </tr>
            <tr>
                <td> Tên sản phẩm : </td>
                <td>${requestScope["product"].getTenSanPham()}</td>
            </tr>
            <tr>
                <td> Giá sản phẩm : </td>
                <td>${requestScope["product"].getGiaSanPham()}</td>
            </tr>
            <tr>
                <td> Mô tả : </td>
                <td>${requestScope["product"].getMoTaSanPham()}</td>
            </tr>
            <tr>
                <td> Hãng sản xuất : </td>
                <td>${requestScope["product"].getNhaSanXuat()}</td>
            </tr>
            <tr>
                <td><input type="submit" value="Delete Product"></td>
                <td><a href="/products">Back to Product list</a></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>

