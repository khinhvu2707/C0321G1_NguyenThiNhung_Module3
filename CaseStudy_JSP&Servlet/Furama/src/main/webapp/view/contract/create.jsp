<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 7/5/2021
  Time: 5:40 PM
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
            <form action="/contract" method="post">
                <input type="hidden" name="action" value="create">
                <table>

                    <tr>
                        <td> Contract Start Date:</td>
                        <td><input type="text" class="form-control" id="contractStartDate" aria-describedby="contractStartDate" name="contractStartDate" value="${contract.contractStartDate}">
                            <c:if test="${messStartDate != null}">
                                <small id="contractStartDate" class="form-text text-danger">${messStartDate}</small>
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <td> Contract End Date:</td>
                        <td><input type="text" class="form-control" id="contractEndDate" aria-describedby="contractEndDate" name="contractEndDate" value="${contract.contractEndDate}">
                            <c:if test="${messEndDate != null}">
                                <small id="contractEndDate" class="form-text text-danger">${messEndDate}</small>
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <td> Contract Deposit :</td>
                        <td><input type="text" class="form-control" id="contractDeposit" aria-describedby="contractDeposit" name="contractDeposit" value="${contract.contractDeposit}">
                            <c:if test="${messDeposit != null}">
                                <small id="contractDeposit" class="form-text text-danger">${messDeposit}</small>
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <td> Contract Total Money:</td>
                        <td><input type="text" class="form-control" id="contractTotalMoney" aria-describedby="contractTotalMoney" name="contractTotalMoney" value="${contract.contractTotalMoney}">
                            <c:if test="${messMoney != null}">
                                <small id="contractTotalMoney" class="form-text text-danger">${messMoney}</small>
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <td> Employee Id :</td>
                        <td><input type="text" class="form-control" id="employeeId" aria-describedby="employeeId" name="employeeId" value="${contract.employeeId}"></td>

                    </tr>
                    <tr>
                        <td> Customer Id :</td>
                        <td><input type="text" class="form-control" id="customerId" aria-describedby="customerId" name="customerId" value="${contract.customerId}"></td>

                    </tr>
                    <tr>
                        <td> Service Id :</td>
                        <td><input type="text" class="form-control" id="serviceId" aria-describedby="serviceId" name="serviceId" value="${contract.serviceId}"></td>

                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Create contract"></td>
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


