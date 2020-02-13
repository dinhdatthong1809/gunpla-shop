<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.soLuongSanPham {
	position: absolute;
	top: -12px;
	right: -4px;
	width: 24px;
	height: 24px;
	border-radius: 50%;
	background: #22a7f0;
	text-align: center;
	line-height: 24px;
	color: #FFFFFF;
	font-size: 14px;
	font-weight: 700;
}

@media only screen and (max-width: 1440px) {
	.soLuongSanPham {
	    width: 18px;
	    height: 18px;
	    font-size: 11px;
	    line-height: 18px;
	}
}
</style>

<script src="js/dangnhap-khachhang.js"></script>
</head>
<body>
<!-- Code -->
<%
	response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1 
	response.setHeader("Pragma", "no-cache"); //HTTP 1.0 
	response.setDateHeader("Expires", 0); //prevents caching at the proxy server
%>
<c:set var="taiKhoanKhachHang" value="${sessionScope.taiKhoanKhachHang}"/>
<c:set var="gioHangSize" value="${fn:length(sessionScope.gioHang)}"/>

<!-- Header -->
<header class="header">
	<div class="header_overlay"></div>
	<div class="header_content d-flex flex-row align-items-center justify-content-start">
		<div class="logo">
			<a href="index.jsp">
				<div class="d-flex flex-row align-items-center justify-content-start">
					<div><img src="img/general/logo_1.png" alt=""></div>
					<div>Gunpla Shop</div>
				</div>
			</a>	
		</div>
		<div class="hamburger"><i class="fa fa-bars" aria-hidden="true"></i></div>
		<nav class="main_nav">
			<ul class="d-flex flex-row align-items-start justify-content-start"> 
				<c:forEach var="lsp" items="${sessionScope.lspList}">
					<li><a href="loaisanpham.jsp?maLoai=${lsp.maLoai}&soTrang=1">${lsp.tenLoai}</a></li>
				</c:forEach>
				<c:if test="${taiKhoanKhachHang == null}">
					<li><a href="dangnhap-khachhang.jsp">Đăng nhập</a></li>
					<li><a href="dangky-khachhang.jsp">Đăng ký</a></li>
				</c:if>
				<c:if test="${taiKhoanKhachHang != null}">
					<li><a href="khachhang-trangcanhan.jsp">Trang cá nhân</a></li>
					<li><a href="#" onclick="logout();">Đăng xuất</a></li>
				</c:if>
				
			</ul>
		</nav>
		<div class="header_right d-flex flex-row align-items-center justify-content-start ml-auto">
			<!-- Search -->
			<div class="header_search">
				<form action="ketquatimkiem.jsp" id="header_search_form">
					<input type="text" name="txtTimKiem" class="search_input" placeholder="Search Item" required="required">
					<button class="header_search_button"><img src="img/general/search.png" alt=""></button>
				</form>
			</div>
			<c:if test="${taiKhoanKhachHang != null}">
				<!-- User -->
				<div class="user">
					<a href="khachhang-trangcanhan.jsp">
						<div>
							<img src="img/general/user.svg" alt="https://www.flaticon.com/authors/freepik">
<!-- 							<div></div> -->
						</div>
					</a>
				</div>
			</c:if>
			<!-- Cart -->
			<div class="cart">
				<a href="giohang.jsp">
					<div>
						<img class="svg" src="img/general/cart.svg" alt="https://www.flaticon.com/authors/freepik">
						<div class="${gioHangSize > 0 ? 'soLuongSanPham' : ''}">${gioHangSize > 0 ? gioHangSize : ''}</div>
					</div>
				</a>
			</div>
			<!-- Phone -->
			<div class="header_phone d-flex flex-row align-items-center justify-content-start"><div><div><img src="img/general/phone.svg" alt="https://www.flaticon.com/authors/freepik"></div></div><div>+1 912-252-7350</div></div>
		</div>
	</div>
</header>
</body>
</html>