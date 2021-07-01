
<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 6/29/2021
  Time: 1:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="assert/bootstrap4/css/bootstrap.css">
    <link rel="stylesheet" href="assert/datatables/css/dataTables.bootstrap4.min.css" />
</head>
<body>

<div style="margin: 10px 20px;">
    <a class="btn btn-primary" href="/products?action=create" role="button">Create</a>
</div>
<div style="margin: 10px 20px;">
    <form action="/products?action=search" method="post">
        <input type="text" name="name" placeholder="Tìm kiếm">
        <input type="submit" value="Tìm kiếm sản phẩm">
    </form>
</div>
<table class="table" id="tableStudent">
    <thead>
    <tr>
        <th scope="col">ID</th>
        <th scope="col">Tên sản phẩm</th>
        <th scope="col">Giá sản phẩm</th>
        <th scope="col">Mô tả sản phẩm</th>
        <th scope="col">Nhà sản xuất</th>
        <th scope="col">Sửa</th>
        <th scope="col">Xóa</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${product}" var="products">
        <tr>
            <td>${products.id}</td>
            <td>${products.tenSanPham}</td>
            <td>${products.giaSanPham}</td>
            <td>${products.moTaSanPham}</td>
            <td>${products.nhaSanXuat}</td>
            <td><a  class="btn btn-primary" href="/products?action=edit&id=${products.id}" role="button">Edit</a></td>
            <td><a onclick="ondelete('${products.id}','${products.tenSanPham}')" class="btn btn-primary"
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
            <form action="/products">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="id" value="" id="idProductDelete">
                <div class="modal-body">
                    <div class="container-fluid">
                        Bạn có chắc chắn muốn xóa sản phẩm <input style="border: none;outline: none;color: red"
                                                                  id="nameProductDelete">
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

<script>
    function ondelete(id, name) {
        document.getElementById("idProductDelete").value = id;
        document.getElementById("nameProductDelete").value = name;
    }
</script>
<script src="assert/jquery/jquery-3.5.1.min.js"></script>
<script src="assert/jquery/popper.min.js"></script>
<script src="assert/datatables/js/jquery.dataTables.min.js"></script>
<script src="assert/datatables/js/dataTables.bootstrap4.min.js"></script>
<script src="assert/bootstrap4/js/bootstrap.js"></script>
<script>
    $(document).ready(function() {
        $('#tableStudent').dataTable( {
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        } );
    } );
</script>
</body>
</html>
