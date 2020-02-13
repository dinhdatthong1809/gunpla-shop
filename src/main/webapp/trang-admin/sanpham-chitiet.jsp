<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="entities.SanPham"%>
<%@ page import="dao.SanPhamDAO"%>
<%@ page import="entities.LoaiSanPham"%>
<%@ page import="dao.LoaiSanPhamDAO"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%
	SanPham sp = new SanPhamDAO().findById(request.getParameter("maSanPham"));
	ArrayList<LoaiSanPham> lspList = (ArrayList<LoaiSanPham>) new LoaiSanPhamDAO().select();
%>
<c:set var="sp" value="<%=sp%>" />
<c:set var="lspList" value="<%=lspList%>" />

<div class="container-fluid">
	<!-- Breadcrumb-->
	<div class="row pt-2 pb-2">
		<div class="col-sm-9">
			<h4 class="page-title">Thông tin sản phẩm</h4>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="index.jsp?route=main">Trang chủ</a></li>
				<li class="breadcrumb-item"><a href="javaScript:void();">Quản lý</a></li>
				<li class="breadcrumb-item"><a href="index.jsp?route=sanpham-danhsach">Quản lý sản phẩm</a></li>
				<li class="breadcrumb-item active" aria-current="page">Thông tin sản phẩm</li>
			</ol>
		</div>
	</div>
	<!-- End Breadcrumb-->

	<div class="row">
		<div class="col-lg-4">
			<div class="profile-card-3">
				<div class="card">
					<div class="user-fullimage">
						<img id="productImage" src="../img/product-type/${sp.maLoai}/${sp.hinh}" alt="hình sản phẩm" class="card-img-top">
						<div class="middle">
							<button id="btnTaiHinh" type="button" class="btn btn-primary btn-round waves-effect waves-light m-1">Tải hình mới</button>
						</div>
					</div>
					<hr>
					<div class="user-fullimage">
						<img id="productImage2" src="../img/product-type/${sp.maLoai}/${fn:replace(sp.hinh, '.jpg', '_prototype.jpg')}" alt="hình sản phẩm 2" class="card-img-top">
						<div class="middle">
							<button id="btnTaiHinh2" type="button" class="btn btn-primary btn-round waves-effect waves-light m-1">Tải hình mới</button>
						</div>
					</div>
					<hr>
					<div class="user-fullimage">
						<img id="productImage3" src="../img/product-type/${sp.maLoai}/${fn:replace(sp.hinh, '.jpg', '_prototype2.jpg')}" alt="hình sản phẩm 3" class="card-img-top">
						<div class="middle">
							<button id="btnTaiHinh3" type="button" class="btn btn-primary btn-round waves-effect waves-light m-1">Tải hình mới</button>
						</div>
					</div>
					<div class="card-body text-center">
						<p>${sp.tenSanPham}</p>
						<div class="row">
							<div class="col p-2">
								<h5 class="mb-0 line-height-5">${sp.luotThich}</h5>
								<small class="mb-0 font-weight-bold">Lượt thích</small>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-8">
			<div class="card">
				<div class="card-body">
					<ul class="nav nav-tabs nav-tabs-primary top-icon nav-justified">
						<li class="nav-item"><a href="javascript:void();" data-target="#profile" data-toggle="pill" class="nav-link active"><i class="icon-user"></i> <span class="hidden-xs">Thông tin</span></a></li>
						<li class="nav-item"><a href="javascript:void();" data-target="#edit" data-toggle="pill" class="nav-link"><i class="icon-note"></i> <span class="hidden-xs">Chỉnh Sửa</span></a></li>
					</ul>
					<div class="tab-content p-3">
						<div class="tab-pane active" id="profile">
							<h5 class="mb-3">Thông tin chi tiết sản phẩm</h5>
							<div class="row">
								<div class="col-md-6">
									<h6>Mã sản phẩm</h6>
									<p>${sp.maSanPham}</p>
									<h6>Tên sản phẩm</h6>
									<p>${sp.tenSanPham}</p>
									<h6>Đơn giá</h6>
									<p>${sp.donGia}</p>
									<h6>Số lượng</h6>
									<p>${sp.soLuong}</p>
									<h6>Mã loại</h6>
									<p>${sp.maLoai}</p>
									<h6>Lượt thích</h6>
									<p>${sp.luotThich}</p>
								</div>
								<div class="col-md-6">
