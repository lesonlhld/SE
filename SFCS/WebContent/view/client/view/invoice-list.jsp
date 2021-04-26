<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<c:url value="/view/client/static" var="url"></c:url>
<meta charset="UTF-8">
<title>Lịch sử hóa đơn</title>
<!-- Favicon -->
<link rel="shortcut icon" href="favicon.ico">

<!-- Web Fonts -->
<link rel='stylesheet' type='text/css'
	href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin'>

<!-- CSS Global Compulsory -->
<link rel="stylesheet"
	href="${url}/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${url}/css/shop.style.css">

<!-- CSS Header and Footer -->
<link rel="stylesheet" href="${url}/css/headers/header-v5.css">
<link rel="stylesheet" href="${url}/css/footers/footer-v4.css">

<!-- CSS Implementing Plugins -->
<link rel="stylesheet" href="${url}/plugins/animate.css">
<link rel="stylesheet" href="${url}/plugins/line-icons/line-icons.css">
<link rel="stylesheet"
	href="${url}/plugins/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${url}/plugins/noUiSlider/jquery.nouislider.min.css">
<link rel="stylesheet"
	href="${url}/plugins/scrollbar/css/jquery.mCustomScrollbar.css">

<!-- Style Switcher -->
<link rel="stylesheet" href="${url}/css/plugins/style-switcher.css">

<!-- CSS Theme -->
<link rel="stylesheet" href="${url}/css/theme-colors/default.css"
	id="style_color">

<!-- CSS Customization -->
<link rel="stylesheet" href="${url}/css/custom.css">
</head>
<body>
<body class="header-fixed">
	<div class="wrapper">
		<!--=== Header v5 ===-->
		<div class="header-v5 header-${url}">
			<!-- Topbar v3 -->
			<%-- <jsp:include page="topbar.jsp"></jsp:include> --%>
			<!-- End Topbar v3 -->

			<!-- Navbar -->
			<jsp:include page="navbar.jsp"></jsp:include>
			<!-- End Navbar -->
		</div>
		<!--=== End Header v5 ===-->

		<!--=== Breadcrumbs v4 ===-->
		<div class="breadcrumbs-v4">
			<div class="container">
				<span class="page-name">Lịch sử hóa đơn</span>
				<h1>TẬN HƯỞNG CÙNG <span class="shop-red">SFCS</span></h1>
				<ul class="breadcrumb-v4-in">
					<li><a href="${pageContext.request.contextPath }">Trang Chủ</a></li>
					<li class="active">Lịch sử hóa đơn</li>
				</ul>
			</div>
			<!--/end container-->
		</div>
		<!--=== End Breadcrumbs v4 ===-->


		<!--=== Information ===-->
		
		<div class="content-md margin-bottom-30">
			<div class="container">
				<form class="shopping-cart" action="#">
					<div><div class="header-tags">
						<div class="overflow-h">
							<h2>Lịch sử hóa đơn</h2>
					</div></div>
					<section>
						<div class="table-responsive">
							<table class="table table-striped table-bordered table-hover">
								<thead><tr>
									<th>Số thứ tự</th>
									<th>Mã hóa đơn</th>
									<th>Ngày tạo hóa đơn</th>
									<th>Thơi gian tạo hóa đơn</th>
									<th>Mã giảm giá</th>
									<th>Tổng tiền</th>
									<th>Phương thức thanh toán</th>
								</tr></thead>
							<tbody>
							<c:set var="index" value="${0}" />
							<c:forEach items="${listInvoice }" var="list">
								<tr class="odd gradeX">
									<c:set var="index" value="${index + 1}" />
									<td>${index }</td>
									<td>${list.id }</td>
									<td>${list.invoiceDate }</td>
									<td>${list.invoiceTime }</td>
									<td>${list.voucher }</td>
									<td>${list.totalMoney }</td>
									<td>${list.paymentMethod.name }</td>
								</tr>
							</c:forEach>
							</tbody>
							</table>
						</div>
					</section>	
				</div>
			</form>
		</div>
		<!--/end container-->
	</div>
		<!--=== Footer v4 ===-->
		<jsp:include page="footer.jsp"></jsp:include>
		<!--=== End Footer v4 ===-->
	</div>
	<!--/wrapper-->

	<!-- JS Global Compulsory -->
	<script src="${url}/plugins/jquery/jquery.min.js"></script>
	<script src="${url}/plugins/jquery/jquery-migrate.min.js"></script>
	<script src="${url}/plugins/bootstrap/js/bootstrap.min.js"></script>
	<!-- JS Implementing Plugins -->
	<script src="${url}/plugins/back-to-top.js"></script>
	<script src="${url}/plugins/smoothScroll.js"></script>
	<script src="${url}/plugins/noUiSlider/jquery.nouislider.all.min.js"></script>
	<script
		src="${url}/plugins/scrollbar/js/jquery.mCustomScrollbar.concat.min.js"></script>
	<!-- JS Customization -->
	<script src="${url}/js/custom.js"></script>
	<!-- JS Page Level -->
	<script src="${url}/js/shop.app.js"></script>
	<script src="${url}/js/plugins/mouse-wheel.js"></script>
	<script>
		jQuery(document).ready(function() {
			App.init();
			App.initScrollBar();
			MouseWheel.initMouseWheel();
		});
	</script>
	<!--[if lt IE 9]>
    <script src="${url}/plugins/respond.js"></script>
    <script src="${url}/plugins/html5shiv.js"></script>
    <script src="${url}/js/plugins/placeholder-IE-fixes.js"></script>    
<![endif]-->
	<!--[if lt IE 10]>
    <script src="${url}/plugins/sky-forms-pro/skyforms/js/jquery.placeholder.min.js"></script>
<![endif]-->

</body>

</body>
</html>