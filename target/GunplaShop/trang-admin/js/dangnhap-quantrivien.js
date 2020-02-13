$(document).ready(function() {
	// tự nhảy vào ô tên tài khoản
	$("#txtTenTaiKhoan").focus();
	
	// không cho submit như mặc định
	$("#dangNhapForm").submit(function(e){
	    e.preventDefault();
	});
});


/**
 * Hàm check lỗi và xử lý ajax việc đăng nhập tài khoản
 * */
function checkLogin() {
	var tenTaiKhoan = $("#txtTenTaiKhoan").val().trim();
	var matKhau = $("#txtMatKhau").val().trim();
	
	/* 1. kiểm tra dữ liệu trống */
	
	// kiểm tra tên trống
	if (tenTaiKhoan == "") {
		// hiện thông báo
		$("#thongBao").text("Bạn chưa nhập tên tài khoản");
		$("#txtTenTaiKhoan").focus();
		return;
	}
	
	// kiểm tra mật khẩu trống
	if (matKhau == "") {
		// hiện thông báo
		$("#thongBao").text("Bạn chưa nhập mật khẩu");
		$("#txtMatKhau").focus();
		return;
	}
	
	$.post("DangNhapQuanTriVienServlet", {tenTaiKhoan: tenTaiKhoan, matKhau: matKhau}, function(data) {
		// lấy dữ liệu từ file phản hồi
		if (data.thanhCong == false) {
			$("#thongBao").text(data.thongBao);
		}
		else {
			$("#thongBao").text("");
			$(location).attr('href', 'index.jsp?route=main');
		}
	}, "json");
}

function logout() {
	$.post("DangXuatQuanTriVienServlet", function(data) {
		$(location).attr('href', 'dangnhap.jsp');
	});
}