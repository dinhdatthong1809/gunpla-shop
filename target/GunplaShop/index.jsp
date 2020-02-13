<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="entities.LoaiSanPham"%>
<%@ page import="entities.SanPham"%>
<%@ page import="dao.LoaiSanPhamDAO"%>
<%@ page import="dao.SanPhamDAO"%>
<%@ page import="helper.StringHelper"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gunpla Shop</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="styles/bootstrap-4.1.2/bootstrap.min.css">
<link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css" href="styles/main_styles.css">
<link rel="stylesheet" type="text/css" href="styles/responsive.css">
<%@ include file="lock/css-links.html"%>

<script src="js/image-not-found-process.js"></script>
</head>
<body>
<!-- Menu -->
<%@ include file="lock/menu.jsp"%>

<div class="super_container">
	<!-- Header -->
	<%@ include file="lock/header.jsp"%>

	<div class="super_container_inner">
		<div class="super_overlay"></div>

		<!-- Home -->

		<div class="home">
			<!-- Home Slider -->
			<div class="home_slider_container">
				<div class="owl-carousel owl-theme home_slider">
					
					<c:forEach var="lsp" items="<%=lspList%>">
						<!-- Slide -->
						<%	
							// lấy 3 sản phẩm mới nhất từ loại sản phẩm hiện tại
							LoaiSanPham lsp = (LoaiSanPham)pageContext.getAttribute("lsp");
							
							int maLoai = lsp.getMaLoai();
							ArrayList<SanPham> spmList = (ArrayList<SanPham>) new SanPhamDAO().selectNewFromCategory(3, maLoai + "");
						%>
						<c:set var="spmList" value="<%=spmList%>"/>
						<div class="owl-item">
							<div class="background_image" style="background-image:url(img/product-type/${lsp.maLoai}/00.jpg)"></div>
							<div class="container fill_height">
								<div class="row fill_height">
									<div class="col fill_height">
										<div class="home_container d-flex flex-column align-items-center justify-content-start">
											<div class="home_content">
												<div class="home_title">Các mẫu ${lsp.tenLoai} mới</div>
												<div class="home_items">
													<div class="row">
														<c:if test="${fn:length(spmList) >= 2}">
															<div class="col-sm-3 offset-lg-1">
																<div class="home_item_side">
																	<a href="sanpham-chitiet.jsp?maLoai=${lsp.maLoai}&maSanPham=${spmList[1].maSanPham}"><img src="img/product-type/${lsp.maLoai}/<%=spmList.size() >= 3 ? StringHelper.cutExtension(spmList.get(1).getHinh()) + "_prototype.jpg" : "No-image-found.jpg"%>" onerror="imgError(this)"></a>
																</div>
															</div>
														</c:if>
														<c:if test="${fn:length(spmList) >= 1}">
															<div class="col-lg-4 col-md-6 col-sm-8 offset-sm-2 offset-md-0">
																<div class="home_item_large">
																	<a href="sanpham-chitiet.jsp?maLoai=${lsp.maLoai}&maSanPham=${spmList[0].maSanPham}"><img src="img/product-type/${lsp.maLoai}/<%=spmList.size() >= 3 ? StringHelper.cutExtension(spmList.get(0).getHinh()) + "_prototype.jpg" : "No-image-found.jpg"%>" onerror="imgError(this)"></a>
																</div>
															</div>
														</c:if>
														<c:if test="${fn:length(spmList) >= 3}">
															<div class="col-sm-3">
																<div class="home_item_side">
																	<a href="sanpham-chitiet.jsp?maLoai=${lsp.maLoai}&maSanPham=${spmList[2].maSanPham}"><img src="img/product-type/${lsp.maLoai}/<%=spmList.size() >= 3 ? StringHelper.cutExtension(spmList.get(2).getHinh()) + "_prototype.jpg" : "No-image-found.jpg"%>" onerror="imgError(this)"></a>
																</div>
															</div>
														</c:if>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>	
						</div>
					</c:forEach>
				</div>
				
				<!-- Slide Buttons -->
				<div class="home_slider_nav home_slider_nav_prev"><i class="fa fa-chevron-left" aria-hidden="true"></i></div>
				<div class="home_slider_nav home_slider_nav_next"><i class="fa fa-chevron-right" aria-hidden="true"></i></div>
			</div>
		</div>

		<!-- Products -->

		<div id="products" class="products">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 offset-lg-3">
						<div class="section_title text-center">Sản phẩm nổi bật</div>
					</div>
				</div>
				<div class="row page_nav_row">
					<div class="col">
						<div class="page_nav">
							<ul class="d-flex flex-row align-items-start justify-content-center">
								<c:forEach var="lsp" items="<%=lspList%>">
									<c:choose>
										<c:when test="${lsp.maLoai == 1}">
											<li id="${lsp.maLoai}" class="loai-san-pham active"><a>${lsp.tenLoai}</a></li>
										</c:when>
										<c:otherwise>
											<li id="${lsp.maLoai}" class="loai-san-pham"><a>${lsp.tenLoai}</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
				
				<script>
					// chuyển active class từ mục này sang mục khác khi click
					var btns = document.getElementsByClassName("loai-san-pham");
					for (var i = 0; i < btns.length; i++) {
						btns[i].addEventListener("click", function() {
							var current = document.getElementsByClassName("loai-san-pham active");
							current[0].className = current[0].className.replace(" active", "");
							this.className += " active";
						});
					}
				</script>
				
				<div class="row products_row"></div>
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
<script src="js/custom.js"></script>

<!-- AJAX xử lý sản phẩm nổi bật -->
<script>
	$(document).ready(function() {
		$.post("sanpham-noibat.jsp", {maLoai: 1}, function(data) {
			$(".products_row").html(data).promise().done(function() {
				$(".products_row").fadeIn("slow");
				var heightProducts = $("#products").outerHeight(true);
				$("#products").css("min-height", heightProducts);
			});
		});
		
		$(".loai-san-pham").click(function() {
			var maLoai = $(this).attr("id");
			$(".products_row").fadeOut("slow", function() {
				$.post("sanpham-noibat.jsp", {maLoai: maLoai}, function(data) {
					$(".products_row").html(data).promise().done(function() {
						$(".products_row").fadeIn("slow", function() {
							var heightProducts = $("#products").outerHeight(true);
							$("#products").css("min-height", heightProducts);
						});
					});
				});
			});

		});
	});
</script>
</body>
</html>