<!-- 									<h6>Tên tài khoản</h6> -->
<%-- 									<p>${kh.tenTaiKhoan}</p> --%>
<!-- 									<h6>Mật khẩu</h6> -->
<%-- 									<p>${kh.matKhau}</p> --%>
								</div>
							</div>
							<!--/row-->
						</div>
						<div class="tab-pane" id="edit">
							<form id="capNhatForm" action="QuanLySanPhamServlet" method="post" enctype="multipart/form-data">
								<div style="display: none" class="form-group row">
									<input name="yeuCau" class="form-control" type="text" value="capNhat">
								</div>
								<div class="form-group row">
									<label class="col-lg-3 col-form-label form-control-label">Mã sản phẩm</label>
									<div class="col-lg-9">
										<input readonly id="txtMaSanPham" name="txtMaSanPham" class="form-control" type="text" value="${sp.maSanPham}">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-3 col-form-label form-control-label">Tên sản phẩm</label>
									<div class="col-lg-9">
										<input id="txtTenSanPham" name="txtTenSanPham" class="form-control" type="text" value="${sp.tenSanPham}">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-3 col-form-label form-control-label">Đơn giá</label>
									<div class="col-lg-9">
										<input id="txtDonGia" required name="txtDonGia" class="form-control" type="text" value="${sp.donGia}">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-3 col-form-label form-control-label">Số lượng</label>
									<div class="col-lg-9">
										<input id="txtSoLuong" required name="txtSoLuong" class="form-control" type="text" value="${sp.soLuong}">
									</div>
								</div>
								<div class="form-group row">
									<label for="basic-select" class="col-sm-3 col-form-label">Loại</label>
									<div class="col-sm-9">
										<select name="cboMaLoai" class="form-control" id="basic-select">
											<c:forEach var="lsp" items="${lspList}">
												<c:choose>
													<c:when test="${lsp.maLoai == sp.maLoai}">
														<option value="${lsp.maLoai}" selected>${lsp.tenLoai}</option>
													</c:when>
													<c:otherwise>
														<option value="${lsp.maLoai}">${lsp.tenLoai}</option>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-3 col-form-label form-control-label">Lượt thích</label>
									<div class="col-lg-9">
										<input id="txtLuotThich" required name="txtLuotThich" class="form-control" type="text" value="${sp.luotThich}">
									</div>
								</div>
								<div style="display: none" class="form-group row">
									<label class="col-lg-3 col-form-label form-control-label">Hình</label>
									<div class="col-lg-9">
										<input id="txtHinh" accept=".jpg" name="txtHinh" class="form-control" type="file">
									</div>
								</div>
								<div style="display: none" class="form-group row">
									<label class="col-lg-3 col-form-label form-control-label">Hình 2</label>
									<div class="col-lg-9">
										<input id="txtHinh2" accept=".jpg" name="txtHinh2" class="form-control" type="file">
									</div>
								</div>
								<div style="display: none" class="form-group row">
									<label class="col-lg-3 col-form-label form-control-label">Hình 3</label>
									<div class="col-lg-9">
										<input id="txtHinh3" accept=".jpg" name="txtHinh3" class="form-control" type="file">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-3 col-form-label form-control-label"></label>
									<div class="col-lg-9">
										<input type="reset" class="btn btn-secondary" value="Hồi phục"> <input id="btnCapNhat" type="submit" class="btn btn-primary" value="Lưu thay đổi">
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- End container-fluid-->
