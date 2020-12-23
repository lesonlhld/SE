<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <c:url value="/view/admin/static" var="url"></c:url>
		<nav class="navbar-default navbar-side" role="navigation">
			<div class="sidebar-collapse">
				<ul class="nav" id="main-menu">
					<li class="text-center"><img src="${url}/img/find_user.png"
						class="user-image img-responsive" /></li>
					<li><a class="active-menu" href="#"><i
							class="fa fa-dashboard fa-3x"></i> Dashboard</a></li>
					<li><a href="${pageContext.request.contextPath }/admin/user/list"><i class="fa fa-user fa-3x"></i>
							User Management</a></li>
					<li><a href="${pageContext.request.contextPath }/admin/product/list"><i class="fa fa-cutlery fa-3x"></i>
							Product Management</a></li>
					<li><a href="${pageContext.request.contextPath }/admin/orderItem/list"><i
							class="fa fa-shopping-cart fa-3x"></i>Order Management</a></li>
					<li><a href="${pageContext.request.contextPath }/admin/order/list"><i
							class="fa fa-list-ol fa-3x"></i> Order List Management</a></li>
					<li><a href="${pageContext.request.contextPath }/admin/invoice/list"><i
							class="fa fa-bar-chart-o fa-3x"></i> Invoice List Management</a></li>
					<li><a href="${pageContext.request.contextPath }/admin/stall/list"><i
							class="fa fa-users fa-3x"></i>Stall Management</a></li>
					<li><a href="${pageContext.request.contextPath }/admin/category/list"><i
							class="fa fa-indent fa-3x"></i>Category Management</a></li>
					<li><a href="${pageContext.request.contextPath }/admin/payment/list"><i
							class="fa fa-money fa-3x"></i>Payment Management</a></li>
					<li><a href="${pageContext.request.contextPath }/admin/role/list"><i
							class="fa fa-cogs fa-3x"></i>Role Management</a></li>
				</ul>
			</div>

		</nav>