<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="cart.GioHang"%>
<%@ page import="entities.LoaiSanPham"%>
<%@ page import="entities.SanPham"%>
<%@ page import="dao.LoaiSanPhamDAO"%>
<%@ page import="dao.SanPhamDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gunpla Shop - Giỏ hàng</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="styles/bootstrap-4.1.2/bootstrap.min.css">
<link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="styles/cart.css">
<link rel="stylesheet" type="text/css" href="styles/cart_responsive.css">
<%@ include file="lock/css-links.html"%>
</head>
<body>
<!-- Code -->
<%
	response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1 
	response.setHeader("Pragma", "no-cache"); //HTTP 1.0 
	response.setDateHeader("Expires", 0); //prevents caching at the proxy server
%>
<c:set var="gioHang" value="${sessionScope.gioHang}"/>

<!-- Menu -->
<%@ include file="lock/menu.jsp"%>

<div class="super_container">
	<!-- Header -->
	<%@ include file="lock/header.jsp"%>
	
	<div class="super_container_inner">
		<div class="super_overlay"></div>
		
		<!-- Home -->

		<div class="home">
			<div class="home_container d-flex flex-column align-items-center justify-content-end">
				<div class="home_content text-center">
					<div class="home_title">Giỏ hàng</div>
					<div class="breadcrumbs d-flex flex-column align-items-center justify-content-center">
						<ul class="d-flex flex-row align-items-start justify-content-start text-center">
							<li><a href="index.jsp">Trang chủ</a></li>
							<li><a href="#">Giỏ hàng của bạn</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		
		<!-- Cart -->

		<div class="cart_section">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="cart_container">
							
							<!-- Cart Bar -->
							<div class="cart_bar">
								<ul class="cart_bar_list item_list d-flex flex-row align-items-center justify-content-end">
									<li class="mr-auto">Mẫu</li>
									<li>Loại</li>
									<li>Giá</li>
									<li>Số lượng</li>
									<li>Tổng</li>
									<li>Chọn</li>
								</ul>
							</div>
							
							<!-- Cart Items -->
							<div class="cart_items">
								<ul class="cart_items_list">
		
									<c:if test="${not empty gioHang}">
										<c:set var="count" value="0"/>
										<c:forEach var="muc" items="${gioHang}">
											<c:set var="count" value="${count + 1}"/>
											
											<!-- Cart Item -->
											<li class="cart_item item_list d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-lg-end justify-content-start">
												<div class="product d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-start mr-auto">
													<div><div class="product_number">${count}</div></div>
													<div><div class="product_image"><img src="img/product-type/${muc.value.sanPham.maLoai}/${muc.value.sanPham.hinh}" alt=""></div></div>
													<div class="product_name_container">
														<div class="product_name"><a href="sanpham-chitiet.jsp?maLoai=${muc.value.sanPham.maLoai}&maSanPham=${muc.value.sanPham.maSanPham}">${muc.value.sanPham.tenSanPham}</a></div>
														<div class="product_text">Lượt thích: ${muc.value.sanPham.luotThich}</div>
													</div>
												</div>
												<c:set var="maLoaiGH" value="${muc.value.sanPham.maLoai}" scope="session" />
												<div class="product_color product_text">
													<span>Loại: </span>
													<a href="loaisanpham.jsp?maLoai=${muc.value.sanPham.maLoai}&soTrang=1">
														<%=new LoaiSanPhamDAO().findById("" + session.getAttribute("maLoaiGH")).getTenLoai()%>
													</a>
												</div>
												<div class="product_price product_text"><span>Giá: </span>¥${muc.value.sanPham.donGia}</div>
												<div class="product_quantity_container">
													<div class="product_quantity ml-lg-auto mr-lg-auto text-center">
														<span class="product_text product_num">${muc.value.soLuong}</span>
<%-- 														<div id="botSoLuong_${muc.value.sanPham.maSanPham}" class="qty_sub qty_button trans_200 text-center"><span>-</span></div> --%>
<%-- 														<div id="themSoLuong_${muc.value.sanPham.maSanPham}" class="qty_add qty_button trans_200 text-center"><span>+</span></div> --%>
													</div>
												</div>
												<div class="product_total product_text"><span>Tổng: </span>¥${muc.value.sanPham.donGia * muc.value.soLuong}</div>
												<div class="product_total product_text">
													<span>Chọn: </span>
													<label class="custom-control custom-checkbox">
					                                    <input name="xoaKhoiGioHang" value="${muc.value.sanPham.maSanPham}" type="checkbox" class="custom-control-input">
					                                    <span class="custom-control-indicator"></span>
					                                </label>
												</div>
											</li>
										</c:forEach>
									</c:if>
								</ul>
							</div>

							<!-- Cart Buttons -->
							<div class="cart_buttons d-flex flex-row align-items-start justify-content-start">
								<div class="cart_buttons_inner ml-sm-auto d-flex flex-row align-items-start justify-content-start flex-wrap">
									<div id="btnClearSelected" class="button button_clear trans_200"><a href="">Xóa mục đã chọn</a></div>
									<div id="btnClearAll" class="button button_clear trans_200"><a href="">Xóa giỏ hàng</a></div>
									<div class="button button_continue trans_200"><a href="loaisanpham.jsp?maLoai=1&soTrang=1">Tiếp tục mua sắm</a></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row cart_extra_row">
					<div class="col-lg-6">
						<div class="cart_extra cart_extra_1">

						</div>
					</div>
					<div class="col-lg-6 cart_extra_col">
						<div class="cart_extra cart_extra_2">
							<div class="cart_extra_content cart_extra_total">
								<div class="cart_extra_title">Tổng tiền</div>
								<ul class="cart_extra_total_list">
									<li class="d-flex flex-row align-items-center justify-content-start">
										<div class="cart_extra_total_title">Giỏ hàng</div>
										<div class="cart_extra_total_value ml-auto">¥${gioHang.getTongTien()}</div>
									</li>
									<li class="d-flex flex-row align-items-center justify-content-start">
										<div class="cart_extra_total_title">Phí giao hàng</div>
										<div class="cart_extra_total_value ml-auto">Miễn phí</div>
									</li>
									<li class="d-flex flex-row align-items-center justify-content-start">
										<div class="cart_extra_total_title">Tổng cộng</div>
										<div class="cart_extra_total_value ml-auto">¥${gioHang.getTongTien()}</div>
									</li>
								</ul>
								<div class="checkout_button trans_200"><a href="quaythanhtoan.jsp">Đến quầy thanh toán</a></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- Footer -->
		<%@ include file="lock/footer.jsp"%>
	</div>
</div>

<%@ include file="lock/scripts.html"%>
<script src="plugins/easing/easing.js"></script>
<script src="plugins/parallax-js-master/parallax.min.js"></script>
<script src="js/cart.js"></script>
<script src="js/giohang-thaotac.js"></script>

</body>
</html>