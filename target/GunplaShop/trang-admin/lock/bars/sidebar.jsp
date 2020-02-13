<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="sidebar-wrapper" data-simplebar="" data-simplebar-auto-hide="true">
	<div class="brand-logo">
		<a href="index.jsp?route=main"> <img src="../img/general/logo_1.png" class="logo-icon" alt="logo icon">
			<h5 class="logo-text"> Quản trị viên</h5>
		</a>
	</div>
	<ul class="sidebar-menu do-nicescrol">
		<li>
			<a href="index.jsp?route=main" class="waves-effect">
				<i class="icon-home"></i> 
				<span>Bảng điều khiển</span> 
				<i class="fa fa-angle-left pull-right"></i>
			</a>
		</li>
		
		<li>
			<a href="javaScript:void();" class="waves-effect">
				<i class="icon-grid"></i>
				<span>Quản lý</span>
				<i class="fa fa-angle-left float-right"></i>
			</a>
			<ul class="sidebar-submenu">
				<li>
					<a href="index.jsp?route=khachhang-danhsach">
						<i class="fa fa-circle-o"></i> Quản lý khách hàng
					</a>
				</li>
				<li>
					<a href="index.jsp?route=sanpham-danhsach">
						<i class="fa fa-circle-o"></i> Quản lý sản phẩm
					</a>
				</li>
			</ul>
		</li>
	</ul>

</div>