<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 7/5/2021
  Time: 5:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Customer</title>
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
            <%--edit--%>
            <h2>Edit Service</h2>
            <form method="post">
                <fieldset>
                    <legend>Service Information</legend>
                    <table>
                        <tr>
                            <td> Service Id:</td>
                            <td><input type="text" name="serviceId" id="serviceId" value="${services.serviceId}"></td>
                        </tr>
                        <tr>
                            <td> Service Code:</td>
                            <td><input type="text" name="serviceCode" id="serviceCode" value="${services.serviceCode}"></td>
                        </tr>
                        <tr>
                            <td> Service Name:</td>
                            <td><input type="text" name="serviceName" id="serviceName" value="${services.serviceName}"></td>
                        </tr>
                        <tr>
                            <td> Service Area :</td>
                            <td><input type="text" name="serviceArea" id="serviceArea" value="${services.serviceArea }"></td>
                        </tr>
                        <tr>
                            <td> Service Cost :</td>
                            <td><input type="text" name="serviceCost" id="serviceCost" value="${services.serviceCost}"></td>
                        </tr>
                        <tr>
                            <td> Service Max People :</td>
                            <td><input type="text" name="serviceMaxPeople" id="serviceMaxPeople" value="${services.serviceMaxPeople}"></td>
                        </tr>
                        <tr>
                            <td> Rent Type Id :</td>
                            <td>
                                <select class="form-control" name="rentTypeId" id="rentTypeId" value="${services.rentTypeId}">
                                    <option value="1" ${services.rentTypeId == 1 ? 'selected': ''}>Year</option>
                                    <option value="2" ${services.rentTypeId == 2 ? 'selected': ''}>Month</option>
                                    <option value="3" ${services.rentTypeId == 3 ? 'selected': ''}>Day</option>
                                    <option value="4" ${services.rentTypeId == 4 ? 'selected': ''}>House</option>
                                </select>
                            </td>

                        </tr>
                        <tr>
                            <td> Service Type Id :</td>
                            <td>
                                <select class="form-control" name="serviceTypeId" id="serviceTypeId" value="${services.serviceTypeId}">
                                    <option value="1" ${services.serviceTypeId == 1 ? 'selected': ''}>Villa</option>
                                    <option value="2" ${services.serviceTypeId == 2 ? 'selected': ''}>House</option>
                                    <option value="3" ${services.serviceTypeId == 3 ? 'selected': ''}>Room</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td> Standard Room :</td>
                            <td><input type="text" name="standardRoom" id="standardRoom" value="${services.standardRoom}"></td>
                        </tr>
                        <tr>
                            <td> Description Other Convenience :</td>
                            <td><input type="text" name="descriptionOtherConvenience" id="descriptionOtherConvenience" value="${services.descriptionOtherConvenience}"></td>
                        </tr>
                        <tr>
                            <td> Pool Area :</td>
                            <td><input type="text" name="poolArea" id="poolArea" value="${services.poolArea}"></td>
                        </tr>
                        <tr>
                            <td> Number Of Floor :</td>
                            <td><input type="text" name="numberOfFloor" id="numberOfFloor" value="${services.numberOfFloor}"></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit" value="Edit service"></td>
                        </tr>
                    </table>

                </fieldset>

            </form>
            <%--/edit--%>

        </div>
    </div>
</div>
<%@ include file="/view/footer.jsp" %>

<script src="assert/jquery/jquery-3.5.1.min.js"></script>
<script src="assert/jquery/popper.min.js"></script>
<script src="assert/bootstrap4/js/bootstrap.js"></script>
</body>


