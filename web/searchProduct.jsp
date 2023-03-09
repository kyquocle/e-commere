<%-- 
    Document   : searchProduct
    Created on : Feb 22, 2023, 3:26:49 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.Base64.*" %>
<%@ page import="java.util.List" %>
<%@ page import="dto.ProductDTO" %>
<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from askbootstrap.com/preview/osahan-eat/theme-sidebar/index.html?fbclid=IwAR0nwIFNYzgqHa21f49Nzv1kLbeDTnnIQIEIfRudCclQdwQMDTmsCY1Ovq4 by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 19 Oct 2022 05:04:30 GMT -->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" type="image/png" href="img/logo.png">
<title>ADMIN DASHBOARD</title>

<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

<link href="css/osahan.css" rel="stylesheet">

<link href="font/stylesheet.css" rel="stylesheet">

<link href="vendor/mdi-icons/css/materialdesignicons.min.css" rel="stylesheet">

<link href="css/custom.css" rel="stylesheet">
</head>
<body id="page-top">

<div id="wrapper">

<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

<a class="sidebar-brand d-flex align-items-center" href="index.jsp">
<div class="sidebar-brand-icon">
<img src="img/logo.png" class="img-fluid">
</div>
</a>

<li class="nav-item active">
<a class="nav-link" href="index.jsp">
<i class="mdi mdi-home-variant-outline"></i>
<span>Home</span></a>
</li>

<li class="nav-item">
<a class="nav-link" href="explore.jsp">
<i class="mdi mdi-grid-large"></i>
<span>Explore</span></a>
</li>

<li class="nav-item">
<a class="nav-link" href="favourities.jsp">
<i class="mdi mdi-bookmark-outline"></i>
<span>Favourities</span></a>
</li>

<li class="nav-item">
<a class="nav-link" href="orders.jsp">
<i class="mdi mdi-book-open"></i>
<span>Orders</span></a>
</li>

<li class="nav-item">
<a class="nav-link d-flex" href="messages.jsp">
<i class="mdi mdi-message-text-outline mr-2"></i>
<span>Messages</span>
<span class="rounded-circle bg-white text-primary ml-auto px-2 py-1">2</span></a>
</li>

<li class="nav-item">
<a class="nav-link" href="settings.jsp">
<i class="mdi mdi-cog"></i>
<span>Settings</span></a>
</li>

<li class="nav-item">
<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
<i class="fas fa-fw fa-cog"></i>
<span>Extra Pages</span>
</a>
<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
<div class="bg-white py-2 collapse-inner rounded">
<h6 class="collapse-header">Pages:</h6>
<a class="collapse-item" href="detail.jsp">Details</a>
<a class="collapse-item" href="listing.jsp">Listing</a>
<a class="collapse-item" href="messages.jsp">Messages</a>
<a class="collapse-item" href="search.jsp">Search</a>
<a class="collapse-item" href="buttons.jsp">Components</a>
 <a class="collapse-item" href="404.jsp">Page Not Found</a>
<h6 class="collapse-header">Account:</h6>
<a class="collapse-item" href="signin.jsp">Signin</a>
<a class="collapse-item" href="signup.jsp">Signup</a>
<a class="collapse-item" href="forgot.jsp">Forgot Password</a>
</div>
</div>
</li>

<div class="bg-white m-3 p-3 sidebar-alert rounded text-center alert fade show d-none d-md-inline" role="alert">
<button type="button" class="close" data-dismiss="alert" aria-label="Close">
<span aria-hidden="true">&times;</span>
</button>
<i class="mdi mdi-food mb-3"></i>
<p class="text-black mb-1">Free delivery on<br>all orders over <span class="text-primary">$25</span></p>
<p class="small">It is a limited time offer that will expire soon.</p>
<a href="explore.jsp" class="btn btn-primary btn-block btn-sm">Order now <i class="pl-3 fas fa-long-arrow-alt-right"></i></a>
</div>

<!--<div class="d-none d-md-block">
<div class="user d-flex align-items-center p-3">
<div class="pr-3"><i class="mdi mdi-account-circle-outline text-white h3 mb-0"></i></div>
<div>
<p class="mb-0 text-white">Mark Clarke</p>
<p class="mb-0 text-white-50 small"><a href="https://askbootstrap.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="afcad7cec2dfc3caefc8c2cec6c381ccc0c2">[email&#160;protected]</a></p>
</div>
</div>
</div>-->

<hr class="sidebar-divider d-none d-md-block">

<div class="text-center d-none d-md-inline">
<button class="rounded-circle border-0" id="sidebarToggle"></button>
</div>
</ul>


<div id="content-wrapper" class="d-flex flex-column">

<div id="content">

<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow-sm osahan-nav-top">

<button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
<i class="fa fa-bars"></i>
</button>

      <style>
        .dropdown-menu a {
            font-size: 15px;
            
        }
        .caret {
            font-size: 15px;
           
        }
    </style>
    <c:set var="name" value="${sessionScope.custName}" />
        <c:if test="${not empty name}">
           <li class="dropdown">
                                                <a href="#" data-toggle="dropdown" class="dropdown-toggle user-action"><svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
</svg>  <b class="caret"> ${sessionScope.custName} </b></a>
                                                <ul class="dropdown-menu">
                                                    <li><a href="#"><i class="fa fa-user-o"></i><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
  <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z"/>
