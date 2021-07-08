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
    <title>Edit Contract</title>
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
            <h2>Edit Contract</h2>
            <form method="post">
                <fieldset>
                    <legend>Contract Information</legend>
                    <table>
                        <tr>
                            <td> Contract Id:</td>
                            <td><input type="text" name="contractId" id="contractId" value="${contracts.contractId}"></td>
                        </tr>
                        <tr>
                            <td> Contract Start Date:</td>
                            <td><input type="text" name="contractStartDate" id="contractStartDate" value="${contracts.contractStartDate}"></td>
                        </tr>
                        <tr>
                            <td> Contract End Date :</td>
                            <td><input type="text" name="contractEndDate" id="contractEndDate" value="${contracts.contractEndDate }"></td>
                        </tr>
                        <tr>
                            <td> Contract Deposit :</td>
                            <td><input type="text" name="contractDeposit" id="contractDeposit" value="${contracts.contractDeposit}"></td>
                        </tr>
                        <tr>
                            <td> Contract Total Money :</td>
                            <td><input type="text" name="contractTotalMoney" id="contractTotalMoney" value="${contracts.contractTotalMoney}"></td>
                        </tr>
                        <tr>
                            <td> Employee Id :</td>
                            <td><input type="text" name="employeeId" id="employeeId" value="${contracts.employeeId}"></td>
                        </tr>
                        <tr>
                            <td> Customer Id :</td>
                            <td><input type="text" name="customerId" id="customerId" value="${contracts.customerId}"></td>
                        </tr>
                        <tr>
                            <td> Service Id :</td>
                            <td><input type="text" name="serviceId" id="serviceId" value="${contracts.serviceId}"></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit" value="Edit contract"></td>
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


