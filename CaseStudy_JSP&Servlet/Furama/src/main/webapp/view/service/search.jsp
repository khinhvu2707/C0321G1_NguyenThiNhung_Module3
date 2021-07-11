<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 7/5/2021
  Time: 5:40 PM
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
            <table class="table" style="overflow-x:scroll; max-width: 100%; display: inline-block">
                <thead>
                <tr class="table-primary">
                    <th scope="col">Service Id</th>
                    <th scope="col">Service Code</th>
                    <th scope="col">Service Name</th>
                    <th scope="col">Srvice Area</th>
                    <th scope="col">Service Cost</th>
                    <th scope="col">Service Max People</th>
                    <th scope="col">Rent Type Id</th>
                    <th scope="col">Service Type Id</th>
                    <th scope="col">Standard Room</th>
                    <th scope="col">Description Other Convenience</th>
                    <th scope="col">Pool Area</th>
                    <th scope="col">Number Of Floor</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${services}" var="result">
                    <tr>
                        <td>${result.serviceId}</td>
                        <td>${result.serviceCode}</td>
                        <td>${result.serviceName}</td>
                        <td>${result.serviceArea}</td>
                        <td>${result.serviceCost}</td>
                        <td>${result.serviceMaxPeople}</td>
                        <td>${result.rentTypeId}</td>
                        <td>${result.serviceTypeId}</td>
                        <td>${result.standardRoom}</td>
                        <td>${result.descriptionOtherConvenience}</td>
                        <td>${result.poolArea}</td>
                        <td>${result.numberOfFloor}</td>
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



