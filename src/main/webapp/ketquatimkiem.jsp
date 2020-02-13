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
<title>Gunpla Shop - Kết quả tìm kiếm</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="styles/bootstrap-4.1.2/bootstrap.min.css">
<link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css" href="styles/category.css">
<link rel="stylesheet" type="text/css" href="styles/category_responsive.css">
<%@ include file="lock/css-links.html"%>
</head>
<body>
<!-- Code -->
<%
	if (request.getParameter("txtTimKiem") == null) {
		response.sendRedirect("index.jsp");
		return;
	}

	ArrayList<SanPham> spKQTKList = (ArrayList<SanPham>) new SanPhamDAO().selectByKeyword(request.getParameter("txtTimKiem"));
	ArrayList<LoaiSanPham> lspKQTKList = (ArrayList<LoaiSanPham>) new LoaiSanPhamDAO().select();
	
%>
<c:set var="spKQTKList" value="<%=spKQTKList%>"/>
<c:set var="lspKQTKList" value="<%=lspKQTKList%>"/>

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
					<div class="home_title">Kết quả tìm kiếm</div>
					<div class="breadcrumbs d-flex flex-column align-items-center justify-content-center">
						<ul class="d-flex flex-row align-items-start justify-content-start text-center">
							<li><a href="index.jsp">Trang chủ</a></li>
							<li><a href="#">Kết quả tìm kiếm</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		
		<!-- Products -->
		
		<div id="products" class="products">
			<div class="container">
				<div class="row products_bar_row">
					<div class="col">
						<div class="products_bar d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-lg-start justify-content-center">
<!-- 							<div class="products_bar_links"> -->
<!-- 								<ul class="d-flex flex-row align-items-start justify-content-start"> -->
<!-- 									<li class="active"><a href="#">Tất cả</a></li> -->
<!-- 									<li><a href="#">Nổi bật</a></li> -->
<!-- 									<li><a href="#">Mới</a></li> -->
<!-- 									<li><a href="#">Giảm giá</a></li> -->
<!-- 								</ul> -->
<!-- 							</div> -->
							<div class="products_bar_side d-flex flex-row align-items-center justify-content-start ml-lg-auto">
<!-- 								<div class="products_dropdown product_dropdown_sorting"> -->
<!-- 									<div class="isotope_sorting_text"><span>Sắp xếp</span><i class="fa fa-caret-down" aria-hidden="true"></i></div> -->
<!-- 									<ul> -->
<!-- 										<li class="item_sorting_btn" data-isotope-option='{ "sortBy": "original-order" }'>Mặc định</li> -->
<!-- 										<li class="item_sorting_btn" data-isotope-option='{ "sortBy": "price" }'>Giá</li> -->
<!-- 										<li class="item_sorting_btn" data-isotope-option='{ "sortBy": "name" }'>Tên</li> -->
<!-- 									</ul> -->
<!-- 								</div> -->
<!-- 								<div class="product_view d-flex flex-row align-items-center justify-content-start"> -->
<!-- 									<div class="view_item active"><img src="images/view_1.png" alt=""></div> -->
<!-- 									<div class="view_item"><img src="images/view_2.png" alt=""></div> -->
<!-- 									<div class="view_item"><img src="images/view_3.png" alt=""></div> -->
<!-- 								</div> -->
								<div class="products_dropdown text-right product_dropdown_filter">
									<div class="isotope_filter_text"><span>Lọc</span><i class="fa fa-caret-down" aria-hidden="true"></i></div>
									<ul>
										<li class="item_filter_btn" data-filter="*">Tất cả</li>
										<c:if test="${not empty lspKQTKList}">
											<c:forEach var="lspKQTK" items="${lspKQTKList}">
												<li class="item_filter_btn" data-filter=".loaiSanPham-${lspKQTK.maLoai}">${lspKQTK.tenLoai}</li>
											</c:forEach>
										</c:if>
