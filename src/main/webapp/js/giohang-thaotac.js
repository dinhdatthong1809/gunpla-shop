/**
 * hàm ready
 * */
$(document).ready(function() {
	/* nút mua sản phẩm */
	$(".product_cart").click(function() {
		// lấy mã sản phẩm
		var maSanPham = $(this).attr("id");
		maSanPham = parseInt(maSanPham.substring(maSanPham.lastIndexOf("_") + 1, maSanPham.length));
		
		themMucVaoGioHang(maSanPham);
	});
	
	/* nút xóa các mục được chọn trong giỏ hàng */
	$("#btnClearSelected").click(function() {
		xoaMucDaChon();
	});
	
	/* nút xóa tất cả mục trong giỏ hàng */
	$("#btnClearAll").click(function() {
		xoaTatCaMuc();
	});
	
//	/* nút cộng 1 đơn vị số lượng */
//	$(".qty_add").click(function() {
//		themMotDonViSoLuong(maSanPham);
//	});
//	
//	/* nút trừ 1 đơn vị số lượng */
//	$(".qty_sub").click(function() {
//		botMotDonViSoLuong(maSanPham);
//	});
});

/**
 * Thêm 1 mục vào giỏ hàng dựa vào mã sản phẩm
 * */
function themMucVaoGioHang(maSanPham) {
	$.post("GioHangServlet", {action: 'ThemMuc', maSanPham: maSanPham}, function(data) {
		// lấy dữ liệu từ file phản hồi
		var thanhCong = "error";
		if (data.thanhCong == true) {
			thanhCong = "success";
		}
		
		// cập nhật số lượng của icon giỏ hàng trên header
		if (data.obj == 0) {
			$(".cart a > div > div").attr("class", "").text("");
		}
		else {
			$(".cart a > div > div").attr("class", "soLuongSanPham").text(data.obj);
		}
		
		// hiện thông báo
		toastr.options = {
				  "closeButton": true,
				  "debug": false,
				  "newestOnTop": true,
				  "progressBar": false,
				  "positionClass": "toast-bottom-left",
				  "preventDuplicates": false,
				  "onclick": null,
				  "showDuration": "500",
				  "hideDuration": "500",
				  "timeOut": "2000",
				  "extendedTimeOut": "1000",
				  "showEasing": "swing",
				  "hideEasing": "linear",
				  "showMethod": "fadeIn",
				  "hideMethod": "fadeOut"
				}
		
		toastr.success(data.thongBao);
	}, "json");
}

/**
 * Xóa các mục được chọn trong giỏ hàng
 * */
function xoaMucDaChon() {
	 var arrayValue = [];
	 
	$('input[name=xoaKhoiGioHang]').each(function() {
		if ($(this).prop('checked')) {
			arrayValue.push($(this).val())
		}
	});
	
	$.post("GioHangServlet", {action: 'XoaMucDaChon', sanPhamDaChon: JSON.stringify(arrayValue)}, function(data) {
		location.reload();
	});
	
}

/**
 * Xóa tất cả mục đang có trong giỏ hàng
 */
function xoaTatCaMuc() {
	$.post("GioHangServlet", {action: 'XoaTatCaMuc'}, function(data) {
		location.reload();
	});
}

/**
 * Thêm 1 đơn vị số lượng cho mục trong giỏ hàng dựa vào mã sản phẩm
 * */
function themMotDonViSoLuong(maSanPham) {}

/**
 * Bớt 1 đơn vị số lượng cho mục trong giỏ hàng dựa vào mã sản phẩm
 * */
function botMotDonViSoLuong(maSanPham) {}

