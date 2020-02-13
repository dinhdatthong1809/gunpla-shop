package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entities.DonHangChiTiet;
import helper.JdbcHelper;

public class DonHangChiTietDAO {
    public void insert(DonHangChiTiet model) {
	String sql = "insert into DonHangChiTiet (maDonHang, maSanPham, donGia, soLuong) values (?, ?, ?, ?)";
	JdbcHelper.executeUpdate(sql, model.getMaDonHang(), model.getMaSanPham(), model.getDonGia(), model.getSoLuong());
    }

    public void update(DonHangChiTiet model) {
	String sql = "update DonHangChiTiet set donGia=?, soLuong=? where maDonHang=? and maSanPham=?";
	JdbcHelper.executeUpdate(sql, model.getDonGia(), model.getSoLuong(), model.getMaDonHang(), model.getMaSanPham());
    }

    public void delete(String primaryKey1, String primaryKey2) {
	String sql = "delete from DonHangChiTiet where maDonHang=? and maSanPham=?";
	JdbcHelper.executeUpdate(sql, primaryKey1, primaryKey2);
    }

    public List<DonHangChiTiet> select() {
	String sql = "select * from DonHangChiTiet";
	return select(sql);
    }

    public List<DonHangChiTiet> selectByKeyword(String keyword1, String keyword2) {
	String sql = "select * from DonHangChiTiet where maDonHang like ? and maSanPham like ?";
	return select(sql, "%" + keyword1 + "%", "%" + keyword2 + "%");
    }

    public DonHangChiTiet findById(String primaryKey1, String primaryKey2) {
	String sql = "select * from DonHangChiTiet where maDonHang=? and maSanPham=?";
	List<DonHangChiTiet> list = select(sql, primaryKey1, primaryKey2);
	return list.size() > 0 ? list.get(0) : null;
    }

    private List<DonHangChiTiet> select(String sql, Object... args) {
	List<DonHangChiTiet> list = new ArrayList<>();
	try {
	    ResultSet rs = null;
	    try {
		rs = JdbcHelper.executeQuery(sql, args);
		while (rs.next()) {
		    DonHangChiTiet model = readFromResultSet(rs);
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

    private DonHangChiTiet readFromResultSet(ResultSet rs) throws SQLException {
	DonHangChiTiet model = new DonHangChiTiet();
	model.setMaDonHang(rs.getInt("maDonHang"));
	model.setMaSanPham(rs.getInt("maSanPham"));
	model.setDonGia(rs.getDouble("donGia"));
	model.setSoLuong(rs.getInt("soLuong"));
	return model;
    }
}
