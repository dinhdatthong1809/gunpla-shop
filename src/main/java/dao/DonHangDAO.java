package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entities.DonHang;
import helper.JdbcHelper;

public class DonHangDAO {
    public int insert(DonHang model) {
	String sql = "insert into DonHang (ngayDatHang, tenTaiKhoanKhachHang) values (?, ?)";
	int maDonHang = JdbcHelper.executeUpdateReturnKey(sql, model.getNgayDatHang(), model.getTenTaiKhoanKhachHang());
	return maDonHang;
    }

    public void update(DonHang model) {
	String sql = "update DonHang set ngayDatHang=?, tenTaiKhoanKhachHang=? where maDonHang=?";
	JdbcHelper.executeUpdate(sql, model.getNgayDatHang(), model.getTenTaiKhoanKhachHang(), model.getMaDonHang());
    }

    public void delete(String primaryKey) {
	String sql = "delete from DonHang where maDonHang=?";
	JdbcHelper.executeUpdate(sql, primaryKey);
    }

    public List<DonHang> select() {
	String sql = "select * from DonHang";
	return select(sql);
    }

    public List<DonHang> selectNewest() {
	String sql = "select * from DonHang order by maDonHang desc";
	return select(sql);
    }

    public List<DonHang> selectByKeyword(String keyword) {
	String sql = "select * from DonHang where maDonHang like ?";
	return select(sql, "%" + keyword + "%");
    }

    public DonHang findById(String primaryKey) {
	String sql = "select * from DonHang where maDonHang=?";
	List<DonHang> list = select(sql, primaryKey);
	return list.size() > 0 ? list.get(0) : null;
    }

    private List<DonHang> select(String sql, Object... args) {
	List<DonHang> list = new ArrayList<>();
	try {
	    ResultSet rs = null;
	    try {
		rs = JdbcHelper.executeQuery(sql, args);
		while (rs.next()) {
		    DonHang model = readFromResultSet(rs);
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

    private DonHang readFromResultSet(ResultSet rs) throws SQLException {
	DonHang model = new DonHang();
	model.setMaDonHang(rs.getInt("maDonHang"));
	model.setNgayDatHang(rs.getDate("ngayDatHang"));
	model.setTenTaiKhoanKhachHang(rs.getString("tenTaiKhoanKhachHang"));
	return model;
    }
}
