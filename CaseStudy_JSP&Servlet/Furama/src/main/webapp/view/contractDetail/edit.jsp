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
    <title>Edit ContractDetail</title>
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
            <h2>Edit ContractDetail</h2>
            <form method="post">
                <fieldset>
                    <legend>ContractDetail Information</legend>
                    <table>
                        <tr>
                            <td> Contract Detail Id:</td>
                            <td><input type="text" name="contractDetailId" id="contractDetailId" value="${contractDetails.contractDetailId}"></td>
                        </tr>
                        <tr>
                            <td> Contract Id:</td>
                            <td><input type="text" name="contractId" id="contractId" value="${contractDetails.contractId}"></td>
                        </tr>
                        <tr>
                            <td> Attach Service Id:</td>
                            <td>
                                <select name="attachServiceId" id="attachServiceId" value="${contractDetails.attachServiceId}">
                                    <option value="1" ${contractDetails.attachServiceId== 1 ? 'selected': ''}>Massage</option>
                                    <option value="2" ${contractDetails.attachServiceId== 2 ? 'selected': ''}>Karaoke</option>
                                    <option value="3" ${contractDetails.attachServiceId== 3 ? 'selected': ''}>Food</option>
                                    <option value="4" ${contractDetails.attachServiceId== 4 ? 'selected': ''}>Drink</option>
                                    <option value="5" ${contractDetails.attachServiceId== 5 ? 'selected': ''}>Car</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td> Quantity :</td>
                            <td><input type="text" name="quantity" id="quantity" value="${contractDetails.quantity}"></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit" value="Edit ContractDetail"></td>
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


