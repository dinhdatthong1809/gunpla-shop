package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entities.KhachHang;
import helper.JdbcHelper;

public class KhachHangDAO {
    public void insert(KhachHang model) {
	String sql = "insert into KhachHang (tenTaiKhoan, matKhau, hoTen, gioiTinh, diaChi, ngaySinh, email, dienThoai, hinh) values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
	JdbcHelper.executeUpdate(sql, model.getTenTaiKhoan(), model.getMatKhau(), model.getHoTen(), model.isGioiTinh(), model.getDiaChi(), model.getNgaySinh(), model.getEmail(), model.getDienThoai(), model.getHinh());
    }

    public int countInvoice(String primaryKey) {
	int soLuongDonHang = 0;
	try {
	    ResultSet rs = null;
	    try {
		String sql = "{call sp_demDonHang(?)}";
		rs = JdbcHelper.executeQuery(sql, primaryKey);
		while (rs.next()) {
		    soLuongDonHang = rs.getInt(1);
		}
	    } finally {
		rs.getStatement().getConnection().close();
	    }
	} catch (SQLException ex) {
	    throw new RuntimeException(ex);
	}
	return soLuongDonHang;
    }

    public void update(KhachHang model) {
	String sql = "update KhachHang set matKhau=?, hoTen=?, gioiTinh=?, diaChi=?, ngaySinh=?, email=?, dienThoai=?, hinh=? where tenTaiKhoan=?";
	JdbcHelper.executeUpdate(sql, model.getMatKhau(), model.getHoTen(), model.isGioiTinh(), model.getDiaChi(), model.getNgaySinh(), model.getEmail(), model.getDienThoai(), model.getHinh(), model.getTenTaiKhoan());
    }

    public void delete(String primaryKey) {
	String sql = "delete from KhachHang where tenTaiKhoan=?";
	JdbcHelper.executeUpdate(sql, primaryKey);
    }

    public List<KhachHang> select() {
	String sql = "select * from KhachHang";
	return select(sql);
    }

    public List<KhachHang> selectByKeyword(String keyword) {
	String sql = "select * from KhachHang where tenTaiKhoan like ?";
	return select(sql, "%" + keyword + "%");
    }

    public KhachHang findById(String primaryKey) {
	String sql = "select * from KhachHang where tenTaiKhoan=?";
	List<KhachHang> list = select(sql, primaryKey);
	return list.size() > 0 ? list.get(0) : null;
    }

    private List<KhachHang> select(String sql, Object... args) {
	List<KhachHang> list = new ArrayList<>();
	try {
	    ResultSet rs = null;
	    try {
		rs = JdbcHelper.executeQuery(sql, args);
		while (rs.next()) {
		    KhachHang model = readFromResultSet(rs);
		    list.add(model);
		}
	    } finally {
		rs.getStatement().getConnection().close();
	    }
	} catch (SQLException ex) {
	    throw new RuntimeException(ex);
	}
	return list;
    }

    private KhachHang readFromResultSet(ResultSet rs) throws SQLException {
	KhachHang model = new KhachHang();
	model.setTenTaiKhoan(rs.getString("tenTaiKhoan"));
	model.setMatKhau(rs.getString("matKhau"));
	model.setHoTen(rs.getString("hoTen"));
	model.setGioiTinh(rs.getBoolean("gioiTinh"));
	model.setDiaChi(rs.getString("diaChi"));
	model.setNgaySinh(rs.getDate("ngaySinh"));
	model.setEmail(rs.getString("email"));
	model.setDienThoai(rs.getString("dienThoai"));
	model.setHinh(rs.getString("hinh"));
	return model;
    }
}
