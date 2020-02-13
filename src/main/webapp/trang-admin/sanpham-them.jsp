<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="entities.SanPham"%>
<%@ page import="dao.SanPhamDAO"%>
<%@ page import="entities.LoaiSanPham"%>
<%@ page import="dao.LoaiSanPhamDAO"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%
	ArrayList<LoaiSanPham> lspList = (ArrayList<LoaiSanPham>) new LoaiSanPhamDAO().select();
%>
<c:set var="lspList" value="<%=lspList%>" />

<div class="container-fluid">
	<!-- Breadcrumb-->
	<div class="row pt-2 pb-2">
		<div class="col-sm-9">
			<h4 class="page-title">Thêm sản phẩm mới</h4>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="index.jsp?route=main">Trang chủ</a></li>
				<li class="breadcrumb-item"><a href="javaScript:void();">Quản lý</a></li>
				<li class="breadcrumb-item"><a href="index.jsp?route=sanpham-danhsach">Quản lý sản phẩm</a></li>
				<li class="breadcrumb-item active" aria-current="page">Thêm sản phẩm mới</li>
			</ol>
		</div>
	</div>
	<!-- End Breadcrumb-->

	<div class="row">
		<div class="col-lg-4">
			<div class="profile-card-3">
				<div class="card">
					<div class="user-fullimage">
						<img id="productImage" src="../img/no-image-found.jpg" alt="hình sản phẩm" class="card-img-top">
						<div class="middle">
							<button id="btnTaiHinh" type="button" class="btn btn-primary btn-round waves-effect waves-light m-1">Tải hình mới</button>
						</div>
					</div>
					<hr>
					<div class="user-fullimage">
						<img id="productImage2" src="../img/no-image-found.jpg" alt="hình sản phẩm 2" class="card-img-top">
						<div class="middle">
							<button id="btnTaiHinh2" type="button" class="btn btn-primary btn-round waves-effect waves-light m-1">Tải hình mới</button>
						</div>
					</div>
					<hr>
					<div class="user-fullimage">
						<img id="productImage3" src="../img/no-image-found.jpg" alt="hình sản phẩm 3" class="card-img-top">
						<div class="middle">
							<button id="btnTaiHinh3" type="button" class="btn btn-primary btn-round waves-effect waves-light m-1">Tải hình mới</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-8">
			<div class="card">
				<div class="card-body">
					<ul class="nav nav-tabs nav-tabs-primary top-icon nav-justified">
						<li class="nav-item"><a href="javascript:void();" data-target="#edit" data-toggle="pill" class="nav-link"><i class="icon-note"></i> <span class="hidden-xs">Thêm sản phẩm</span></a></li>
					</ul>
					<div class="tab-content p-3">
						<div class="tab-pane active" id="edit">
							<form id="themForm" action="QuanLySanPhamServlet" method="post" enctype="multipart/form-data">
								<div style="display: none" class="form-group row">
									<input name="yeuCau" class="form-control" type="text" value="them">
								</div>
								<div class="form-group row">
									<label class="col-lg-3 col-form-label form-control-label">Tên sản phẩm</label>
									<div class="col-lg-9">
										<input id="txtTenSanPham" name="txtTenSanPham" class="form-control" type="text" value="">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-3 col-form-label form-control-label">Đơn giá</label>
									<div class="col-lg-9">
										<input id="txtDonGia" required name="txtDonGia" class="form-control" type="text" value="">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-3 col-form-label form-control-label">Số lượng</label>
									<div class="col-lg-9">
										<input id="txtSoLuong" required name="txtSoLuong" class="form-control" type="text" value="">
									</div>
								</div>
								<div class="form-group row">
									<label for="basic-select" class="col-sm-3 col-form-label">Loại</label>
									<div class="col-sm-9">
										<select name="cboMaLoai" class="form-control" id="basic-select">
											<c:forEach var="lsp" items="${lspList}">
												<c:choose>
													<c:when test="${lsp.maLoai == 1}">
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
										<input id="txtLuotThich" required name="txtLuotThich" class="form-control" type="text" value="">
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
										<input type="reset" class="btn btn-secondary" value="Hồi phục"> <input id="btnThem" type="submit" class="btn btn-primary" value="Thêm">
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
