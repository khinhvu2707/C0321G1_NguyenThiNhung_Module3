<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 7/5/2021
  Time: 4:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<header class="container-fluid bg-light d-flex sticky-top">
    <div class="col-lg-3">
        <img width="60px" height="60px" src="https://upload.wikimedia.org/wikipedia/vi/1/14/Bieu_Tuong_Hogwarts.jpg">
    </div>
    <div class="col-lg-6"></div>
    <div class="col-lg-3 d-flex justify-content-end">
        <p style="padding-top: 20px">Tình Tuyết</p>
        <img width="30px" height="30px" src="https://i2.wp.com/dl8.glitter-graphics.net/pub/1252/1252978iual7aoqdc.gif?zoom=2">
    </div>
</header>
<%--carouse--%>
<div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
        <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
        <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="assert/image/hg2.jpg" class="d-block w-100 h-50" alt="...">
            <div class="carousel-caption d-none d-md-block">
                <h5>Welcome to Resort Furoma</h5>
            </div>
        </div>
        <div class="carousel-item">
            <img src="assert/image/hg4.jpg" class="d-block w-100 h-50" alt="...">
        </div>
        <div class="carousel-item">
            <img src="assert/image/hg3.jpg" class="d-block w-100 h-50" alt="...">
            <div class="carousel-caption d-none d-md-block">
                <p>Best place for spend your Holiday!</p>
            </div>
        </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>

<%--navbar--%>
<nav class="navbar navbar-expand-lg navbar-light bg-light border ">
    <a class="navbar-brand ml-5" href="/home">Home</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="navbar-brand ml-3" href="#"></a>
                <a class="navbar-brand ml-5" href="/employee?action=show">Employee</a>
            </li>
            <li class="nav-item">
                <a class="navbar-brand ml-3" href="#"></a>
                <a class="navbar-brand ml-5" href="/customers?action=show" >Customer</a>
            </li>
            <li class="nav-item">
                <a class="navbar-brand ml-3" href="#"></a>
                <a class="navbar-brand ml-5" href="/service?action=show">Service</a>
            </li>
            <li class="nav-item">
                <a class="navbar-brand ml-3" href="#"></a>
                <a class="navbar-brand ml-5" href="/contract?action=show">Contract</a>
            </li>
            <li class="nav-item">
                <a class="navbar-brand ml-3" href="#"></a>
                <a class="navbar-brand ml-5" href="/contractDetail?action=show">ContractDetail</a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            <a class="navbar-brand ml-5" href="#"></a>
        </form>
    </div>
</nav>