<!-- 										<li class="item_filter_btn" data-filter=".new">Mới</li> -->
<!-- 										<li class="item_filter_btn" data-filter=".sale">Giảm giá</li> -->
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="row products_row products_container grid">
					<c:if test="${not empty spKQTKList}">
						<c:forEach var="spKQTK" items="${spKQTKList}">
							
							<!-- Product -->
							<div class="col-xl-4 col-md-6 grid-item loaiSanPham-${spKQTK.maLoai}">
								<div class="product">
									<div class="product_image">
										<a href="sanpham-chitiet.jsp?maLoai=${spKQTK.maLoai}&maSanPham=${spKQTK.maSanPham}">
											<div id="hinh-sanpham-${spKQTK.maSanPham}" class="carousel carousel-fade slide" data-ride="carousel">
												<ol class="carousel-indicators">
													<li data-target="#hinh-sanpham-${spKQTK.maSanPham}" data-slide-to="0" class="active"></li>
													<li data-target="#hinh-sanpham-${spKQTK.maSanPham}" data-slide-to="1"></li>
												</ol>
												<div class="carousel-inner">
													<div class="carousel-item active">
														<img class="d-block w-100"
															onerror="imgError(this)"
															src="img/product-type/${spKQTK.maLoai}/${fn:replace(spKQTK.hinh, '.jpg', '_prototype2.jpg')}"
															alt="First slide">
													</div>
													<div class="carousel-item">
														<img class="d-block w-100"
															onerror="imgError(this)"
															src="img/product-type/${spKQTK.maLoai}/${fn:replace(spKQTK.hinh, '.jpg', '_prototype.jpg')}"
															alt="Second slide">
													</div>
												</div>
												<a class="carousel-control-prev" href="#hinh-sanpham-${spKQTK.maSanPham}" role="button" data-slide="prev">
													<span class="carousel-control-prev-icon" aria-hidden="true"></span>
													<span class="sr-only">Previous</span>
												</a> 
												<a class="carousel-control-next" href="#hinh-sanpham-${spKQTK.maSanPham}" role="button" data-slide="next"> 
													<span class="carousel-control-next-icon" aria-hidden="true"></span>
													<span class="sr-only">Next</span>
												</a>
											</div>
										</a>
									</div>
									<div class="product_content">
										<div class="product_info d-flex flex-row align-items-start justify-content-start">
											<div>
												<div>
													<c:set var="maLoaiKQTK" value="${spKQTK.maLoai}"/>
													<div class="product_category"><a href="loaisanpham.jsp?maLoai=${spKQTK.maLoai}&soTrang=1"><%=new LoaiSanPhamDAO().findById("" + pageContext.getAttribute("maLoaiKQTK")).getTenLoai()%></a></div>
													<div class="rating_r rating_r_5 home_item_rating"><i></i><i></i><i></i><i></i><i></i></div>
												</div>
											</div>
											<div class="ml-auto text-right">
												<div class="product_price text-right">¥${spKQTK.donGia}<span></span></div>
											</div>
										</div>
										<div class="product_buttons">
											<div class="text-right d-flex flex-row align-items-start justify-content-start">
												<div class="product_button product_fav text-center d-flex flex-column align-items-center justify-content-center">
													<div><div><img onerror="imgError(this)" src="img/general/heart_2.svg" class="svg" alt=""><div>+</div></div></div>
												</div>
												<div id="product_cart_${spKQTK.maSanPham}" class="product_button product_cart text-center d-flex flex-column align-items-center justify-content-center">
													<div><div><img onerror="imgError(this)" src="img/general/cart.svg" class="svg" alt=""><div>+</div></div></div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:if>
				</div>
			</div>
		</div>
		
		<!-- Footer -->
		<%@ include file="lock/footer.jsp"%>
	</div>
</div>

<%@ include file="lock/scripts.html"%>
<script src="plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="plugins/easing/easing.js"></script>
<script src="plugins/progressbar/progressbar.min.js"></script>
<script src="plugins/parallax-js-master/parallax.min.js"></script>
<script src="plugins/Isotope/isotope.pkgd.min.js"></script>
<script src="plugins/Isotope/fitcolumns.js"></script>
<script src="js/category.js"></script>
<script src="js/image-not-found-process.js"></script>
<script src="js/giohang-thaotac.js"></script>

</body>
</html>