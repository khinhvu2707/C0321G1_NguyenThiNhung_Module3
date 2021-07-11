<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 7/5/2021
  Time: 10:55 AM
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
<%@ include file="/view/header.jsp" %>
<div class="container-fluid bg-light border ">
    <div class="row" >
        <div class="col-lg-2 border-right">
            <ul>
                <li>Item One</li>
                <img width="70%"  src="https://upload.wikimedia.org/wikipedia/vi/9/98/Gryffindor.jpg">
                <li>Item Two</li>
                <img width="70%"  src="https://upload.wikimedia.org/wikipedia/vi/e/e4/Hufflepuff.jpg">
                <li>Item There</li>
                <img width="70%"  src="https://upload.wikimedia.org/wikipedia/vi/5/55/Ravenclaw.jpg">
                <li>Item Four</li>
                <img width="70%"  src="https://upload.wikimedia.org/wikipedia/vi/6/6e/Slytherin.jpg">
            </ul>
        </div>
        <div class="col-lg-10 pt-3 pb-3">
<%--search--%>
<table class="table"  style="overflow-x:scroll; max-width: 100%; display: inline-block">
    <thead>
    <tr class="table-warning">
        <th scope="col">Customer Id</th>
        <th scope="col">Customer Code</th>
        <th scope="col">Customer Type Id</th>
        <th scope="col">Customer Name</th>
        <th scope="col">Customer Birthday</th>
        <th scope="col">Customer Gender</th>
        <th scope="col">Customer Id Card</th>
        <th scope="col">Customer Phone</th>
        <th scope="col">Customer Email</th>
        <th scope="col">Customer Address</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${customers}" var="result">
        <tr>
            <td>${result.customerId}</td>
            <td>${result.customerCode}</td>
            <td>${result.customerTypeId}</td>
            <td>${result.customerName}</td>
            <td>${result.customerBirthday}</td>
            <td>${result.customerGender}</td>
            <td>${result.customerIdCard}</td>
            <td>${result.customerPhone}</td>
            <td>${result.customerEmail}</td>
            <td>${result.customerAddress}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
    <%--/search--%>
        </div>
    </div>
</div>
<%@ include file="/view/footer.jsp" %>

<script src="assert/jquery/jquery-3.5.1.min.js"></script>
<script src="assert/jquery/popper.min.js"></script>
<script src="assert/bootstrap4/js/bootstrap.js"></script>
</body>
</html>


