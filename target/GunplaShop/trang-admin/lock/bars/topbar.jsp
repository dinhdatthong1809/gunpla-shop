<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<header class="topbar-nav">
	<nav class="navbar navbar-expand fixed-top bg-dark">
		<ul class="navbar-nav mr-auto align-items-center">
			<li class="nav-item">
				<a class="nav-link toggle-menu" href="javascript:void();">
					<i class="icon-menu menu-icon"></i>
				</a>
			</li>
		</ul>

		<ul class="navbar-nav align-items-center right-nav-link">
			<li class="nav-item dropdown-lg">
				<a class="nav-link dropdown-toggle dropdown-toggle-nocaret waves-effect" data-toggle="dropdown" href="javascript:void();">
					<i class="icon-bell"></i>
					<span class="badge badge-primary badge-up">10</span>
				</a>
				<div class="dropdown-menu dropdown-menu-right">
					<ul class="list-group list-group-flush">
						<li	class="list-group-item d-flex justify-content-between align-items-center">
							Bạn có 10 thông báo mới <span class="badge badge-primary">10</span>
						</li>
						<li class="list-group-item">
							<a href="javaScript:void();">
								<div class="media">
									<i class="icon-people fa-2x mr-3 text-info"></i>
									<div class="media-body">
										<h6 class="mt-0 msg-title">Khách hàng mới</h6>
										<p class="msg-info">Lorem ipsum dolor sit amet...</p>
									</div>
								</div>
							</a>
						</li>
						<li class="list-group-item">
							<a href="javaScript:void();">
								<div class="media">
									<i class="icon-cup fa-2x mr-3 text-warning"></i>
									<div class="media-body">
										<h6 class="mt-0 msg-title">Đơn hàng mới</h6>
										<p class="msg-info">Lorem ipsum dolor sit amet...</p>
									</div>
								</div>
							</a>
						</li>
						<li class="list-group-item">
							<a href="javaScript:void();">Tất cả thông báo</a>
						</li>
					</ul>
				</div>
			</li>
			<li class="nav-item language">
				<a class="nav-link dropdown-toggle dropdown-toggle-nocaret waves-effect" data-toggle="dropdown" href="#">
					<i class="flag-icon flag-icon-gb"></i>
				</a>
				<ul class="dropdown-menu dropdown-menu-right">
					<li class="dropdown-item">
						<i class="flag-icon flag-icon-gb mr-2"></i> Tiếng Anh
					</li>
					<li class="dropdown-item">
						<i class="flag-icon flag-icon-fr mr-2"></i> Tiếng Pháp
					</li>
					<li class="dropdown-item">
						<i class="flag-icon flag-icon-cn mr-2"></i> Tiếng Trung
					</li>
					<li class="dropdown-item">
						<i class="flag-icon flag-icon-de mr-2"></i> Tiếng Đức
					</li>
				</ul>
			</li>
			<li class="nav-item">
				<a class="nav-link dropdown-toggle dropdown-toggle-nocaret" data-toggle="dropdown" href="#">
					<span class="user-profile">
						<img src="assets\images\avatars\avatar-17.png" class="img-circle" alt="user avatar">
					</span>
				</a>
				<ul class="dropdown-menu dropdown-menu-right">
					<li class="dropdown-item user-details">
						<a href="javaScript:void();">
							<div class="media">
								<div class="avatar">
									<img class="align-self-start mr-3" src="assets\images\avatars\avatar-17.png" alt="user avatar">
								</div>
								<div class="media-body">
									<h6 class="mt-2 user-title">${sessionScope.taiKhoanQuanTriVien.hoTen}</h6>
									<p class="user-subtitle">mccoy@example.com</p>
								</div>
							</div>
						</a>
					</li>
					<li class="dropdown-divider"></li>
					<li class="dropdown-item">
						<a href="javaScript:void();">
							<i class="icon-wallet mr-2"></i> Thông tin tài khoản
						</a>
					</li>
					<li class="dropdown-divider"></li>
					<li class="dropdown-item">
						<a href="javaScript:void();">
							<i class="icon-settings mr-2"></i> Cài đặt
						</a>
					</li>
					<li class="dropdown-divider"></li>
					<li class="dropdown-item">
						<a href="DangXuatQuanTriVienServlet">
							<i class="icon-power mr-2"></i> Đăng xuất
						</a>
					</li>
				</ul>
			</li>
		</ul>
	</nav>
</header>