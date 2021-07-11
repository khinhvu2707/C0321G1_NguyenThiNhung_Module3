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
            <%--create--%>
            <form action="/employee" method="post">
                <input type="hidden" name="action" value="create">
                <table>
                    <tr>
                        <td>Employee Name:</td>
                        <td><input type="text" class="form-control" id="employeeName" aria-describedby="employeeName"
                                   name="employeeName" value="${employee.employeeName}">
                            <c:if test="${messName != null}">
                                <small id="employeeName" class="form-text text-danger">${messName}</small>
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <td> Employee Birthday:</td>
                        <td><input type="date" class="form-control" id="employeeBirthday"
                                   aria-describedby="employeeBirthday" name="employeeBirthday"
                                   value="${employee.employeeBirthday}">
                            <c:if test="${messBirthday != null}">
                                <small id="employeeBirthday" class="form-text text-danger">${messBirthday}</small>
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <td> Employee Id Card :</td>
                        <td><input type="text" class="form-control" id="employeeIdCard"
                                   aria-describedby="employeeIdCard" name="employeeIdCard"
                                   value="${employee.employeeIdCard}">
                            <c:if test="${messIdCard != null}">
                                <small id="employeeIdCard" class="form-text text-danger">${messIdCard}</small>
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <td> Employee Salary:</td>
                        <td><input type="text" class="form-control" id="employeeSalary"
                                   aria-describedby="employeeSalary" name="employeeSalary"
                                   value="${employee.employeeSalary}">
                            <c:if test="${messSalary!= null}">
                                <small id="employeeSalary" class="form-text text-danger">${messSalary}</small>
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <td> Employee Phone:</td>
                        <td><input type="text" class="form-control" id="employeePhone" aria-describedby="employeePhone"
                                   name="employeePhone" value="${employee.employeePhone}">
                            <c:if test="${messPhone != null}">
                                <small id="employeePhone" class="form-text text-danger">${messPhone}</small>
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <td> Employee Email:</td>
                        <td><input type="text" class="form-control" id="employeeEmail" aria-describedby="employeeEmail"
                                   name="employeeEmail" value="${employee.employeeEmail}">
                            <c:if test="${messEmail != null}">
                                <small id="employeeEmail" class="form-text text-danger">${messEmail}</small>
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <td> Employee Address :</td>
                        <td><input type="text" class="form-control" id="employeeAddress"
                                   aria-describedby="employeeAddress" name="employeeAddress"
                                   value="${employee.employeeAddress}"></td>

                    </tr>
                    <tr>
                        <td> Position Id :</td>
                        <td>
                            <select name="positionId" id="positionId" value="${employee.positionId}">
                                <option value="1" ${employee.positionId == 1 ? 'selected': ''}>Lễ Tân</option>
                                <option value="2" ${employee.positionId == 2 ? 'selected': ''}>Phục vụ</option>
                                <option value="3" ${employee.positionId == 3 ? 'selected': ''}>Chuyên viên</option>
                                <option value="4" ${employee.positionId == 4 ? 'selected': ''}>Giám sát</option>
                                <option value="5" ${employee.positionId == 5 ? 'selected': ''}>Quản lý</option>
                                <option value="6" ${employee.positionId == 6 ? 'selected': ''}>Giám đốc</option>
                            </select>
                        </td>

                    </tr>
                    <tr>
                        <td> Education Degree Id :</td>
                        <td>
                            <select name="educationDegreeId" id="educationDegreeId" value="${employee.educationDegreeId}">
                                <option value="1"  ${employee.educationDegreeId == 1 ? 'selected': ''}>Trung cấp</option>
                                <option value="2" ${employee.educationDegreeId == 2 ? 'selected': ''}>Cao đẳng</option>
                                <option value="3" ${employee.educationDegreeId == 3 ? 'selected': ''}>Đại học</option>
                                <option value="4" ${employee.educationDegreeId == 4 ? 'selected': ''}>Sau đại học</option>
                            </select>
                        </td>

                    </tr>
                    <tr>
                        <td> Division Id :</td>
                        <td>
                        <select name="divisionId" id="divisionId" value="${employee.divisionId}">
                            <option value="1" ${employee.divisionId == 1 ? 'selected': ''}>Sale – Marketing</option>
                            <option value="2" ${employee.divisionId == 2 ? 'selected': ''}>Hành Chính</option>
                            <option value="3" ${employee.divisionId == 3 ? 'selected': ''}>Phục Vụ</option>
                            <option value="4" ${employee.divisionId == 4 ? 'selected': ''}>Quản Lý</option>
                        </select>
                        </td>
                    </tr>
                    <tr>
                        <td> Username :</td>
                        <td><input type="text" class="form-control" id="username" aria-describedby="username"
                                   name="username" value="${employee.username}"></td>

                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Create employee"></td>
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


