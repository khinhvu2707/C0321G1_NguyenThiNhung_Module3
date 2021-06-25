<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 6/24/2021
  Time: 7:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
</head>
<body>
<form method="post" action="/amount">
    <p>Nhập mô tả của sản phẩm : </p>
    <input type="text" name="Product" placeholder="Product Description"><br>
    <p>Nhập giá niêm yết : </p>
    <input type="text" name="Price" placeholder="List Price"><br>
    <p>Nhập chiết khấu : </p>
    <input type="text" name="Discount" placeholder="Discount Percent"><br>
    <input type="submit">
</form>
</body>
</html>
