<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="entities.SanPham"%>
<%@ page import="dao.SanPhamDAO"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%
	ArrayList<SanPham> spList = (ArrayList<SanPham>) new SanPhamDAO().select();
%>
<c:set var="spList" value="<%=spList%>"/>

<div class="container-fluid">
	<!-- Breadcrumb-->
	<div class="row pt-2 pb-2">
		<div class="col-sm-9">
			<h4 class="page-title">Quản lý sản phẩm</h4>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="index.jsp?route=main">Trang chủ</a></li>
				<li class="breadcrumb-item"><a href="javaScript:void();">Quản lý</a></li>
				<li class="breadcrumb-item active" aria-current="page">Quản lý sản phẩm</li>
			</ol>
		</div>
	</div>
	<!-- End Breadcrumb-->
	
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-header">
					<i class="fa fa-table"></i>	Danh sách sản phẩm
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table id="default-datatable" class="table table-bordered">
							<thead class="thead-light">
								<tr>
									<th>Chọn</th>
									<th>Xóa</th>
									<th>Mã sản phẩm</th>
									<th>Tên sản phẩm</th>
									<th>Đơn giá</th>
									<th>Số lượng</th>
									<th>Mã loại</th>
									<th>Hình</th>
									<th>Lượt thích</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${not empty spList}">
									<c:forEach var="sp" items="${spList}">
										<tr>
											<td>
												<input name="btnChon" value="${sp.maSanPham}" type="checkbox" class="js-switch" data-color="#008cff" data-switchery="true" style="display: none;">
											</td>
											<td>
												<button id="btnXoa_${sp.maSanPham}" type="button" class="btnXoa btn btn-outline-danger waves-effect waves-light m-1">
													<i class="fa fa-trash-o"></i>
												</button>
											</td>
											<td><a href="index.jsp?route=sanpham-chitiet&maSanPham=${sp.maSanPham}&maLoai=${sp.maLoai}">${sp.maSanPham}</a></td>
											<td><a href="index.jsp?route=sanpham-chitiet&maSanPham=${sp.maSanPham}&maLoai=${sp.maLoai}">${sp.tenSanPham}</a></td>
											<td><a href="index.jsp?route=sanpham-chitiet&maSanPham=${sp.maSanPham}&maLoai=${sp.maLoai}">${sp.donGia}</a></td>
											<td><a href="index.jsp?route=sanpham-chitiet&maSanPham=${sp.maSanPham}&maLoai=${sp.maLoai}">${sp.soLuong}</a></td>
											<td><a href="index.jsp?route=sanpham-chitiet&maSanPham=${sp.maSanPham}&maLoai=${sp.maLoai}">${sp.maLoai}</a></td>
											<td><a target="_blank" href="../img/product-type/${sp.maLoai}/${sp.hinh}">
												<img width="50" height="50" src="../img/product-type/${sp.maLoai}/${sp.hinh}"></a>
											</td>
											<td><a href="index.jsp?route=sanpham-chitiet&maSanPham=${sp.maSanPham}&maLoai=${sp.maLoai}">${sp.luotThich}</a></td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
							<tfoot class="thead-light">
								<tr>
									<th>Chọn</th>
									<th>Xóa</th>
									<th>Mã sản phẩm</th>
									<th>Tên sản phẩm</th>
									<th>Đơn giá</th>
									<th>Số lượng</th>
									<th>Mã loại</th>
									<th>Hình</th>
									<th>Lượt thích</th>
								</tr>
							</tfoot>
						</table>
					</div>
					<a href="index.jsp?route=sanpham-them"><button id="btnThemSanPham" type="button" class="btn btn-outline-primary waves-effect waves-light m-1">Thêm sản phẩm mới</button></a>
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
									<th>Mã sản phẩm</th>
									<th>Tên sản phẩm</th>
									<th>Đơn giá</th>
									<th>Số lượng</th>
									<th>Mã loại</th>
									<th>Hình</th>
									<th>Lượt thích</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${not empty spList}">
									<c:forEach var="sp" items="${spList}">
										<tr>
											<td>${sp.maSanPham}</td>
											<td>${sp.tenSanPham}</td>
											<td>${sp.donGia}</td>
											<td>${sp.soLuong}</td>
											<td>${sp.maLoai}</td>
											<td><a target="_blank" href="../img/product-type/${sp.maLoai}/${sp.hinh}">
												<img width="50" height="50" src="../img/product-type/${sp.maLoai}/${sp.hinh}"></a>
											</td>
											<td>${sp.luotThich}</td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
							<tfoot class="thead-light">
								<tr>
									<th>Mã sản phẩm</th>
									<th>Tên sản phẩm</th>
									<th>Đơn giá</th>
									<th>Số lượng</th>
									<th>Mã loại</th>
									<th>Hình</th>
									<th>Lượt thích</th>
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