</svg> Profile</a></li>
<!--                                                    <li><a href="#"><i class="fa fa-calendar-o"></i> Calendar</a></li>-->
                                                    <li><a href="settings.jsp"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-sliders" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M11.5 2a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zM9.05 3a2.5 2.5 0 0 1 4.9 0H16v1h-2.05a2.5 2.5 0 0 1-4.9 0H0V3h9.05zM4.5 7a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zM2.05 8a2.5 2.5 0 0 1 4.9 0H16v1H6.95a2.5 2.5 0 0 1-4.9 0H0V8h2.05zm9.45 4a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zm-2.45 1a2.5 2.5 0 0 1 4.9 0H16v1h-2.05a2.5 2.5 0 0 1-4.9 0H0v-1h9.05z"/>
</svg>  Settings</a></li>
                                                    <li class="divider"></li>
                                                    <li><a href="LogOutController"><i class="material-icons">&#xE8AC;</i> Logout</a></li>
                                                </ul>
                                            </li>  
        </c:if>
                         
    
<ul class="navbar-nav">

<li class="nav-item dropdown no-arrow d-sm-none">
<a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
<i class="fas fa-search fa-fw"></i>
</a>

<div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
<form class="form-inline mr-auto w-100 navbar-search">
<div class="input-group">
<input type="text" class="form-control bg-light" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
<div class="input-group-append">
<button class="btn btn-primary" type="button">
<i class="mdi mdi-magnify"></i>
</button>
</div>
</div>
</form>
</div>
</li>




 
<c:if test="${ empty name}">              
                                            <li class="nav-item dropdown no-arrow mx-2 osahan-t-loc">
<a class="nav-link dropdown-toggle text-dark" href="signin.jsp" >
<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-in-right" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M6 3.5a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 0-1 0v2A1.5 1.5 0 0 0 6.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-8A1.5 1.5 0 0 0 5 3.5v2a.5.5 0 0 0 1 0v-2z"/>
  <path fill-rule="evenodd" d="M11.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H1.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>
</svg><span class="ml-2">Sign in</span>
</a>
</li>

<li class="nav-item dropdown no-arrow mx-2 osahan-t-loc">
<a class="nav-link dropdown-toggle text-dark" href="signup.jsp" >
<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-in-up" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M3.5 10a.5.5 0 0 1-.5-.5v-8a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 .5.5v8a.5.5 0 0 1-.5.5h-2a.5.5 0 0 0 0 1h2A1.5 1.5 0 0 0 14 9.5v-8A1.5 1.5 0 0 0 12.5 0h-9A1.5 1.5 0 0 0 2 1.5v8A1.5 1.5 0 0 0 3.5 11h2a.5.5 0 0 0 0-1h-2z"/>
  <path fill-rule="evenodd" d="M7.646 4.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707V14.5a.5.5 0 0 1-1 0V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3z"/>
</svg><span class="ml-2">Sign up</span>
</a>
</li>
</c:if>

<li class="nav-item dropdown no-arrow mx-2 osahan-t-pu">
<a class="nav-link dropdown-toggle text-dark" href="orders.jsp">
<i class="mdi mdi-shopping text-danger"></i><span class="ml-2">Pick up</span>
</a>
</li>

<li class="nav-item dropdown no-arrow mx-2 osahan-t-bd">
<a class="nav-link dropdown-toggle text-dark" data-toggle="modal" data-target="#mycoupansModal" href="#">
<i class="mdi mdi-sack-percent text-warning"></i><span class="ml-2">Best Deals</span>
</a>
</li>
</ul>
    
       

<div class="ml-auto">
<a href="search.jsp">
<form class="d-none d-sm-inline-block form-inline mx-2 my-2 my-md-0 mw-100 navbar-search">
<div class="input-group">
<input type="text" class="form-control bg-light" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
<div class="input-group-append">
<button class="btn btn-primary" type="button">
<i class="mdi mdi-magnify"></i>
</button>
</div>
</div>
</form>
</a>
<a href="#" class="btn btn-primary " data-toggle="modal" data-target="#filtersModal"><i class="mdi mdi-filter-variant"></i></a>
<a href="#" class="btn btn-danger" data-toggle="modal" data-target="#cartModal"><i class="mdi mdi-shopping-outline"></i></a>
</div>
</nav>
    
    
    <style>
 .table-responsive {
        margin: 30px 0;
    }
	.table-wrapper {
        min-width: 1000px;
        background: #fff;
        padding: 20px 25px;
		border-radius: 3px;
        box-shadow: 0 1px 1px rgba(0,0,0,.05);
    }
	.table-title {
		padding-bottom: 15px;
		background: #c60021;
		color: white;
		padding: 16px 30px;
		margin: -20px -25px 10px;
		border-radius: 3px 3px 0 0;
    }
    .table-title h2 {
		margin: 5px 0 0;
		font-size: 24px;
	}
	.table-title .btn {
		color: #566787;
		float: right;
		font-size: 13px;
		background: #fff;
		border: none;
		min-width: 50px;
		border-radius: 2px;
		border: none;
		outline: none !important;
		margin-left: 10px;
	}
	.table-title .btn:hover, .table-title .btn:focus {
        color: #566787;
       
	}
	.table-title .btn i {
		float: left;
		font-size: 21px;
		margin-right: 5px;
	}
	.table-title .btn span {
		float: left;
		margin-top: 2px;
	}
    table.table tr th, table.table tr td {
        border-color: #e9e9e9;
		padding: 12px 15px;
		vertical-align: middle;
    }
	table.table tr th:first-child {
		width: 60px;
	}
	table.table tr th:last-child {
		width: 100px;
	}
    table.table-striped tbody tr:nth-of-type(odd) {
    	/*background-color: ;*/
	}
	table.table-striped.table-hover tbody tr:hover {
		
	}
    table.table th i {
        font-size: 13px;
        margin: 0 5px;
        cursor: pointer;
    }	
    table.table td:last-child i {
		opacity: 0.9;
		font-size: 22px;
        margin: 0 5px;
    }
	table.table td a {
		font-weight: bold;
		color: #566787;
		display: inline-block;
		text-decoration: none;
	}
	table.table td a:hover {
		color: #2196F3;
	}
	table.table td a.settings {
        color: #2196F3;
    }
    table.table td a.delete {
        color: #F44336;
    }
    table.table td i {
        font-size: 19px;
    }
	table.table .avatar {
		border-radius: 50%;
		vertical-align: middle;
		margin-right: 10px;
	}
	.status {
		font-size: 30px;
		margin: 2px 2px 0 0;
		display: inline-block;
		vertical-align: middle;
		line-height: 10px;
	}
        h2 {
            color: white;
        }
        h3 {
            color:#c60021
        }
