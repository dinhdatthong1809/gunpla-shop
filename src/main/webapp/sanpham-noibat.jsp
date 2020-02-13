<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="entities.SanPham"%>
<%@ page import="dao.SanPhamDAO"%>
<%@ page import="dao.LoaiSanPhamDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="js/image-not-found-process.js"></script>
<script src="js/giohang-thaotac.js"></script>

<!-- Code -->
<% 
	ArrayList<SanPham> spnbList = (ArrayList<SanPham>) new SanPhamDAO().selectHotFromCategory(request.getParameter("maLoai"), 250);
%>
<c:set var="spnbList" value="<%=spnbList%>"/>

<c:if test="${not empty spnbList}">
	<c:forEach var="spnb" items="${spnbList}">
		<!-- Product -->
		<div class="col-xl-4 col-md-6">
			<div class="product">
				<div class="product_image">
					<a href="sanpham-chitiet.jsp?maLoai=${spnb.maLoai}&maSanPham=${spnb.maSanPham}">
						<div id="hinh-sanpham-${spnb.maSanPham}" class="carousel carousel-fade slide" data-ride="carousel">
							<ol class="carousel-indicators">
								<li data-target="#hinh-sanpham-${spnb.maSanPham}" data-slide-to="0" class="active"></li>
								<li data-target="#hinh-sanpham-${spnb.maSanPham}" data-slide-to="1"></li>
							</ol>
							<div class="carousel-inner">
								<div class="carousel-item active">
									<img class="d-block w-100"
										onerror="imgError(this)"
										src="img/product-type/${param.maLoai}/${fn:replace(spnb.hinh, '.jpg', '_prototype2.jpg')}"
										alt="First slide">
								</div>
								<div class="carousel-item">
									<img class="d-block w-100"
										onerror="imgError(this)"
										src="img/product-type/${param.maLoai}/${fn:replace(spnb.hinh, '.jpg', '_prototype.jpg')}"
										alt="Second slide">
								</div>
							</div>
							<a class="carousel-control-prev" href="#hinh-sanpham-${spnb.maSanPham}" role="button" data-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="sr-only">Previous</span>
							</a> 
							<a class="carousel-control-next" href="#hinh-sanpham-${spnb.maSanPham}" role="button" data-slide="next"> 
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
								<div class="product_category"><a href="loaisanpham.jsp?maLoai=${spnb.maLoai}&soTrang=1"><%=new LoaiSanPhamDAO().findById(request.getParameter("maLoai")).getTenLoai()%></a></div>
								<div class="rating_r rating_r_5 home_item_rating"><i></i><i></i><i></i><i></i><i></i></div>
							</div>
						</div>
						<div class="ml-auto text-right">
							<div class="product_price text-right">¥${spnb.donGia}<span></span></div>
						</div>
					</div>
					<div class="product_buttons">
						<div class="text-right d-flex flex-row align-items-start justify-content-start">
							<div class="product_button product_fav text-center d-flex flex-column align-items-center justify-content-center">
								<div><div><img onerror="imgError(this)" src="img/general/heart_2.svg" class="svg" alt=""><div>+</div></div></div>
							</div>
							<div id="product_cart_${spnb.maSanPham}" class="product_button product_cart text-center d-flex flex-column align-items-center justify-content-center">
								<div><div><img onerror="imgError(this)" src="img/general/cart.svg" class="svg" alt=""><div>+</div></div></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
</c:if>