$(document).ready(function() {
	// không cho submit như mặc định
	$("#dangNhapForm").submit(function(e){
	    e.preventDefault();
	});
});


/**
 * Hàm check lỗi và xử lý ajax việc đăng nhập tài khoản
 * */
function checkLogin() {
	var tenTaiKhoan = $("#txtUsername").val().trim();
	var matKhau = $("#txtPassword").val().trim();
	
	/* 1. kiểm tra dữ liệu trống */
	
	// kiểm tra tên trống
	if (tenTaiKhoan == "") {
		// hiện thông báo
		$("#thongBao").text("Bạn chưa nhập tên tài khoản");
		$("#txtUsername").focus();
		return;
	}
	
	// kiểm tra mật khẩu trống
	if (matKhau == "") {
		// hiện thông báo
		$("#thongBao").text("Bạn chưa nhập mật khẩu");
		$("#txtPassword").focus();
		return;
	}
	
	$.post("DangNhapKhachHangServlet", {tenTaiKhoan: tenTaiKhoan, matKhau: matKhau}, function(data) {
		// lấy dữ liệu từ file phản hồi
		if (data.thanhCong == false) {
			$("#thongBao").text(data.thongBao);
		}
		else {
			$("#thongBao").text("");
			$(location).attr('href', 'index.jsp');
		}
	}, "json");
}

function logout() {
	$.post("DangXuatKhachHangServlet", function(data) {
		$(location).attr('href', 'index.jsp');
	});
}