</style>

<div class="container-fluid">

<div class="d-flex align-items-center justify-content-between mb-3 mt-2">
    
    <form action="MainController" method="POST">
                Search Keyword: <input type="text" name="txtSearchValue" value="" /> 
                <input type="submit" value="Find Product" name="btAction" />
                <input type="submit" value="SHOWIMG" name="btAction" />
                    

            </form>
<h5 class="mb-0">Search Result</h5>
</div>

    
<div class="row">
    <c:set var="context" value="${pageContext.request.contextPath}" />
    <c:if test="${not empty requestScope.PRO_RESULT}">
<c:set var="pa" value="${requestScope.PRO_RESULT}"/>
                <c:forEach var="result" items="${requestScope.PRO_RESULT}" varStatus="counter">
                    <form action="MainController">
<a href="#" class="text-decoration-none text-dark col-lg-3 col-md-6 mb-4" data-toggle="modal" data-target="#myitemsModal">
    <img src="data:image/jpg;base64,${result.base64ImageData}"  width="200px" height="200px"/>
    
<div class="d-flex align-items-center mt-3 mb-2">
<p class="text-black h6 m-0">${result.proName}</p>
<!--<input class="text-black h6 m-0" type="text" name="txtProname" value="${result.proName}" />-->
<span class="badge badge-light ml-auto"><i class='fas fa-dollar-sign'></i> ${result.price}</span>
</div>
<p class="small mb-2"><i class="mdi mdi-star text-warning"></i> <span class="font-weight-bold text-dark ml-1">4.8</span>(1,873) <i class="mdi mdi-silverware-fork-knife ml-2 mr-1"></i> ${result.catgoryName} <i class="mdi mdi-motorbike ml-2 mr-2"></i>Freeship</p>
</a>
    </form>
</c:forEach>
</c:if>
                   

                
<!--<a href="#" class="text-decoration-none text-dark col-lg-3 col-md-6 mb-4" data-toggle="modal" data-target="#myitemsModal">
<img src="img/food2.jpg" class="img-fluid rounded">
<div class="d-flex align-items-center mt-3 mb-2">
<p class="text-black h6 m-0">Special Burger</p>
<span class="badge badge-light ml-auto"><i class="mdi mdi-truck-fast-outline"></i> Free delivery</span>
</div>
<p class="small mb-2"><i class="mdi mdi-star text-warning"></i> <span class="font-weight-bold text-dark ml-1">4.8</span>(1,873) <i class="mdi mdi-silverware-fork-knife ml-2 mr-1"></i> Burger <i class="mdi mdi-motorbike ml-2 mr-2"></i>45 - 55 min</p>
</a>
<a href="#" class="text-decoration-none text-dark col-lg-3 col-md-6 mb-4" data-toggle="modal" data-target="#myitemsModal">
<img src="img/food3.jpg" class="img-fluid rounded">
<div class="d-flex align-items-center mt-3 mb-2">
<p class="text-black h6 m-0">Tandoori</p>
<span class="badge badge-light ml-auto"><i class="mdi mdi-truck-fast-outline"></i> Free delivery</span>
</div>
<p class="small mb-2"><i class="mdi mdi-star text-warning"></i> <span class="font-weight-bold text-dark ml-1">4.8</span>(1,873) <i class="mdi mdi-silverware-fork-knife ml-2 mr-1"></i> Burger <i class="mdi mdi-motorbike ml-2 mr-2"></i>45 - 55 min</p>
</a>
<a href="#" class="text-decoration-none text-dark col-lg-3 col-md-6 mb-4" data-toggle="modal" data-target="#myitemsModal">
<img src="img/food4.jpg" class="img-fluid rounded">
<div class="d-flex align-items-center mt-3 mb-2">
<p class="text-black h6 m-0">Special Thali</p>
<span class="badge badge-light ml-auto"><i class="mdi mdi-truck-fast-outline"></i> Free delivery</span>
</div>
<p class="small mb-2"><i class="mdi mdi-star text-warning"></i> <span class="font-weight-bold text-dark ml-1">4.8</span>(1,873) <i class="mdi mdi-silverware-fork-knife ml-2 mr-1"></i> Burger <i class="mdi mdi-motorbike ml-2 mr-2"></i>45 - 55 min</p>
</a>
</div>

<div class="row">

