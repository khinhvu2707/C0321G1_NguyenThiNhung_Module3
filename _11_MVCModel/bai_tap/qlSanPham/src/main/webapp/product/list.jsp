<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 6/28/2021
  Time: 9:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product List</title>
</head>
<body>
<h1>Product</h1>
<p>
    <a href="/products?action=create">Create new Product</a>
</p>
<form action="/products?action=search" method="post">
    <input type="text" name="name" placeholder="Tìm kiếm">
    <input type="submit" value="Tìm kiếm sản phẩm">
</form>
<table border="1">
    <tr>
        <td>Id</td>
        <td>Tên Sản phẩm</td>
        <td>Giá sản phẩm</td>
        <td>Mô tả sản phẩm</td>
        <td>Hãng sản xuất</td>
        <td>Sửa</td>
        <td>Xóa</td>
    </tr>
    <c:forEach items='${requestScope["products"]}' var="product">
        <tr>
            <td>${product.getId()}</td>
            <td>${product.getTenSanPham()}</td>
            <td>${product.getGiaSanPham()}</td>
            <td>${product.getMoTaSanPham()}</td>
            <td>${product.getNhaSanXuat()}</td>
            <td><a href="/products?action=edit&id=${product.getId()}">Sửa</a></td>
            <td><a href="/products?action=delete&id=${product.getId()}">Xóa</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>

