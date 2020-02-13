/**
 * hàm ready
 * */
$(document).ready(function() {
	/* nút xóa */
	$(document).on("click", ".btnXoa", function() {
		// lấy tên tài khoản khách hàng
		var maSanPham = $(this).attr("id");
		maSanPham = maSanPham.substring(maSanPham.lastIndexOf("_") + 1, maSanPham.length);
		
		// hiện thông báo chờ
		thongBaoCho();
		
		xoaSanPham(maSanPham);
	});
	
	/* nút xóa các mục được chọn */
	$("#btnXoaMucDaChon").click(function() {
		// hiện thông báo chờ
		thongBaoCho();
		
		xoaMucDaChon();
	});
	
	/* form cập nhật */
	$("#capNhatForm").submit(function(e) {
		// không cho submit như mặc định
		e.preventDefault();
		
		// kiểm tra dữ liệu hợp lệ
		if (checkValidData() == false) {
			return;
		}
		
		// hiện thông báo chờ
		thongBaoCho();
		
		capNhatSanPham();
	});
	
	/* form đăng ký */
	$("#themForm").submit(function(e){
		// không cho submit như mặc định
		e.preventDefault();
		
		// kiểm tra dữ liệu hợp lệ
		if (checkValidData() == false) {
			return;
		}
		
		// hiện thông báo chờ
		thongBaoCho();
		
		themSanPham();
	});
});

function thongBaoCho() {
	// hiện thông báo chờ
	Swal.fire({
		title: "Đang xử lý",
		text: "Vui lòng chờ kết quả",
		showConfirmButton: false,
		allowOutsideClick: false
	});
}

function thongBaoThatBai(data) {
	// hiện thông báo thất bại
	Swal.fire({
		title: "Thất bại",
		text: data.thongBao,
		type: 'error',
		showCancelButton: false,
		confirmButtonColor: '#22a7f0',
		confirmButtonText: 'OK'
	}).then((result) => {
		
	})
}

function thongBaoThanhCong(data) {
	// hiện thông báo thành công
	Swal.fire({
		title: "Thành công",
		text: data.thongBao,
		type: 'success',
		showCancelButton: false,
		confirmButtonColor: '#22a7f0',
		confirmButtonText: 'OK'
	}).then((result) => {
		window.location.reload();
	})
}

/**
 * Xóa
 * */
function xoaSanPham(maSanPham) {
	$.post("QuanLySanPhamServlet", {yeuCau: 'xoa', txtMaSanPham: maSanPham}, function(data) {
		if (data.thanhCong == true) {
			thongBaoThanhCong(data);
		}
		else {
			thongBaoThatBai(data);
		}
	}, "json");
}

/**
 * Xóa các mục được chọn
 * */
function xoaMucDaChon() {
	var arrayValue = [];
	 
	$('input[name=btnChon]').each(function() {
		if ($(this).prop('checked')) {
			arrayValue.push($(this).val())
		}
	});
	
	$.post("QuanLySanPhamServlet", {yeuCau: 'xoaMucDaChon', sanPhamDaChon: JSON.stringify(arrayValue)}, function(data) {
		if (data.thanhCong == true) {
			thongBaoThanhCong(data);
		}
		else {
			thongBaoThatBai(data);
		}
	}, "json");
}

/**
 * Cập nhật
 * */
function capNhatSanPham() {
	submitForm("capNhatForm");
}

/**
 * Thêm
 * */
function themSanPham() {
	submitForm("themForm");
}

function submitForm(form) {
	// gửi yêu cầu cho server
	$.ajax({
        url : $("#" + form).attr('action'),
        type : $("#" + form).attr('method'),
        data : new FormData(document.getElementById(form)),
        contentType : false,
        cache : false,
        processData : false,
        success : function(response) {
        	if (response.thanhCong == true) {
    			thongBaoThanhCong(response);
    		}
    		else {
    			thongBaoThatBai(response);
    		}
        }
    });
}