<a href="#" class="text-decoration-none text-dark col-lg-3 col-md-6 mb-4" data-toggle="modal" data-target="#myitemsModal">
<img src="img/food3.jpg" class="img-fluid rounded">
<div class="d-flex align-items-center mt-3 mb-2">
<p class="text-black h6 m-0">Tandoori</p>
<span class="badge badge-light ml-auto"><i class="mdi mdi-truck-fast-outline"></i> Free delivery</span>
</div>
<p class="small mb-2"><i class="mdi mdi-star text-warning"></i> <span class="font-weight-bold text-dark ml-1">4.8</span>(1,873) <i class="mdi mdi-silverware-fork-knife ml-2 mr-1"></i> Burger <i class="mdi mdi-motorbike ml-2 mr-2"></i>45 - 55 min</p>
</a>
<a href="#" class="text-decoration-none text-dark col-lg-3 col-md-6 mb-4" data-toggle="modal" data-target="#myitemsModal">
<img src="img/food4.jpg" class="img-fluid rounded">
<div class="d-flex align-items-center mt-3 mb-2">
<p class="text-black h6 m-0">Special Thali</p>
<span class="badge badge-light ml-auto"><i class="mdi mdi-truck-fast-outline"></i> Free delivery</span>
</div>
<p class="small mb-2"><i class="mdi mdi-star text-warning"></i> <span class="font-weight-bold text-dark ml-1">4.8</span>(1,873) <i class="mdi mdi-silverware-fork-knife ml-2 mr-1"></i> Burger <i class="mdi mdi-motorbike ml-2 mr-2"></i>45 - 55 min</p>
</a>
<a href="#" class="text-decoration-none text-dark col-lg-3 col-md-6 mb-4" data-toggle="modal" data-target="#myitemsModal">
<img src="img/food5.jpg" class="img-fluid rounded">
<div class="d-flex align-items-center mt-3 mb-2">
<p class="text-black h6 m-0">Diet Food</p>
<span class="badge badge-light ml-auto"><i class="mdi mdi-truck-fast-outline"></i> Free delivery</span>
</div>
<p class="small mb-2"><i class="mdi mdi-star text-warning"></i> <span class="font-weight-bold text-dark ml-1">4.8</span>(1,873) <i class="mdi mdi-silverware-fork-knife ml-2 mr-1"></i> Burger <i class="mdi mdi-motorbike ml-2 mr-2"></i>45 - 55 min</p>
</a>
<a href="#" class="text-decoration-none text-dark col-lg-3 col-md-6 mb-4" data-toggle="modal" data-target="#myitemsModal">
<img src="img/food6.jpg" class="img-fluid rounded">
<div class="d-flex align-items-center mt-3 mb-2">
<p class="text-black h6 m-0">Sandwich</p>
<span class="badge badge-light ml-auto"><i class="mdi mdi-truck-fast-outline"></i> Free delivery</span>
</div>
<p class="small mb-2"><i class="mdi mdi-star text-warning"></i> <span class="font-weight-bold text-dark ml-1">4.8</span>(1,873) <i class="mdi mdi-silverware-fork-knife ml-2 mr-1"></i> Burger <i class="mdi mdi-motorbike ml-2 mr-2"></i>45 - 55 min</p>
</a>
</div>

<div class="row">

<a href="#" class="text-decoration-none text-dark col-lg-3 col-md-6 mb-4" data-toggle="modal" data-target="#myitemsModal">
<img src="img/food1.jpg" class="img-fluid rounded">
<div class="d-flex align-items-center mt-3 mb-2">
<p class="text-black h6 m-0">Spicy Na Thai Pizza</p>
<span class="badge badge-light ml-auto"><i class="mdi mdi-truck-fast-outline"></i> Free delivery</span>
</div>
<p class="small mb-2"><i class="mdi mdi-star text-warning"></i> <span class="font-weight-bold text-dark ml-1">4.8</span>(1,873) <i class="mdi mdi-silverware-fork-knife ml-2 mr-1"></i> Burger <i class="mdi mdi-motorbike ml-2 mr-2"></i>45 - 55 min</p>
</a>
<a href="#" class="text-decoration-none text-dark col-lg-3 col-md-6 mb-4" data-toggle="modal" data-target="#myitemsModal">
<img src="img/food2.jpg" class="img-fluid rounded">
<div class="d-flex align-items-center mt-3 mb-2">
<p class="text-black h6 m-0">Special Burger</p>
<span class="badge badge-light ml-auto"><i class="mdi mdi-truck-fast-outline"></i> Free delivery</span>
</div>
<p class="small mb-2"><i class="mdi mdi-star text-warning"></i> <span class="font-weight-bold text-dark ml-1">4.8</span>(1,873) <i class="mdi mdi-silverware-fork-knife ml-2 mr-1"></i> Burger <i class="mdi mdi-motorbike ml-2 mr-2"></i>45 - 55 min</p>
</a>
<a href="#" class="text-decoration-none text-dark col-lg-3 col-md-6 mb-4" data-toggle="modal" data-target="#myitemsModal">
<img src="img/food3.jpg" class="img-fluid rounded">
<div class="d-flex align-items-center mt-3 mb-2">
 <p class="text-black h6 m-0">Tandoori</p>
<span class="badge badge-light ml-auto"><i class="mdi mdi-truck-fast-outline"></i> Free delivery</span>
</div>
<p class="small mb-2"><i class="mdi mdi-star text-warning"></i> <span class="font-weight-bold text-dark ml-1">4.8</span>(1,873) <i class="mdi mdi-silverware-fork-knife ml-2 mr-1"></i> Burger <i class="mdi mdi-motorbike ml-2 mr-2"></i>45 - 55 min</p>
</a>
<a href="#" class="text-decoration-none text-dark col-lg-3 col-md-6 mb-4" data-toggle="modal" data-target="#myitemsModal">
<img src="img/food4.jpg" class="img-fluid rounded">
<div class="d-flex align-items-center mt-3 mb-2">
<p class="text-black h6 m-0">Special Thali</p>
<span class="badge badge-light ml-auto"><i class="mdi mdi-truck-fast-outline"></i> Free delivery</span>
</div>
<p class="small mb-2"><i class="mdi mdi-star text-warning"></i> <span class="font-weight-bold text-dark ml-1">4.8</span>(1,873) <i class="mdi mdi-silverware-fork-knife ml-2 mr-1"></i> Burger <i class="mdi mdi-motorbike ml-2 mr-2"></i>45 - 55 min</p>
</a>
</div>
</div>

