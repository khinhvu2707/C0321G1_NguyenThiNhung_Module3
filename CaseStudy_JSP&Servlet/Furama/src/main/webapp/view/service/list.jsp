<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 7/5/2021
  Time: 5:39 PM
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
                <a class="btn btn-primary" href="/service?action=create" role="button">Create</a>
                <form class="form-inline" action="/service?action=search" method="post">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="name">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>
            </nav>
            <table class="table" id="tableService" style="overflow-x:scroll; max-width: 100%; display: inline-block">
                <thead>
                <tr>
                    <th scope="col">Service Id</th>
                    <th scope="col">Service Code</th>
                    <th scope="col">Service Name</th>
                    <th scope="col">Srvice Area</th>
                    <th scope="col">Service Cost</th>
                    <th scope="col">Service Max People</th>
                    <th scope="col">Rent Type Id</th>
                    <th scope="col">Service Type Id</th>
                    <th scope="col">Standard Room</th>
                    <th scope="col">Description Other Convenience</th>
                    <th scope="col">Pool Area</th>
                    <th scope="col">Number Of Floor</th>
                    <th scope="col">Edit</th>
                    <th scope="col">Delete</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${services}" var="result">
                    <tr>
                        <td>${result.serviceId}</td>
                        <td>${result.serviceCode}</td>
                        <td>${result.serviceName}</td>
                        <td>${result.serviceArea}</td>
                        <td>${result.serviceCost}</td>
                        <td>${result.serviceMaxPeople}</td>
                        <td>${result.rentTypeId}</td>
                        <td>${result.serviceTypeId}</td>
                        <td>${result.standardRoom}</td>
                        <td>${result.descriptionOtherConvenience}</td>
                        <td>${result.poolArea}</td>
                        <td>${result.numberOfFloor}</td>
                        <td><a class="btn btn-success" href="/service?action=edit&id=${result.serviceId}" role="button">Edit</a></td>
                        <td><a onclick="ondelete('${result.serviceId}','${result.serviceName}')" class="btn btn-danger"
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
                        <form action="/service">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="id" value="" id="idDelete">
                            <div class="modal-body">
                                <div class="container-fluid">
                                    Bạn có chắc chắn muốn xóa dịch vụ <input style="border: none;outline: none;color: red"
                                                                                id="nameDelete">
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
        document.getElementById("idDelete").value = id;
        document.getElementById("nameDelete").value = name;
    }
</script>
<script src="assert/jquery/jquery-3.5.1.min.js"></script>
<script src="assert/jquery/popper.min.js"></script>
<script src="assert/datatables/js/jquery.dataTables.min.js"></script>
<script src="assert/datatables/js/dataTables.bootstrap4.min.js"></script>
<script src="assert/bootstrap4/js/bootstrap.js"></script>
<script>
    $(document).ready(function () {
        $('#tableService').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>

</body>
</html>


