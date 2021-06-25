<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 6/24/2021
  Time: 9:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p>Lượng chiết khấu là : ${gia * phanTram * 0.01} </p>

<br>
<p>Giá sau khi đã được chiết khấu là : ${gia - (gia * phanTram * 0.01)}</p>

</body>
</html>