</div>-->




</div>

</div>


<a class="scroll-to-top rounded" href="#page-top">
<i class="fas fa-angle-up"></i>
</a>

<div class="modal fade" id="myitemsModal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content osahan-item-detail-pop">
<div class="modal-header border-0">
<h5 class="modal-title" id="exampleModalLabel">Rice choice</h5>
<button type="button" class="close" data-dismiss="modal" aria-label="Close">
<span aria-hidden="true">&times;</span>
</button>
</div>
<div class="modal-body px-3 py-0">
<div class="pb-3 position-relative">
<div class="position-absolute heart-fav">
<a href="#"><i class="mdi mdi-heart"></i></a>
</div>
<img src="img/food-banner.png" class="img-fluid col-md-12 p-0 rounded">
</div>
<h4 class="mb-2">Char-Broiled Chicken Shish</h4>
<p>Served with basmati rice or bulgur pilaf, skewered with grilled vegetables</p>
<div class="d-flex align-items-center mb-3">
<p class="text-danger mb-0">Rice choice</p>
<p class="bg-primary text-white rounded px-2 py-1 mb-0 small ml-auto">Required</p>
</div>
<form class="mb-2">
<div class="custom-control custom-checkbox">
<input type="checkbox" class="custom-control-input" id="customCheck1" checked>
<label class="custom-control-label font-weight-bold text-dark" for="customCheck1">Basmati rice</label>
</div>
<div class="custom-control custom-checkbox">
<input type="checkbox" class="custom-control-input" id="customCheck2">
<label class="custom-control-label font-weight-bold text-dark" for="customCheck2">Brown rice</label>
</div>
<div class="custom-control custom-checkbox">
<input type="checkbox" class="custom-control-input" id="customCheck3">
<label class="custom-control-label font-weight-bold text-dark" for="customCheck3">Bulgur pilaf</label>
</div>
</form>
<p class="mb-0"><a href="#" class="text-decoration-none text-primary"><i class="fas fa-plus mr-2 bg-light rounded p-2"></i> Add special instructions</a></p>
</div>
<div class="modal-footer">
<button data-toggle="modal" data-target="#cartModal" class="btn btn-primary btn-block">Add ($15.00)</button>
</div>
</div>
</div>
</div>

<div class="modal fade" id="filtersModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">
<h5 class="modal-title" id="exampleModalLabel">Search filters</h5>
<button type="button" class="close" data-dismiss="modal" aria-label="Close">
<span aria-hidden="true">&times;</span>
</button>
</div>
<div class="modal-body">
<p class="text-dark mb-2 small">Sort by</p>
<div class="btn-group btn-group-toggle mb-3" data-toggle="buttons">
<label class="btn osahan-radio btn-light btn-sm active rounded">
<input type="radio" name="options" id="option1" checked> <i class="mdi mdi-fire"></i> Most popular
</label>
<label class="btn osahan-radio btn-light btn-sm rounded">
<input type="radio" name="options" id="option2"> <i class="mdi mdi-clock-outline"></i> Delivery time
</label>
<label class="btn osahan-radio btn-light btn-sm rounded">
<input type="radio" name="options" id="option3"> <i class="mdi mdi-star"></i> Rating
</label>
</div>
<p class="text-dark mb-2 small mt-3">Price range</p>
<div class="btn-group btn-group-toggle mb-3" data-toggle="buttons">
<label class="btn osahan-radio btn-light active btn-sm rounded">
<input type="radio" name="options" id="option1" checked> $
</label>
<label class="btn osahan-radio btn-light btn-sm rounded">
<input type="radio" name="options" id="option2"> $$
</label>
<label class="btn osahan-radio btn-light btn-sm rounded">
<input type="radio" name="options" id="option3"> $$$
</label>
</div>
<p class="text-dark mb-2 small mt-3">Categories</p>
<div class="btn-group btn-group-toggle" data-toggle="buttons">
<label class="btn osahan-radio btn-light active btn-sm rounded">
<input type="radio" name="options" id="option1" checked> Burger
</label>
<label class="btn osahan-radio btn-light btn-sm rounded">
<input type="radio" name="options" id="option2"> Fast food
</label>
<label class="btn osahan-radio btn-light btn-sm rounded">
<input type="radio" name="options" id="option3"> American food
</label>
<label class="btn osahan-radio btn-light btn-sm rounded">
 <input type="radio" name="options" id="option4"> Pizza
</label>
<label class="btn osahan-radio btn-light btn-sm rounded">
<input type="radio" name="options" id="option5"> Asian
</label>
<label class="btn osahan-radio btn-light btn-sm rounded">
<input type="radio" name="options" id="option6"> Desert
</label>
<label class="btn osahan-radio btn-light btn-sm rounded">
<input type="radio" name="options" id="option7"> Mexican
</label>
<label class="btn osahan-radio btn-light btn-sm rounded">
<input type="radio" name="options" id="option8"> Breakfast
</label>
</div>
</div>
<div class="modal-footer justify-content-start">
<a href="listing.jsp" class="btn btn-primary btn-block mt-2">Apply filters</a>
</div>
</div>
</div>
</div>

