package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entities.LoaiSanPham;
import helper.JdbcHelper;

public class LoaiSanPhamDAO {
    public void insert(LoaiSanPham model) {
	String sql = "insert into LoaiSanPham (maLoai, tenLoai) values (?, ?)";
	JdbcHelper.executeUpdate(sql, model.getMaLoai(), model.getTenLoai());
    }

    public void update(LoaiSanPham model) {
	String sql = "update LoaiSanPham set tenLoai=? where maLoai=?";
	JdbcHelper.executeUpdate(sql, model.getTenLoai(), model.getMaLoai());
    }

    public void delete(String primaryKey) {
	String sql = "delete from LoaiSanPham where maLoai=?";
	JdbcHelper.executeUpdate(sql, primaryKey);
    }

    public List<LoaiSanPham> select() {
	String sql = "select * from LoaiSanPham";
	return select(sql);
    }

    public List<LoaiSanPham> selectByKeyword(String keyword) {
	String sql = "select * from LoaiSanPham where tenLoai like ?";
	return select(sql, "%" + keyword + "%");
    }

    public LoaiSanPham findById(String primaryKey) {
	String sql = "select * from LoaiSanPham where maLoai=?";
	List<LoaiSanPham> list = select(sql, primaryKey);
	return list.size() > 0 ? list.get(0) : null;
    }

    private List<LoaiSanPham> select(String sql, Object... args) {
	List<LoaiSanPham> list = new ArrayList<>();
	try {
	    ResultSet rs = null;
	    try {
		rs = JdbcHelper.executeQuery(sql, args);
		while (rs.next()) {
		    LoaiSanPham model = readFromResultSet(rs);
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

    private LoaiSanPham readFromResultSet(ResultSet rs) throws SQLException {
	LoaiSanPham model = new LoaiSanPham();
	model.setMaLoai(rs.getInt("maLoai"));
	model.setTenLoai(rs.getString("tenLoai"));
	return model;
    }
}
