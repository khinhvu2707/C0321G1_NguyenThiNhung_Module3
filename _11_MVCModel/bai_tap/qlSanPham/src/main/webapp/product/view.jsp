<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 6/28/2021
  Time: 9:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View product</title>
</head>
<body>
<h1>Product details</h1>
<p>
    <a href="/products">Back to Product List</a>
</p>
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

</table>
</body>
</html>

