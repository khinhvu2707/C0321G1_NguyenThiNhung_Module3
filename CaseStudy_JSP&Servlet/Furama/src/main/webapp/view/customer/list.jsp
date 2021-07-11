<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 7/5/2021
  Time: 10:55 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="assert/bootstrap4/css/bootstrap.css">
    <link rel="stylesheet" href="assert/datatables/css/dataTables.bootstrap4.min.css"/>
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
            <%--Customer--%>
                <nav class="navbar navbar-light bg-light">
                    <a class="btn btn-primary" href="/customers?action=create" role="button">Create</a>
                    <form class="form-inline" action="/customers?action=search" method="post">
                        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="name">
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                    </form>
                </nav>
<table class="table" id="tableCustomers"  style="overflow-x:scroll; max-width: 100%; display: inline-block">
    <thead>
    <tr class="table-warning">
        <th scope="col">Customer Id</th>
        <th scope="col">Customer Code</th>
        <th scope="col">Customer Type Id</th>
        <th scope="col">Customer Name</th>
        <th scope="col">Customer Birthday</th>
        <th scope="col">Customer Gender</th>
        <th scope="col">Customer Id Card</th>
        <th scope="col">Customer Phone</th>
        <th scope="col">Customer Email</th>
        <th scope="col">Customer Address</th>
        <th scope="col">Edit</th>
        <th scope="col">Delete</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${customers}" var="result">
        <tr>
            <td>${result.customerId}</td>
            <td>${result.customerCode}</td>
            <td>${result.customerTypeId}</td>
            <td>${result.customerName}</td>
            <td>${result.customerBirthday}</td>
            <td>${result.customerGender}</td>
            <td>${result.customerIdCard}</td>
            <td>${result.customerPhone}</td>
            <td>${result.customerEmail}</td>
            <td>${result.customerAddress}</td>
            <td><a class="btn btn-success" href="/customers?action=edit&id=${result.customerId}" role="button">Edit</a></td>
            <td><a onclick="ondelete('${result.customerId}','${result.customerName}')" class="btn btn-danger"
                   role="button" data-toggle="modal" data-target="#modelId">Delete</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>


<!-- Modal -->
<div class="modal fade" id="modelId" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="/customers">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="id" value="" id="idCustomerDelete">
                <div class="modal-body">
                    <div class="container-fluid">
                        Bạn có chắc chắn muốn xóa khách hàng <input style="border: none;outline: none;color: red"
                                                                  id="nameCustomerDelete">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Không</button>
                    <button type="submit" class="btn btn-success">Xóa</button>
                </div>
            </form>
        </div>
    </div>
</div>
<%--Customer--%>

        </div>
    </div>
</div>
<%@ include file="/view/footer.jsp" %>

<script>
    function ondelete(id, name) {
        document.getElementById("idCustomerDelete").value = id;
        document.getElementById("nameCustomerDelete").value = name;
    }
</script>
<script src="assert/jquery/jquery-3.5.1.min.js"></script>
<script src="assert/jquery/popper.min.js"></script>
<script src="assert/datatables/js/jquery.dataTables.min.js"></script>
<script src="assert/datatables/js/dataTables.bootstrap4.min.js"></script>
<script src="assert/bootstrap4/js/bootstrap.js"></script>
<script>
    $(document).ready(function () {
        $('#tableCustomers').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>

</body>
</html>

