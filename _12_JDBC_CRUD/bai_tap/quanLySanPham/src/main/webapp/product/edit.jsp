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
    <title>Edit Product</title>
</head>
<body>
<h2>Edit Product</h2>
<form method="post">
    <fieldset>
        <legend>Product Information</legend>
        <table>
            <tr>
                <td> ID : </td>
                <td><input type="text" name="id" id="id" value="${product.getId()}"></td>
            </tr>
            <tr>
                <td> Tên sản phẩm : </td>
                <td><input type="text" name="ten" id="ten" value="${product.getTenSanPham()}"></td>
            </tr>
            <tr>
                <td> Giá sản phẩm : </td>
                <td><input type="text" name="gia" id="gia" value="${product.getGiaSanPham() }"></td>
            </tr>
            <tr>
                <td> Mô tả : </td>
                <td><input type="text" name="moTa" id="moTa" value="${product.getMoTaSanPham()}"></td>
            </tr>
            <tr>
                <td> Hãng sản xuất : </td>
                <td><input type="text" name="nhaSX" id="nhaSX" value="${product.getNhaSanXuat()}"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Edit product"></td>
            </tr>
        </table>

    </fieldset>

</form>
</body>

