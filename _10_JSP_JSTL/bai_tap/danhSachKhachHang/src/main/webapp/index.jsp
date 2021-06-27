<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 6/26/2021
  Time: 4:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <h2 style="width: 60%;text-align: center">Danh sách Khách Hàng</h2>
  <table style="width: 60%">
    <tr>
      <th style="border-bottom: 1px solid ;width: 15%;padding: 5px 0">Tên</th>
      <th style="border-bottom: 1px solid ;width: 15%;padding: 5px 0">Ngày Sinh</th>
      <th style="border-bottom: 1px solid ;width: 15%;padding: 5px 0">Địa chỉ</th>
      <th style="border-bottom: 1px solid ;width: 15%;padding: 5px 0">Ảnh</th>
    </tr>
    <c:forEach items="${listCustomers}" var="customers">
      <tr>
        <td style="border-bottom: 1px solid;padding: 5px 0;text-align: center">${customers.name}</td>
        <td style="border-bottom: 1px solid;padding: 5px 0;text-align: center">${customers.birthday}</td>
        <td style="border-bottom: 1px solid;padding: 5px 0;text-align: center">${customers.address}</td>
        <td style="border-bottom: 1px solid;padding: 5px 0;text-align: center"><img style="height: 50px;width: 50px" src="${customers.avatar}"> </td>
      </tr>
    </c:forEach>
  </table>
  </body>
</html>