<div class="modal fade" id="cartModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">
<h5 class="modal-title" id="exampleModalLabel">My cart <span class="small">(2 items)</span></h5>
<button type="button" class="close" data-dismiss="modal" aria-label="Close">
<span aria-hidden="true">&times;</span>
</button>
</div>
<div class="modal-body osahan-my-cart">
<a href="#" class="text-dark d-flex align-items-center mb-3" data-toggle="modal" data-target="#myaddressModal">
<div>
<p class="mb-0 text-danger">Delivered to</p>
<p class="mb-0 small">300 Post Street San Francico, CA</p>
</div>
<div class="ml-auto">
<p class="mb-0 text-info">Edit<i class="mdi h6 m-0 mdi-chevron-right"></i></p>
</div>
</a>
<div class="details-page border-top pt-3 osahan-my-cart-item">
<h6 class="mb-3">Pizza Hut</h6>
<div class="d-flex align-items-center mb-3">
<div class="mr-2"><img src="img/pizza.png" class="img-fluid rounded"></div>
<div class="small text-black-50">1 x</div>
<div class="ml-2">
<p class="mb-0 text-black">Cheese pie</p>
<p class="mb-0 small">$15</p>
</div>
<a href="#" class="ml-auto"><i class="btn btn-light text-danger mdi mdi-trash-can-outline rounded"></i></a>
</div>
<div class="d-flex align-items-center mb-3">
<div class="mr-2"><img src="img/burger.png" class="img-fluid rounded"></div>
<div class="small text-black-50">2 x</div>
<div class="text-dark ml-2">
<p class="mb-0 text-black">Peperoni pie</p>
<p class="mb-0 small">$23</p>
</div>
<a href="#" class="ml-auto"><i class="btn btn-light text-danger mdi mdi-trash-can-outline rounded"></i></a>
</div>
<div class="d-flex align-items-center mb-3">
<div class="mr-2"><img src="img/burger2.png" class="img-fluid rounded"></div>
<div class="small text-black-50">3 x</div>
<div class="text-dark ml-2">
<p class="mb-0 text-black">Osahan Burger</p>
<p class="mb-0 small">$50</p>
</div>
<a href="#" class="ml-auto"><i class="btn btn-light text-danger mdi mdi-trash-can-outline rounded"></i></a>
</div>
<div class="my-3"><a href="#" data-toggle="modal" data-target="#myitemsModal" class="text-primary"><i class="mdi mdi-plus mr-2"></i> Add more items</a></div>
<a href="#" class="d-flex align-items-center mb-3" data-toggle="modal" data-target="#mycoupansModal">
<div class="mr-3 bg-light rounded p-2 osahan-icon"><i class="mdi mdi-motorbike"></i></div>
<div>
<p class="mb-0 text-dark">Delivery</p>
<p class="mb-0 small text-black-50">$0</p>
</div>
</a>
<a href="#" class="d-flex align-items-center mb-3" data-toggle="modal" data-target="#mycoupansModal">
<div class="mr-3 bg-light rounded p-2 osahan-icon"><i class="mdi mdi-percent"></i></div>
<div>
<p class="mb-0 text-dark">Promo code</p>
<p class="mb-0 small text-black-50">HFXWO</p>
</div>
<div class="ml-auto"><button class="btn btn-primary"><i class="mdi mdi-plus"></i></button></div>
</a>
</div>
</div>
<div class="modal-footer justify-content-start osahan-my-cart-footer">
<div class="row w-100">
<div class="col-2 px-0"><button class="btn btn-warning btn-block" data-toggle="modal" data-target="#mysplitModal"><i class="mdi mdi-account-plus-outline"></i></button></div>
<div class="col-10 pr-0"><button class="btn btn-primary btn-block" data-toggle="modal" data-target="#checkoutModal">Checkout ($53.00)</button></div>
</div>
</div>
</div>
</div>
</div>

