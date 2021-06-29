<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 6/28/2021
  Time: 11:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create new Product</title>
    <style>
        .message {
            color: purple;
        }
    </style>
</head>
<body>
<h2>Create new Product</h2>
<p>
    <c:if test='${requestScope["message"] !=null}' >
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<p>
    <a href="/products">Back to Product List</a>
</p>
<form method="post">
    <fieldset>
        <legend>Product Information</legend>
        <table>
<%--            <tr>--%>
<%--                <td> ID : </td>--%>
<%--                <td><input type="text" name="id" id="id"></td>--%>
<%--            </tr>--%>
            <tr>
                <td> Tên sản phẩm : </td>
                <td><input type="text" name="ten" id="ten"></td>
            </tr>
            <tr>
                <td> Giá sản phẩm : </td>
                <td><input type="text" name="gia" id="gia"></td>
            </tr>
            <tr>
                <td> Mô tả : </td>
                <td><input type="text" name="moTa" id="moTa"></td>
            </tr>
            <tr>
                <td> Hãng sản xuất : </td>
                <td><input type="text" name="nhaSX" id="nhaSX"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Create product"></td>
            </tr>
        </table>

    </fieldset>

</form>
</body>
</html>
