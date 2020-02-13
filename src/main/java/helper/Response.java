package helper;

public class Response {
    private String thongBao;
    private String trang;
    private String tenLop;
    private boolean thanhCong = false;
    private Object obj;

    public Response(String thongBao) {
	super();
	this.thongBao = thongBao;
    }

    public Response(String thongBao, boolean thanhCong) {
	super();
	this.thongBao = thongBao;
	this.thanhCong = thanhCong;
    }

    public Response(String thongBao, String trang, boolean thanhCong) {
	super();
	this.thongBao = thongBao;
	this.trang = trang;
	this.thanhCong = thanhCong;
    }

    public Response(String thongBao, boolean thanhCong, Object obj) {
	super();
	this.thongBao = thongBao;
	this.thanhCong = thanhCong;
	this.obj = obj;
    }

    public Response(String thongBao, String trang, String tenLop, boolean thanhCong) {
	super();
	this.thongBao = thongBao;
	this.trang = trang;
	this.tenLop = tenLop;
	this.thanhCong = thanhCong;
    }

    public Response(String thongBao, String trang, String tenLop, Object obj) {
	super();
	this.thongBao = thongBao;
	this.trang = trang;
	this.tenLop = tenLop;
	this.obj = obj;
    }

    public Response(String thongBao, String trang, boolean thanhCong, Object obj) {
	super();
	this.thongBao = thongBao;
	this.trang = trang;
	this.thanhCong = thanhCong;
	this.obj = obj;
    }

    public Response(String thongBao, String trang, String tenLop, boolean thanhCong, Object obj) {
	super();
	this.thongBao = thongBao;
	this.trang = trang;
	this.tenLop = tenLop;
	this.thanhCong = thanhCong;
	this.obj = obj;
    }

    public Response() {

    }

    public String getThongBao() {
	return thongBao;
    }

    public void setThongBao(String thongBao) {
	this.thongBao = thongBao;
    }

    public String getTrang() {
	return trang;
    }

    public void setTrang(String trang) {
	this.trang = trang;
    }

    public String getTenLop() {
	return tenLop;
    }

    public void setTenLop(String tenLop) {
	this.tenLop = tenLop;
    }

    public boolean isThanhCong() {
	return thanhCong;
    }

    public void setThanhCong(boolean thanhCong) {
	this.thanhCong = thanhCong;
    }

    public Object getObj() {
	return obj;
    }

    public void setObj(Object obj) {
	this.obj = obj;
    }
}