<div class="modal fade" id="checkoutModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">
<h5 class="modal-title" id="exampleModalLabel">Checkout</h5>
<button type="button" class="close" data-dismiss="modal" aria-label="Close">
<span aria-hidden="true">&times;</span>
</button>
</div>
<div class="modal-body">
<p class="text-dark mb-2 small">Payment methods</p>
<div class="btn-group btn-group-toggle mb-3" data-toggle="buttons">
<label class="btn osahan-radio btn-light btn-sm rounded active">
<input type="radio" name="options" id="option1" checked> <i class="mdi mdi-credit-card-outline"></i> Card
</label>
<label class="btn osahan-radio btn-light btn-sm rounded">
<input type="radio" name="options" id="option2"> <i class="mdi mdi-currency-usd"></i> COD
</label>
<label class="btn osahan-radio btn-light btn-sm rounded">
<input type="radio" name="options" id="option3"> <i class="fab fa-paypal"></i> Paypal
</label>
</div>
<h6 class="mb-3">My cards <span class="small">(2)</span></h6>
<div class="btn-group btn-group-toggle osahan-card" data-toggle="buttons">
<label class="btn osahan-radio osahan-card-pay btn-light btn-sm rounded mb-2 active w-100">
<input type="radio" name="options" id="option1" checked>
<div class="d-flex align-items-center card-detials small mb-3">
<p class="small"><i class="mdi mdi-chip"></i></p>
<p class="ml-auto d-flex align-items-center">
<span class="card-no mr-2"><i class="mdi mdi-circle"></i> <i class="mdi mdi-circle"></i> <i class="mdi mdi-circle"></i> <i class="mdi mdi-circle"></i></span>
<span class="small">1211</span>
</p>
</div>
<h1 class="mb-0">Mastercard</h1>
<p class="small mb-1">Platinum</p>
<p class="text-right mb-0"><i class="fab fa-cc-mastercard text-warning"></i></p>
</label>
<label class="btn osahan-radio osahan-card-pay btn-light btn-sm rounded mb-2 w-100">
<input type="radio" name="options" id="option2">
<div class="d-flex align-items-center card-detials small mb-3">
<p class="small"><i class="mdi mdi-chip"></i></p>
<p class="ml-auto d-flex align-items-center">
<span class="card-no mr-2"><i class="mdi mdi-circle"></i> <i class="mdi mdi-circle"></i> <i class="mdi mdi-circle"></i> <i class="mdi mdi-circle"></i></span>
<span class="small">2277</span>
</p>
</div>
<h1 class="mb-0">Visa Debit</h1>
<p class="small mb-1">Plantinum</p>
<p class="text-right mb-0"><i class="fab fa-cc-visa"></i></p>
</label>
</div>
<a href="#" data-toggle="modal" data-target="#paymentsModal" class="btn btn-light btn-block"><i class="mdi mdi-plus"></i> Add</a>
</div>
<div class="modal-footer justify-content-start">
<a href="orders.jsp" class="btn btn-primary btn-block">Confirm payment ($53.00)</a>
</div>
</div>
</div>
</div>

<div class="modal fade" id="myaddressModal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">
<h5 class="modal-title" id="staticBackdropLabel">Delivered address</h5>
<button type="button" class="close" data-dismiss="modal" aria-label="Close">
<span aria-hidden="true">&times;</span>
</button>
</div>
<div class="modal-body">
<form>
<div class="form-group">
<label for="inputAddress" class="small font-weight-bold text-dark mb-0">Street Name</label>
<input type="text" class="form-control form-control-sm border-0 p-0 border-input rounded-0" id="inputAddress" placeholder="" value="300 Post Street">
</div>
<div class="form-group">
<label for="inputAddress" class="small font-weight-bold text-dark mb-0">City</label>
<input type="text" class="form-control form-control-sm border-0 p-0 border-input rounded-0" id="inputAddress" placeholder="" value="San Francisco">
</div>
<div class="form-group">
<label for="inputAddress" class="small font-weight-bold text-dark mb-0">State</label>
<input type="text" class="form-control form-control-sm border-0 p-0 border-input rounded-0" id="inputAddress" placeholder="" value="California">
</div>
<div class="form-group">
<label for="inputAddress" class="small font-weight-bold text-dark mb-0">Zip Code</label>
<input type="text" class="form-control form-control-sm border-0 p-0 border-input rounded-0" id="inputAddress" placeholder="" value="123456">
</div>
</form>
</div>
<div class="modal-footer border-0">
<button data-dismiss="modal" aria-label="Close" class="btn btn-primary btn-block">Confirm</button>
</div>
</div>
</div>
</div>

<div class="modal fade" id="mycoupansModal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">
<h5 class="modal-title" id="staticBackdropLabel">Enter promo code</h5>
<button type="button" class="close" data-dismiss="modal" aria-label="Close">
<span aria-hidden="true">&times;</span>
</button>
</div>
<div class="modal-body">
<div data-dismiss="modal" aria-label="Close" class="card offer-card bg-light border rounded mb-2">
<div class="card-body">
<h5 class="card-title"><img src="img/bank/1.png"> OSAHANEAT50</h5>
<h6 class="card-subtitle mb-2 text-primary">Get 50% OFF on your first osahan eat order</h6>
<p class="card-text">Use code OSAHANEAT50 &amp; get 50% off on your first osahan order on Website and Mobile site. Maximum discount: $200</p>
<a href="#" class="card-link">APPLY CODE</a>
<a href="#" class="card-link">KNOW MORE</a>
</div>
</div>
<div data-dismiss="modal" aria-label="Close" class="card offer-card bg-light border rounded mb-2">
<div class="card-body">
<h5 class="card-title"><img src="img/bank/2.png"> OSAHANLINE</h5>
<h6 class="card-subtitle mb-2 text-primary">Get 20% OFF on your first Osahan Eat order</h6>
<p class="card-text">Use code OSAHANEAT50 &amp; get 50% off on your first osahan order on Website and Mobile site. Maximum discount: $200</p>
<a href="#" class="card-link">APPLY CODE</a>
<a href="#" class="card-link">KNOW MORE</a>
</div>
</div>
</div>
<div class="modal-footer border-0">
<button data-dismiss="modal" aria-label="Close" class="btn btn-primary btn-block">Confirm</button>
</div>
</div>
</div>
</div>

