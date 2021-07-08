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
    <title>Title</title>
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
            <%--create--%>
            <form action="/service" method="post">
                <input type="hidden" name="action" value="create">
                <table>
                    <tr>
                        <td> Service Code :</td>
                        <td><input type="text" class="form-control" id="serviceCode" aria-describedby="serviceCode" name="serviceCode" value="${service.serviceCode}">
                            <c:if test="${messCode != null}">
                                <small id="customerCode" class="form-text text-danger">${messCode}</small>
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <td> Service Name:</td>
                        <td><input type="text" class="form-control" id="serviceName" aria-describedby="serviceName" name="serviceName" value="${service.serviceName}"></td>
                    </tr>
                    <tr>
                        <td> Service Area :</td>
                        <td><input type="text" class="form-control" id="serviceArea" aria-describedby="serviceArea" name="serviceArea" value="${service.serviceArea}">
                            <c:if test="${messArea != null}">
                                <small id="customerCode" class="form-text text-danger">${messArea}</small>
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <td> Service Cost :</td>
                        <td><input type="text" class="form-control" id="serviceCost" aria-describedby="serviceCost" name="serviceCost" value="${service.serviceCost}">
                            <c:if test="${messCost != null}">
                                <small id="customerCode" class="form-text text-danger">${messCost}</small>
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <td> Service Max People:</td>
                        <td><input type="text" class="form-control" id="serviceMaxPeople" aria-describedby="serviceMaxPeople" name="serviceMaxPeople" value="${service.serviceMaxPeople}">
                            <c:if test="${messMaxPeople != null}">
                                <small id="customerCode" class="form-text text-danger">${messMaxPeople}</small>
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <td> Rent Type Id :</td>
                        <td>
                            <select name="rentTypeId" id="rentTypeId" value="${service.rentTypeId}">
                                <option value="1" ${service.rentTypeId == 1 ? 'selected': ''}>Year</option>
                                <option value="2" ${service.rentTypeId == 2 ? 'selected': ''}>Month</option>
                                <option value="3" ${service.rentTypeId == 3 ? 'selected': ''}>Day</option>
                                <option value="4" ${service.rentTypeId == 4 ? 'selected': ''}>House</option>
                            </select>
                        </td>

                    </tr>
                    <tr>
                        <td> Service Type Id :</td>
                        <td>
                            <select name="serviceTypeId" id="serviceTypeId" value="${service.serviceTypeId}">
                                <option value="1" ${service.serviceTypeId == 1 ? 'selected': ''}>Villa</option>
                                <option value="2" ${service.serviceTypeId == 2 ? 'selected': ''}>House</option>
                                <option value="3" ${service.serviceTypeId == 3 ? 'selected': ''}>Room</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td> Standard Room :</td>
                        <td><input type="text" class="form-control" id="standardRoom" aria-describedby="standardRoom" name="standardRoom" value="${service.standardRoom}"></td>

                    </tr>
                    <tr>
                        <td> Description Other Convenience :</td>
                        <td><input type="text" class="form-control" id="descriptionOtherConvenience" aria-describedby="descriptionOtherConvenience" name="descriptionOtherConvenience" value="${service.descriptionOtherConvenience}"></td>

                    </tr>
                    <tr>
                        <td> Pool Area:</td>
                        <td><input type="text" class="form-control" id="poolArea" aria-describedby="poolArea" name="poolArea" value="${service.poolArea}">
                            <c:if test="${messPoolArea != null}">
                                <small id="customerCode" class="form-text text-danger">${messPoolArea}</small>
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <td> Number Of Floor:</td>
                        <td><input type="text" class="form-control" id="numberOfFloor" aria-describedby="numberOfFloor" name="numberOfFloor" value="${service.numberOfFloor}">
                            <c:if test="${messNumberOfFloor != null}">
                                <small id="customerCode" class="form-text text-danger">${messNumberOfFloor}</small>
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Create product"></td>
                    </tr>
                </table>
            </form>
            <%--/create--%>
        </div>
    </div>
</div>
<%@ include file="/view/footer.jsp" %>

<script src="assert/jquery/jquery-3.5.1.min.js"></script>
<script src="assert/jquery/popper.min.js"></script>
<script src="assert/bootstrap4/js/bootstrap.js"></script>
</body>
</html>