/**
 * Kiểm tra tất cả dữ liệu hợp lệ
 * */
function checkValidData() {
	// kiểm tra tên sản phẩm
	var tenSanPham = $("#txtTenSanPham").val().trim();
	if (checkValidProductName(tenSanPham) == false) {
		$("#txtTenSanPham").focus();
		return false;
	}
	
	// kiểm tra đơn giá
	var donGia = $("#txtDonGia").val().trim();
	if (checkValidPrice(donGia) == false) {
		$("#txtDonGia").focus();
		return false;
	}
	
	// kiểm tra số lượng
	var soLuong = $("#txtSoLuong").val().trim();
	if (checkValidQuantity(soLuong) == false) {
		$("#txtSoLuong").focus();
		return false;
	}
	
	// kiểm tra lượt thích
	var luotThich = $("#txtLuotThich").val().trim();
	if (checkValidLike(luotThich) == false) {
		$("#txtLuotThich").focus();
		return false;
	}
	
	return true;
}

/**
 * kiểm tra tên sản phẩm
 * */
function checkValidProductName(name) {
	// kiểm tra tên sản phẩm trống
	if (name == "") {
		thongBaoLoi("Bạn chưa nhập tên sản phẩm");
		return false;
	}
	
	// kiểm tra định dạng tên sản phẩm (từ 3 đến 100 kí tự)
	if (isValidProductName(name) == false) {
		thongBaoLoi("Tên sản phẩm phải từ 3 đến 100 kí tự");
		return false;
	}
	
	return true;
}

/**
 * kiểm tra đơn giá
 * */
function checkValidPrice(price) {
	// kiểm tra đơn giá trống
	if (price == "") {
		thongBaoLoi("Bạn chưa nhập đơn giá");
		return false;
	}
	
	// kiểm tra giá phải là số thực dương
	if (isValidPositiveFloat(price) == false) {
		thongBaoLoi("Giá phải là số thực dương");
		return false;
	}
	
	return true;
}

/**
 * kiểm tra số lượng
 * */
function checkValidQuantity(quantity) {
	// kiểm tra số lượng trống
	if (quantity == "") {
		thongBaoLoi("Bạn chưa nhập số lượng");
		return false;
	}
	
	// kiểm tra số lượng phải là số nguyên dương
	if (isValidPositiveInt(quantity) == false) {
		thongBaoLoi("Số lượng phải là số nguyên dương");
		return false;
	}
	
	return true;
}

/**
 * kiểm tra lượt thích
 * */
function checkValidLike(like) {
	// kiểm tra lượt thích trống
	if (like == "") {
		thongBaoLoi("Bạn chưa nhập lượt thích");
		return false;
	}
	
	// kiểm tra lượt thích phải là số nguyên dương
	if (isValidPositiveInt(like) == false) {
		thongBaoLoi("Lượt thích phải là số nguyên dương");
		return false;
	}
	
	return true;
}

function isValidProductName(str) {
	var format = /^[\w\W]{3,100}$/;
	return format.test(str);
}

function isValidPositiveFloat(str) {
	if ($.isNumeric(str) && parseFloat(str) >= 0) {
		return true;
	}
	
	return false;
}

function isValidPositiveInt(str) {
	if ($.isNumeric(str) && Number.isInteger(parseInt(str)) && parseInt(str) >= 0) {
		return true;
	}
	
	return false;
}

function thongBaoLoi(str) {
	// hiện thông báo
	toastr.options = {
		"closeButton": false,
		"debug": false,
		"newestOnTop": false,
		"progressBar": false,
		"positionClass": "toast-bottom-center",
		"preventDuplicates": false,
		"onclick": null,
		"showDuration": "300",
		"hideDuration": "1000",
		"timeOut": "4000",
		"extendedTimeOut": "1000",
		"showEasing": "swing",
		"hideEasing": "linear",
		"showMethod": "fadeIn",
		"hideMethod": "fadeOut"
	}

	toastr.error(str);
}
