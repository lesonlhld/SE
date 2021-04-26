<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<f:setLocale value="vi_VN"/>
<ul class="list-inline shop-badge badge-lists badge-icons pull-right">
	<li><a href="${pageContext.request.contextPath }/member/myaccount"><i class="fa fa-user"></i></a>
		<ul class="list-unstyled badge-open2 mCustomScrollbar2" data-mcs-theme="minimal-dark">
			<li><a href="${pageContext.request.contextPath }/member/myaccount">Tài khoản của tôi</a></li>
			<li><a href="${pageContext.request.contextPath }/member/invoice">Lich sử mua hàng</a></li>
			<li><a href="${pageContext.request.contextPath }/logout">Đăng xuất</a></li>
		</ul>
	</li>
</ul>