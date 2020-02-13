package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entities.DonHangNgoaiChiTiet;
import helper.JdbcHelper;

public class DonHangNgoaiChiTietDAO {
    public void insert(DonHangNgoaiChiTiet model) {
	String sql = "insert into DonHangNgoaiChiTiet (maDonHangNgoai, maSanPham, donGia, soLuong) values (?, ?, ?, ?)";
	JdbcHelper.executeUpdate(sql, model.getMaDonHangNgoai(), model.getMaSanPham(), model.getDonGia(), model.getSoLuong());
    }

    public void update(DonHangNgoaiChiTiet model) {
	String sql = "update DonHangNgoaiChiTiet set donGia=?, soLuong=? where maDonHangNgoai=? and maSanPham=?";
	JdbcHelper.executeUpdate(sql, model.getDonGia(), model.getSoLuong(), model.getMaDonHangNgoai(), model.getMaSanPham());
    }

    public void delete(String primaryKey1, String primaryKey2) {
	String sql = "delete from DonHangNgoaiChiTiet where maDonHangNgoai=? and maSanPham=?";
	JdbcHelper.executeUpdate(sql, primaryKey1, primaryKey2);
    }

    public List<DonHangNgoaiChiTiet> select() {
	String sql = "select * from DonHangNgoaiChiTiet";
	return select(sql);
    }

    public List<DonHangNgoaiChiTiet> selectByKeyword(String keyword1, String keyword2) {
	String sql = "select * from DonHangNgoaiChiTiet where maDonHangNgoai like ? and maSanPham like ?";
	return select(sql, "%" + keyword1 + "%", "%" + keyword2 + "%");
    }

    public DonHangNgoaiChiTiet findById(String primaryKey1, String primaryKey2) {
	String sql = "select * from DonHangNgoaiChiTiet where maDonHangNgoai=? and maSanPham=?";
	List<DonHangNgoaiChiTiet> list = select(sql, primaryKey1, primaryKey2);
	return list.size() > 0 ? list.get(0) : null;
    }

    private List<DonHangNgoaiChiTiet> select(String sql, Object... args) {
	List<DonHangNgoaiChiTiet> list = new ArrayList<>();
	try {
	    ResultSet rs = null;
	    try {
		rs = JdbcHelper.executeQuery(sql, args);
		while (rs.next()) {
		    DonHangNgoaiChiTiet model = readFromResultSet(rs);
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

    private DonHangNgoaiChiTiet readFromResultSet(ResultSet rs) throws SQLException {
	DonHangNgoaiChiTiet model = new DonHangNgoaiChiTiet();
	model.setMaDonHangNgoai(rs.getInt("maDonHangNgoai"));
	model.setMaSanPham(rs.getInt("maSanPham"));
	model.setDonGia(rs.getDouble("donGia"));
	model.setSoLuong(rs.getInt("soLuong"));
	return model;
    }
}
