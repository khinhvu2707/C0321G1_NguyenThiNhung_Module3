<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 6/29/2021
  Time: 1:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>View product</title>
    <link rel="stylesheet" type="text/css" href="assert/bootstrap4/css/bootstrap.css">
</head>
<body>
<h1>Product details</h1>
<p>
    <a href="/products">Back to Product List</a>
</p>
<table class="table">
    <thead>
    <tr>
        <th scope="col">ID</th>
        <th scope="col">Tên sản phẩm</th>
        <th scope="col">Giá sản phẩm</th>
        <th scope="col">Mô tả sản phẩm</th>
        <th scope="col">Nhà sản xuất</th>
        <th scope="col">Ngày sản xuất</th>
        <th scope="col">Hạn Sử dụng</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${product}" var="products">
        <tr>
            <td>${products.getId()}</td>
            <td>${products.getTenSanPham()}</td>
            <td>${products.getGiaSanPham()}</td>
            <td>${products.getMoTaSanPham()}</td>
            <td>${products.getNhaSanXuat()}</td>
            <td>${products.getNgaySanXuat()}</td>
            <td>${products.getHanSuDung()}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<script src="assert/jquery/jquery-3.5.1.min.js"></script>
<script src="assert/jquery/popper.min.js"></script>
<script src="assert/bootstrap4/js/bootstrap.js"></script>
</body>
</html>

