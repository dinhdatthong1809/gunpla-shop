<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="entities.KhachHang"%>
<%@ page import="dao.KhachHangDAO"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%
	ArrayList<KhachHang> khList = (ArrayList<KhachHang>) new KhachHangDAO().select();
%>
<c:set var="khList" value="<%=khList%>"/>

<div class="container-fluid">
	<!-- Breadcrumb-->
	<div class="row pt-2 pb-2">
		<div class="col-sm-9">
			<h4 class="page-title">Quản lý khách hàng</h4>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="index.jsp?route=main">Trang chủ</a></li>
				<li class="breadcrumb-item"><a href="javaScript:void();">Quản lý</a></li>
				<li class="breadcrumb-item active" aria-current="page">Quản lý khách hàng</li>
			</ol>
		</div>
	</div>
	<!-- End Breadcrumb-->
	
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-header">
					<i class="fa fa-table"></i>	Danh sách khách hàng
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table id="default-datatable" class="table table-bordered">
							<thead class="thead-light">
								<tr>
									<th>Chọn</th>
									<th>Xóa</th>
									<th>Tên tài khoản</th>
									<th>Mật khẩu</th>
									<th>Họ tên</th>
									<th>Giới tính</th>
									<th>Địa chỉ</th>
									<th>Ngày sinh</th>
									<th>Email</th>
									<th>Điện thoại</th>
									<th>Hình</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${not empty khList}">
									<c:forEach var="kh" items="${khList}">
										<tr>
											<td>
												<input name="btnChon" value="${kh.tenTaiKhoan}" type="checkbox" class="js-switch" data-color="#008cff" data-switchery="true" style="display: none;">
											</td>
											<td>
												<button id="btnXoa_${kh.tenTaiKhoan}" type="button" class="btnXoa btn btn-outline-danger waves-effect waves-light m-1">
													<i class="fa fa-trash-o"></i>
												</button>
											</td>
											<td><a href="index.jsp?route=khachhang-chitiet&tenTaiKhoan=${kh.tenTaiKhoan}">${kh.tenTaiKhoan}</a></td>
											<td><a href="index.jsp?route=khachhang-chitiet&tenTaiKhoan=${kh.tenTaiKhoan}">${kh.matKhau}</a></td>
											<td><a href="index.jsp?route=khachhang-chitiet&tenTaiKhoan=${kh.tenTaiKhoan}">${kh.hoTen}</a></td>
											<c:if test="${kh.gioiTinh == true}">
												<td><a href="index.jsp?route=khachhang-chitiet&tenTaiKhoan=${kh.tenTaiKhoan}">Nam</a></td>
											</c:if>
											<c:if test="${kh.gioiTinh == false}">
												<td><a href="index.jsp?route=khachhang-chitiet&tenTaiKhoan=${kh.tenTaiKhoan}">Nữ</a></td>
											</c:if>
											<td><a href="index.jsp?route=khachhang-chitiet&tenTaiKhoan=${kh.tenTaiKhoan}">${kh.diaChi}</a></td>
											<td><a href="index.jsp?route=khachhang-chitiet&tenTaiKhoan=${kh.tenTaiKhoan}">${kh.ngaySinh}</a></td>
											<td><a href="index.jsp?route=khachhang-chitiet&tenTaiKhoan=${kh.tenTaiKhoan}">${kh.email}</a></td>
											<td><a href="index.jsp?route=khachhang-chitiet&tenTaiKhoan=${kh.tenTaiKhoan}">${kh.dienThoai}</a></td>
											<td><a target="_blank" href="../img/user-avatar/${kh.hinh}">
												<img width="50" height="50" src="../img/user-avatar/${kh.hinh}"></a>
											</td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
							<tfoot class="thead-light">
								<tr>
									<th>Chọn</th>
									<th>Xóa</th>
									<th>Tên tài khoản</th>
									<th>Mật khẩu</th>
									<th>Họ tên</th>
									<th>Giới tính</th>
									<th>Địa chỉ</th>
									<th>Ngày sinh</th>
									<th>Email</th>
									<th>Điện thoại</th>
									<th>Hình</th>
								</tr>
							</tfoot>
						</table>
					</div>
					<button id="btnXoaMucDaChon" type="button" class="btn btn-outline-danger waves-effect waves-light m-1">Xóa các mục đã chọn</button>
				</div>
			</div>
		</div>
	</div>
	<!-- End Row-->

	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-header">
					<i class="fa fa-table"></i> Xuất dữ liệu
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table id="example" class="table table-bordered">
							<thead class="thead-light">
								<tr>
									<th>Tên tài khoản</th>
									<th>Mật khẩu</th>
									<th>Họ tên</th>
									<th>Giới tính</th>
									<th>Địa chỉ</th>
									<th>Ngày sinh</th>
									<th>Email</th>
									<th>Điện thoại</th>
									<th>Hình</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${not empty khList}">
									<c:forEach var="kh" items="${khList}">
										<tr>
											<td>${kh.tenTaiKhoan}</td>
											<td>${kh.matKhau}</td>
											<td>${kh.hoTen}</td>
											<c:if test="${kh.gioiTinh == true}">
												<td>Nam</td>
											</c:if>
											<c:if test="${kh.gioiTinh == false}">
												<td>Nữ</td>
											</c:if>
											<td>${kh.diaChi}</td>
											<td>${kh.ngaySinh}</td>
											<td>${kh.email}</td>
											<td>${kh.dienThoai}</td>
											<td><a target="_blank" href="../img/user-avatar/${kh.hinh}">
												<img width="50" height="50" src="../img/user-avatar/${kh.hinh}"></a>
											</td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
							<tfoot class="thead-light">
								<tr>
									<th>Tên tài khoản</th>
									<th>Mật khẩu</th>
									<th>Họ tên</th>
									<th>Giới tính</th>
									<th>Địa chỉ</th>
									<th>Ngày sinh</th>
									<th>Email</th>
									<th>Điện thoại</th>
									<th>Hình</th>
								</tr>
							</tfoot>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Row-->

</div>
<!-- End container-fluid-->


