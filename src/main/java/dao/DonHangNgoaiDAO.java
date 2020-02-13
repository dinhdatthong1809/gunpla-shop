package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entities.DonHangNgoai;
import helper.JdbcHelper;

public class DonHangNgoaiDAO {
    public int insert(DonHangNgoai model) {
	String sql = "insert into DonHangNgoai (tenKhachHangNgoai, gioiTinh, diaChi, email, dienThoai, ngayDatHang) values (?, ?, ?, ?, ?, ?)";
	int maDonHangNgoai = JdbcHelper.executeUpdateReturnKey(sql, model.getTenKhachHangNgoai(), model.isGioiTinh(), model.getDiaChi(), model.getEmail(), model.getDienThoai(), model.getNgayDatHang());
	return maDonHangNgoai;
    }

    public void update(DonHangNgoai model) {
	String sql = "update DonHangNgoai set tenKhachHangNgoai=?, gioiTinh=?, diaChi=?, email=?, dienThoai=?, ngayDatHang=? where maDonHangNgoai=?";
	JdbcHelper.executeUpdate(sql, model.getTenKhachHangNgoai(), model.isGioiTinh(), model.getDiaChi(), model.getEmail(), model.getDienThoai(), model.getNgayDatHang(), model.getMaDonHangNgoai());
    }

    public void delete(String primaryKey) {
	String sql = "delete from DonHangNgoai where maDonHangNgoai=?";
	JdbcHelper.executeUpdate(sql, primaryKey);
    }

    public List<DonHangNgoai> select() {
	String sql = "select * from DonHangNgoai";
	return select(sql);
    }

    public List<DonHangNgoai> selectNewest() {
	String sql = "select * from DonHangNgoai order by maDonHangNgoai desc";
	return select(sql);
    }

    public List<DonHangNgoai> selectByKeyword(String keyword) {
	String sql = "select * from DonHangNgoai where maDonHangNgoai like ?";
	return select(sql, "%" + keyword + "%");
    }

    public DonHangNgoai findById(String primaryKey) {
	String sql = "select * from DonHangNgoai where maDonHangNgoai=?";
	List<DonHangNgoai> list = select(sql, primaryKey);
	return list.size() > 0 ? list.get(0) : null;
    }

    private List<DonHangNgoai> select(String sql, Object... args) {
	List<DonHangNgoai> list = new ArrayList<>();
	try {
	    ResultSet rs = null;
	    try {
		rs = JdbcHelper.executeQuery(sql, args);
		while (rs.next()) {
		    DonHangNgoai model = readFromResultSet(rs);
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

    private DonHangNgoai readFromResultSet(ResultSet rs) throws SQLException {
	DonHangNgoai model = new DonHangNgoai();
	model.setMaDonHangNgoai(rs.getInt("maDonHangNgoai"));
	model.setTenKhachHangNgoai(rs.getString("tenKhachHangNgoai"));
	model.setGioiTinh(rs.getBoolean("gioiTinh"));
	model.setDiaChi(rs.getString("diaChi"));
	model.setEmail(rs.getString("email"));
	model.setDienThoai(rs.getString("dienThoai"));
	model.setNgayDatHang(rs.getDate("ngayDatHang"));
	return model;
    }
}
