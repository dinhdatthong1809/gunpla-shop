<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ page import="java.util.ArrayList"%>
<%@ page import="entities.DonHang"%>
<%@ page import="dao.DonHangDAO"%>
<%@ page import="entities.DonHangNgoai"%>
<%@ page import="dao.DonHangNgoaiDAO"%>
<%@ page import="entities.LoaiSanPham"%>
<%@ page import="dao.LoaiSanPhamDAO"%>
<%@ page import="entities.SanPham"%>
<%@ page import="dao.SanPhamDAO"%>
<%@ page import="entities.KhachHang"%>
<%@ page import="dao.KhachHangDAO"%>

<%
	ArrayList<DonHang> dhList = (ArrayList<DonHang>) new DonHangDAO().selectNewest();
	ArrayList<DonHangNgoai> dhnList = (ArrayList<DonHangNgoai>) new DonHangNgoaiDAO().selectNewest();
	ArrayList<SanPham> spList = (ArrayList<SanPham>) new SanPhamDAO().select();
	ArrayList<KhachHang> khList = (ArrayList<KhachHang>) new KhachHangDAO().select();
%>
<c:set var="dhList" value="<%=dhList%>"/>
<c:set var="dhnList" value="<%=dhnList%>"/>
<c:set var="spList" value="<%=spList%>"/>
<c:set var="khList" value="<%=khList%>"/>

<div class="container-fluid">

	<!--Start Dashboard Content-->
	
	<div class="row mt-3">
		<div class="col-12 col-lg-6 col-xl-3">
			<div class="card bg-pattern-primary">
				<div class="card-body">
					<div class="media">
						<div class="media-body text-left">
							<h4 class="text-white">${fn:length(dhList)}</h4>
							<span class="text-white">Đơn hàng</span>
						</div>
						<div class="align-self-center w-circle-icon rounded-circle bg-contrast">
							<i class="icon-basket-loaded text-white"></i>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-12 col-lg-6 col-xl-3">
			<div class="card bg-pattern-danger">
				<div class="card-body">
					<div class="media">
						<div class="media-body text-left">
							<h4 class="text-white">${fn:length(spList)}</h4>
							<span class="text-white">Sản phẩm</span>
						</div>
						<div class="align-self-center w-circle-icon rounded-circle bg-contrast">
							<i class="icon-wallet text-white"></i>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-12 col-lg-6 col-xl-3">
			<div class="card bg-pattern-warning">
				<div class="card-body">
					<div class="media">
						<div class="media-body text-left">
							<h4 class="text-white">${fn:length(khList)}</h4>
							<span class="text-white">Khách hàng</span>
						</div>
						<div class="align-self-center w-circle-icon rounded-circle bg-contrast">
							<i class="icon-user text-white"></i>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--End Row-->
	
	<div class="row">
		<div class="col-lg-12">
			<div class="card bg-primary">
				<div class="card-header bg-transparent text-white border-0">
					Đơn hàng gần đây
					<div class="card-action">
						<div class="dropdown">
							<a href="javascript:void();" class="dropdown-toggle dropdown-toggle-nocaret" data-toggle="dropdown">
								<i class="icon-options text-white"></i>
							</a>
						</div>
					</div>
				</div>
				<div class="table-responsive">
					<table class="table align-items-center table-flush table-primary">
						<thead>
							<tr>
								<th>Mã đơn hàng</th>
								<th>Ngày đặt hàng</th>
								<th>Tên tài khoản khách hàng</th>
							</tr>
						</thead>
						<c:if test="${not empty dhList}">
							<c:forEach var="dh" items="${dhList}" begin="1" end="6">
								<tr>
									<td>${dh.maDonHang}</td>
									<td>${dh.ngayDatHang}</td>
									<td>${dh.tenTaiKhoanKhachHang}</td>
								</tr>
							</c:forEach>
						</c:if>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!--End Row-->

	<div class="row">
		<div class="col-lg-12">
			<div class="card bg-primary">
				<div class="card-header bg-transparent text-white border-0">
					Đơn hàng ngoài gần đây
					<div class="card-action">
						<div class="dropdown">
							<a href="javascript:void();" class="dropdown-toggle dropdown-toggle-nocaret" data-toggle="dropdown">
								<i class="icon-options text-white"></i>
							</a>
						</div>
					</div>
				</div>
				<div class="table-responsive">
					<table
						class="table align-items-center table-flush table-primary">
						<thead>
							<tr>
								<th>Mã đơn hàng</th>
								<th>Tên khách hàng</th>
								<th>Giới tinh</th>
								<th>Địa chỉ</th>
								<th>Email</th>
								<th>Số điện thoại</th>
								<th>Ngày đặt hàng</th>
							</tr>
						</thead>
						<c:if test="${not empty dhnList}">
							<c:forEach var="dhn" items="${dhnList}" begin="1" end="6">
								<tr>
									<td>${dhn.maDonHangNgoai}</td>
									<td>${dhn.tenKhachHangNgoai}</td>
									<c:if test="${dhn.gioiTinh == true}">
										<td>Nam</td>
									</c:if>
									<c:if test="${dhn.gioiTinh == false}">
										<td>Nữ</td>
									</c:if>
									<td>${dhn.diaChi}</td>
									<td>${dhn.email}</td>
									<td>${dhn.dienThoai}</td>
									<td>${dhn.ngayDatHang}</td>
								</tr>
							</c:forEach>
						</c:if>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!--End Row-->
	
	<!--End Dashboard Content-->
	
</div>
<!-- End container-fluid-->
