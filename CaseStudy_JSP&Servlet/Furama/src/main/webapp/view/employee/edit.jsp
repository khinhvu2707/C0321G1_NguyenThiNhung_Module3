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
            <h2>Edit Employee</h2>
            <form method="post">
                <fieldset>
                    <legend>Employee Information</legend>
                    <table>
                        <tr>
                            <td> Employee Id:</td>
                            <td><input type="text" name="employeeId" id="employeeId" value="${employees.employeeId}">
                            </td>
                        </tr>
                        <tr>
                            <td> Employee Name:</td>
                            <td><input type="text" name="employeeName" id="employeeName"
                                       value="${employees.employeeName}"></td>
                        </tr>
                        <tr>
                            <td> Employee Birthday :</td>
                            <td><input type="text" name="employeeBirthday" id="employeeBirthday"
                                       value="${employees.employeeBirthday }"></td>
                        </tr>
                        <tr>
                            <td> Employee Id Card :</td>
                            <td><input type="text" name="employeeIdCard" id="employeeIdCard"
                                       value="${employees.employeeIdCard}"></td>
                        </tr>
                        <tr>
                            <td> Employee Salary :</td>
                            <td><input type="text" name="employeeSalary" id="employeeSalary"
                                       value="${employees.employeeSalary}"></td>
                        </tr>
                        <tr>
                            <td> Employee Phone:</td>
                            <td><input type="text" name="employeePhone" id="employeePhone"
                                       value="${employees.employeePhone}"></td>
                        </tr>
                        <tr>
                            <td> Employee Email :</td>
                            <td><input type="text" name="employeeEmail" id="employeeEmail"
                                       value="${employees.employeeEmail}"></td>
                        </tr>
                        <tr>
                            <td> Employee Address :</td>
                            <td><input type="text" name="employeeAddress" id="employeeAddress"
                                       value="${employees.employeeAddress}"></td>
                        </tr>
                        <tr>
                            <td> Position Id :</td>
                            <td>
                                <%--                                <input type="text" name="positionId" id="positionId" value="${employees.positionId}">--%>
                                <select name="positionId" id="positionId" value="${employees.positionId}">
                                    <option value="1" ${employees.positionId == 1 ? 'selected': ''}>Lễ Tân</option>
                                    <option value="2" ${employees.positionId == 2 ? 'selected': ''}>Phục vụ</option>
                                    <option value="3" ${employees.positionId == 3 ? 'selected': ''}>Chuyên viên</option>
                                    <option value="4" ${employees.positionId == 4 ? 'selected': ''}>Giám sát</option>
                                    <option value="5" ${employees.positionId == 5 ? 'selected': ''}>Quản lý</option>
                                    <option value="6" ${employees.positionId == 6 ? 'selected': ''}>Giám đốc</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td> Education Degree Id :</td>
                            <td>
                                <%--                                <input type="text" name="educationDegreeId" id="educationDegreeId" value="${employees.educationDegreeId}">--%>
                                <select name="educationDegreeId" id="educationDegreeId"
                                        value="${employees.educationDegreeId}">
                                    <option value="1"  ${employees.educationDegreeId == 1 ? 'selected': ''}>Trung cấp
                                    </option>
                                    <option value="2" ${employees.educationDegreeId == 2 ? 'selected': ''}>Cao đẳng
                                    </option>
                                    <option value="3" ${employees.educationDegreeId == 3 ? 'selected': ''}>Đại học
                                    </option>
                                    <option value="4" ${employees.educationDegreeId == 4 ? 'selected': ''}>Sau đại học
                                    </option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td> Division Id :</td>
                            <td>
                                <%--                                <input type="text" name="divisionId" id="divisionId" value="${employees.divisionId}">--%>
                                <select name="divisionId" id="divisionId" value="${employees.divisionId}">
                                    <option value="1" ${employees.divisionId == 1 ? 'selected': ''}>Sale – Marketing
                                    </option>
                                    <option value="2" ${employees.divisionId == 2 ? 'selected': ''}>Hành Chính</option>
                                    <option value="3" ${employees.divisionId == 3 ? 'selected': ''}>Phục Vụ</option>
                                    <option value="4" ${employees.divisionId == 4 ? 'selected': ''}>Quản Lý</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td> Username :</td>
                            <td><input type="text" name="username" id="username" value="${employees.username}"></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit" value="Edit Employee"></td>
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


