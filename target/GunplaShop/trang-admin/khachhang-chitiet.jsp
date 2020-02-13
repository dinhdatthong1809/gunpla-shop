<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="entities.KhachHang"%>
<%@ page import="dao.KhachHangDAO"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%
	KhachHang kh = new KhachHangDAO().findById(request.getParameter("tenTaiKhoan"));
	int soLuongDonHang = new KhachHangDAO().countInvoice(request.getParameter("tenTaiKhoan"));
%>
<c:set var="kh" value="<%=kh%>" />
<c:set var="soLuongDonHang" value="<%=soLuongDonHang%>" />

<div class="container-fluid">
	<!-- Breadcrumb-->
	<div class="row pt-2 pb-2">
		<div class="col-sm-9">
			<h4 class="page-title">Thông tin khách hàng</h4>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="index.jsp?route=main">Trang chủ</a></li>
				<li class="breadcrumb-item"><a href="javaScript:void();">Quản lý</a></li>
				<li class="breadcrumb-item"><a href="index.jsp?route=khachhang-danhsach">Quản lý khách hàng</a></li>
				<li class="breadcrumb-item active" aria-current="page">Thông tin khách hàng</li>
			</ol>
		</div>
	</div>
	<!-- End Breadcrumb-->

	<div class="row">
		<div class="col-lg-4">
			<div class="profile-card-3">
				<div class="card">
					<div class="user-fullimage">
						<img id="userAvatar" src="../img/user-avatar/${kh.hinh}" alt="user avatar" class="card-img-top">
						<div class="details">
							<h5 class="mb-1 text-white ml-3">${kh.hoTen}</h5>
							<h6 class="text-white ml-3">${kh.tenTaiKhoan}</h6>
						</div>
						<div class="middle">
							<button id="btnTaiHinh" type="button" class="btn btn-primary btn-round waves-effect waves-light m-1">Tải hình mới</button>
<!-- 							<button id="btnTaiHinh" type="button" class="btn btn-outline-primary btn-round waves-effect waves-light m-1">Tải hình mới</button> -->
						</div>
					</div>
					<div class="card-body text-center">
						<p>Mô tả về khách hàng</p>
						<div class="row">
							<div class="col p-2">
								<h5 class="mb-0 line-height-5">${soLuongDonHang}</h5>
								<small class="mb-0 font-weight-bold">Đơn hàng</small>
							</div>
						</div>

						<div class="list-inline mt-2">
							<a href="javascript:void()" class="btn-social btn-social-circle btn-outline-facebook waves-effect waves-light m-1"> <i class="fa fa-facebook"></i></a>
							<a href="javascript:void()" class="btn-social btn-social-circle btn-outline-google-plus waves-effect waves-light m-1"> <i class="fa fa-google-plus"></i></a>
						</div>
						<hr>
						<a href="javascript:void():" class="btn btn-outline-primary btn-sm btn-round waves-effect waves-light m-1">Gửi email</a>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-8">
			<div class="card">
				<div class="card-body">
					<ul class="nav nav-tabs nav-tabs-primary top-icon nav-justified">
						<li class="nav-item"><a href="javascript:void();" data-target="#profile" data-toggle="pill" class="nav-link active"><i class="icon-user"></i> <span class="hidden-xs">Hồ sơ</span></a></li>
						<li class="nav-item"><a href="javascript:void();" data-target="#edit" data-toggle="pill" class="nav-link"><i class="icon-note"></i> <span class="hidden-xs">Chỉnh Sửa</span></a></li>
					</ul>
					<div class="tab-content p-3">
						<div class="tab-pane active" id="profile">
							<h5 class="mb-3">Hồ sơ</h5>
							<div class="row">
								<div class="col-md-6">
									<h6>Họ tên</h6>
									<p>${kh.hoTen}</p>
									<h6>Giới tính</h6>
									<c:if test="${kh.gioiTinh == true}">
										<p>Nam</p>
									</c:if>
									<c:if test="${kh.gioiTinh == false}">
										<p>Nữ</p>
									</c:if>
									<h6>Địa chỉ</h6>
									<p>${kh.diaChi}</p>
									<h6>Ngày sinh</h6>
									<p>${kh.ngaySinh}</p>
									<h6>Email</h6>
									<p>${kh.email}</p>
									<h6>Điện thoại</h6>
									<p>${kh.dienThoai}</p>
								</div>
								<div class="col-md-6">
									<h6>Tên tài khoản</h6>
									<p>${kh.tenTaiKhoan}</p>
									<h6>Mật khẩu</h6>
									<p>${kh.matKhau}</p>
								</div>
							</div>
							<!--/row-->
						</div>
						<div class="tab-pane" id="edit">
							<form id="capNhatForm" action="QuanLyKhachHangServlet" method="post" enctype="multipart/form-data">
								<div style="display: none" class="form-group row">
									<input name="yeuCau" class="form-control" type="text" value="capNhat">
								</div>
								<div class="form-group row">
									<label class="col-lg-3 col-form-label form-control-label">Họ tên</label>
									<div class="col-lg-9">
										<input id="txtHoTen" required name="txtHoTen" class="form-control" type="text" value="${kh.hoTen}">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-3 col-form-label form-control-label">Giới tính</label>
									<div class="col-lg-9">
										<div class="icheck-primary">
											<input ${kh.gioiTinh == true ? 'checked' : ''} type="radio" id="primary1" name="rdoGioiTinh" value="rdoGioiTinhNam"><label for="primary1">Nam</label>
										</div>
										<div class="icheck-primary">
											<input ${kh.gioiTinh == false ? 'checked' : ''} type="radio" id="primary2" name="rdoGioiTinh" value="rdoGioiTinhNu"><label for="primary2">Nữ</label>
										</div>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-3 col-form-label form-control-label">Địa chỉ</label>
									<div class="col-lg-9">
										<input id="txtDiaChi" required name="txtDiaChi" class="form-control" type="text" value="${kh.diaChi}">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-3 col-form-label form-control-label">Ngày sinh</label>
									<div class="col-lg-9">
										<input id="txtNgaySinh" required name="txtNgaySinh" class="form-control" type="date" value="${kh.ngaySinh}">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-3 col-form-label form-control-label">Email</label>
									<div class="col-lg-9">
										<input id="txtEmail" required name="txtEmail" class="form-control" type="email" value="${kh.email}">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-3 col-form-label form-control-label">Điện thoại</label>
									<div class="col-lg-9">
										<input id="txtDienThoai" required name="txtDienThoai" class="form-control" type="text" value="${kh.dienThoai}">
									</div>
								</div>
								<div style="display: none" class="form-group row">
									<label class="col-lg-3 col-form-label form-control-label">Hình</label>
									<div class="col-lg-9">
										<input id="txtHinh" accept=".jpg" name="txtHinh" class="form-control" type="file">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-3 col-form-label form-control-label">Tên tài khoản</label>
									<div class="col-lg-9">
										<input readonly id="txtTenTaiKhoan" name="txtTenTaiKhoan" class="form-control" type="text" value="${kh.tenTaiKhoan}">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-3 col-form-label form-control-label">Mật khẩu</label>
									<div class="col-lg-9">
										<input id="txtMatKhau" name="txtMatKhau" class="form-control" type="password" value="${kh.matKhau}">
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
