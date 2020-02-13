<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="entities.LoaiSanPham"%>
<%@ page import="entities.SanPham"%>
<%@ page import="dao.LoaiSanPhamDAO"%>
<%@ page import="dao.SanPhamDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gunpla Shop - Mẫu sản phẩm</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="styles/bootstrap-4.1.2/bootstrap.min.css">
<link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="plugins/flexslider/flexslider.css">
<link rel="stylesheet" type="text/css" href="styles/product.css">
<link rel="stylesheet" type="text/css" href="styles/product_responsive.css">
<%@ include file="lock/css-links.html"%>
</head>
<body>
<!-- Code -->
<%
	SanPham spSPCT = new SanPhamDAO().findById(request.getParameter("maSanPham"));
	LoaiSanPham lspSPCT = new LoaiSanPhamDAO().findById(request.getParameter("maLoai"));
%>
<c:set var="spSPCT" value="<%=spSPCT%>"/>
<c:set var="lspSPCT" value="<%=lspSPCT%>"/>

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
					<div class="home_title">Chi tiết mẫu sản phẩm</div>
					<div class="breadcrumbs d-flex flex-column align-items-center justify-content-center">
						<ul class="d-flex flex-row align-items-start justify-content-start text-center">
							<li><a href="index.jsp">Trang chủ</a></li>
							<li><a href="loaisanpham.jsp?maLoai=${lspSPCT.maLoai}&soTrang=1">${lspSPCT.tenLoai}</a></li>
							<li><a href="#">${spSPCT.tenSanPham}</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		
		<!-- Product -->

		<div class="product">
			<div class="container">
				<div class="row">
					
					<!-- Product Image -->
					<div class="col-lg-6">
						<div class="flexslider">
							<ul class="slides">
								<li data-thumb="img/product-type/${param.maLoai}/${fn:replace(spSPCT.hinh, '.jpg', '_prototype2.jpg')}">
									<img onerror="imgError(this)" 
										src="img/product-type/${param.maLoai}/${fn:replace(spSPCT.hinh, '.jpg', '_prototype2.jpg')}" />
								</li>
								<li data-thumb="img/product-type/${param.maLoai}/${fn:replace(spSPCT.hinh, '.jpg', '_prototype.jpg')}">
									<img onerror="imgError(this)"
										src="img/product-type/${param.maLoai}/${fn:replace(spSPCT.hinh, '.jpg', '_prototype.jpg')}" />
								</li>
								<li data-thumb="img/product-type/${param.maLoai}/${spSPCT.hinh}">
									<img onerror="imgError(this)"
										src="img/product-type/${param.maLoai}/${spSPCT.hinh}" />
								</li>
							</ul>
						</div>
					</div>

					<!-- Product Info -->
					<div class="col-lg-6 product_col">
						<div class="product_info">
							<div class="product_name">${spSPCT.tenSanPham}</div>
							<div class="product_category"><a href="loaisanpham.jsp?maLoai=${lspSPCT.maLoai}&soTrang=1">${lspSPCT.tenLoai}</a></div>
							<div class="product_rating_container d-flex flex-row align-items-center justify-content-start">
								<div class="rating_r rating_r_4 product_rating"><i></i><i></i><i></i><i></i><i></i></div>
								<div class="product_reviews">Lượt thích: ${spSPCT.luotThich}</div>
							</div>
							<div class="product_price">¥${spSPCT.donGia}</div>
							<div class="product_size">
							</div>
							<div class="product_buttons">
								<div class="text-right d-flex flex-row align-items-start justify-content-start">
									<div class="product_button product_fav text-center d-flex flex-column align-items-center justify-content-center">
										<div><div><img onerror="imgError(this)" src="images/heart_2.svg" class="svg" alt=""><div>+</div></div></div>
									</div>
									<div id="product_cart_${spSPCT.maSanPham}" class="product_button product_cart text-center d-flex flex-column align-items-center justify-content-center">
										<div><div><img onerror="imgError(this)" src="images/cart.svg" class="svg" alt=""><div>+</div></div></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- jQuery -->
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
		
		<!-- FlexSlider -->
		<script type="text/javascript">
		$(function(){
			SyntaxHighlighter.all();
		});
		$(window).load(function() {
			$('.flexslider').flexslider({
				animation: "slide",
				controlNav: "thumbnails",
				start: function(slider) {
					$('body').removeClass('loading');
		    	}
			});
		});
		</script>
		<!-- Footer -->
		<%@ include file="lock/footer.jsp"%>
	</div>
</div>

<%@ include file="lock/scripts.html"%>
<script src="plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="plugins/easing/easing.js"></script>
<script src="plugins/progressbar/progressbar.min.js"></script>
<script src="plugins/parallax-js-master/parallax.min.js"></script>
<script src="plugins/flexslider/jquery.flexslider-min.js"></script>
<script src="js/product.js"></script>
<script src="js/image-not-found-process.js"></script>
<script src="js/giohang-thaotac.js"></script>

</body>
</html>