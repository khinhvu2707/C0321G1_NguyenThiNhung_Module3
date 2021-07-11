<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 7/5/2021
  Time: 11:03 AM
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
    <div class="row">
        <div class="col-lg-2 border-right">
            <ul>
                <li>Item One</li>
                <img width="70%" src="https://upload.wikimedia.org/wikipedia/vi/9/98/Gryffindor.jpg">
                <li>Item Two</li>
                <img width="70%" src="https://upload.wikimedia.org/wikipedia/vi/e/e4/Hufflepuff.jpg">
                <li>Item There</li>
                <img width="70%" src="https://upload.wikimedia.org/wikipedia/vi/5/55/Ravenclaw.jpg">
                <li>Item Four</li>
                <img width="70%" src="https://upload.wikimedia.org/wikipedia/vi/6/6e/Slytherin.jpg">
            </ul>
        </div>
        <div class="col-lg-10 pt-3 pb-3">
            <%--edit--%>
            <h2>Edit Customer</h2>
                <form action="/customers" method="post">
                    <input type="hidden" name="action" value="edit">
                <fieldset>
                    <legend>Customer Information</legend>
                    <table>
                        <tr>
                            <td> Customer Id:</td>
                            <td><input class="form-control" type="text" name="customerId" id="customerId" value="${customer.customerId}">
                            </td>
                        </tr>
                        <tr>
                            <td> Customer Code :</td>
                            <td><input type="text" class="form-control" id="customerCode" aria-describedby="customerCode" name="customerCode" value="${customer.customerCode}">
                                <c:if test="${messCode != null}">
                                    <small id="customerCode" class="form-text text-danger">${messCode}</small>
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <td> Customer Type Id:</td>
                            <td>
                                <select class="form-control" name="customerTypeId" id="customerTypeId" value="${customer.customerTypeId}">
                                    <option value="1" ${customer.customerTypeId == 1 ? 'selected': ''}>Diamond</option>
                                    <option value="2" ${customer.customerTypeId == 2 ? 'selected': ''}>Platinium</option>
                                    <option value="3" ${customer.customerTypeId == 3 ? 'selected': ''}>Gold</option>
                                    <option value="4" ${customer.customerTypeId == 4 ? 'selected': ''}>Silver</option>
                                    <option value="5" ${customer.customerTypeId == 5 ? 'selected': ''}>Member</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td> Customer Name :</td>
                            <td><input type="text" class="form-control" id="customerName" aria-describedby="customerName" name="customerName" value="${customer.customerName}">
                                <c:if test="${messName != null}">
                                    <small id="customerName" class="form-text text-danger">${messName}</small>
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <td> Customer Birthday :</td>
                            <td><input type="text" class="form-control" id="customerBirthday" aria-describedby="customerBirthday" name="customerBirthday" value="${customer.customerBirthday}">
                                <c:if test="${messBirthday != null}">
                                    <small id="customerBirthday" class="form-text text-danger">${messBirthday}</small>
                                </c:if></td>
                        </tr>
                        <tr>
                            <td> Customer Gender :</td>
                            <td>
                                <select class="form-control" name="customerGender" id="customerGender" value="${customer.customerGender}">
                                    <option value="0" ${customer.customerGender == 0 ? 'selected': ''}>Male</option>
                                    <option value="1" ${customer.customerGender == 1 ? 'selected': ''}>FeMale</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td> Customer Id Card :</td>
                            <td><input type="text" class="form-control" id="customerIdCard" aria-describedby="customerIdCard" name="customerIdCard" value="${customer.customerIdCard}">
                                <c:if test="${customerIdCard != null}">
                                    <small id="name_stu" class="form-text text-danger">${messIdCard}</small>
                                </c:if></td>
                        </tr>
                        <tr>
                            <td> CustomerPhone :</td>
                            <td><input type="text" class="form-control" id="customerPhone" aria-describedby="customerPhone" name="customerPhone" value="${customer.customerPhone}">
                                <c:if test="${messPhone != null}">
                                    <small id="customerPhone" class="form-text text-danger">${messPhone}</small>
                                </c:if></td>
                        </tr>
                        <tr>
                            <td> CustomerEmail :</td>
                            <td><input type="text" class="form-control" id="customerEmail" aria-describedby="customerEmail" name="customerEmail" value="${customer.customerEmail}">
                                <c:if test="${messEmail != null}">
                                    <small id="customerEmail" class="form-text text-danger">${messEmail}</small>
                                </c:if></td>
                        </tr>
                        <tr>
                            <td> CustomerAddress :</td>
                            <td><input class="form-control" type="text" name="customerAddress" id="customerAddress"
                                       value="${customer.customerAddress}"></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit" value="Edit customer"></td>
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