<div class="modal fade" id="mysplitModal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">
<h5 class="modal-title" id="staticBackdropLabel">Split order</h5>
<button type="button" class="close" data-dismiss="modal" aria-label="Close">
<span aria-hidden="true">&times;</span>
</button>
</div>
<div class="modal-body split-list">
<a href="#" data-dismiss="modal" aria-label="Close" class="text-decoration-none d-flex border rounded p-2 bg-light align-items-center mb-2">
<div class="mr-2"><img src="img/user1.png" class="img-fluid rounded-circle"></div>
<div class="ml-2">
<p class="mb-0 text-dark">Kate Simpson</p>
<span class="mb-0 small text-black-50"><span class="__cf_email__" data-cfemail="90fbf1e4f5e3f9fde0e3fffed0ffe5e4fcfffffbbef3fffd">[email&#160;protected]</span></span>
</div>
</a>
 <a href="#" data-dismiss="modal" aria-label="Close" class="text-decoration-none d-flex border rounded p-2 bg-light align-items-center mb-2">
<div class="mr-2"><img src="img/user2.png" class="img-fluid rounded-circle"></div>
<div class="ml-2">
<p class="mb-0 text-dark">Andrew smith</p>
<span class="mb-0 small text-black-50"><span class="__cf_email__" data-cfemail="ceafa0aabcabb98ea1bbbae0ada1a3">[email&#160;protected]</span></span>
</div>
</a>
<a href="#" data-dismiss="modal" aria-label="Close" class="text-decoration-none d-flex border rounded p-2 bg-light align-items-center mb-2">
<div class="mr-2"><img src="img/user3.png" class="img-fluid rounded-circle"></div>
<div class="ml-2">
<p class="mb-0 text-dark">Gurdeep Osahan</p>
<span class="mb-0 small text-black-50"><span class="__cf_email__" data-cfemail="49202824263a2821282709263c3d672a2624">[email&#160;protected]</span></span>
</div>
</a>
</div>
<div class="modal-footer border-0">
<button data-dismiss="modal" aria-label="Close" class="btn btn-primary btn-block">Save</button>
</div>
</div>
</div>
</div>

<div class="modal fade" id="addressModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">
<h5 class="modal-title" id="exampleModalLabel">Saved addresses</h5>
<button type="button" class="close" data-dismiss="modal" aria-label="Close">
<span aria-hidden="true">&times;</span>
</button>
</div>
<div class="modal-body">
<ul class="nav nav-tabs border-0 mb-3" id="myTab" role="tablist">
<li class="nav-item" role="presentation">
<a class="nav-link active border-0 bg-primary text-white rounded small" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Home (2)</a>
</li>
<li class="nav-item" role="presentation">
<a class="nav-link border-0 bg-light text-dark rounded ml-3 small" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Work (2)</a>
</li>
</ul>
<div class="tab-content" id="myTabContent">
<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
<div type="button" data-dismiss="modal" class="d-flex align-items-center mb-2 border rounded p-2">
<div class="mr-3 bg-light rounded p-2 osahan-icon"><i class="mdi mdi-home-variant-outline"></i></div>
<div class="w-100">
<p class="mb-0 font-weight-bold text-dark">Home 1</p>
<P class="mb-0 small">775 Cletus Estates Suite 423</P>
</div>
</div>
<div type="button" data-dismiss="modal" class="d-flex align-items-center mb-b border rounded p-2">
<div class="mr-3 bg-light rounded p-2 osahan-icon"><i class="mdi mdi-home-variant-outline"></i></div>
<div class="w-100">
<p class="mb-0 font-weight-bold text-dark">Home 2</p>
<P class="mb-0 small">182 Cletus Estates Suite 423</P>
</div>
</div>
</div>
<div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
<div type="button" data-dismiss="modal" class="d-flex align-items-center mb-2 border rounded p-2">
<div class="mr-3 bg-light rounded p-2 osahan-icon"><i class="mdi mdi-office-building-marker-outline"></i></div>
<div class="w-100">
<p class="mb-0 font-weight-bold text-dark">Work 1</p>
<P class="mb-0 small">775 Cletus Estates Suite 423</P>
</div>
</div>
<div type="button" data-dismiss="modal" class="d-flex align-items-center mb-b border rounded p-2">
<div class="mr-3 bg-light rounded p-2 osahan-icon"><i class="mdi mdi-office-building-marker-outline"></i></div>
<div class="w-100">
<p class="mb-0 font-weight-bold text-dark">Work 2</p>
<P class="mb-0 small">182 Cletus Estates Suite 423</P>
</div>
</div>
</div>
</div>
</div>
<div class="modal-footer border-0">
<button type="button" class="btn btn-primary btn-block">Save Changes</button>
</div>
</div>
</div>
</div>
    
<!--  <div class="container">
    <div class="row">
      <div class="col-md-12 text-center">
        <p>&copy; Your Website 2023. All rights reserved.</p>
      </div>
    </div>
  </div>
</footer>-->


<script data-cfasync="false" src="js/email-decode.min.js"></script><script src="vendor/jquery/jquery.min.js" type="86c5413ccc150e991645c889-text/javascript"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js" type="86c5413ccc150e991645c889-text/javascript"></script>

<script src="vendor/jquery-easing/jquery.easing.min.js" type="86c5413ccc150e991645c889-text/javascript"></script>

<script src="js/osahan.min.js" type="86c5413ccc150e991645c889-text/javascript"></script>
<script src="js/rocket-loader.min.js" data-cf-settings="86c5413ccc150e991645c889-|49" defer=""></script><script defer src="https://static.cloudflareinsights.com/beacon.min.js/v652eace1692a40cfa3763df669d7439c1639079717194" integrity="sha512-Gi7xpJR8tSkrpF7aordPZQlW2DLtzUlZcumS8dMQjwDHEnw9I7ZLyiOj/6tZStRBGtGgN6ceN6cMH8z7etPGlw==" data-cf-beacon='{"rayId":"75c6f944bab87d56","version":"2022.10.3","r":1,"token":"dd471ab1978346bbb991feaa79e6ce5c","si":100}' crossorigin="anonymous"></script>
</body>

<!-- Mirrored from askbootstrap.com/preview/osahan-eat/theme-sidebar/listing.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 19 Oct 2022 05:04:58 GMT -->
</html>
