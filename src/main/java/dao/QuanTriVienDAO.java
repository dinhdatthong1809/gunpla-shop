package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entities.QuanTriVien;
import helper.JdbcHelper;

public class QuanTriVienDAO {
    public void insert(QuanTriVien model) {
	String sql = "insert into QuanTriVien (tenTaiKhoan, matKhau, hoTen) values (?, ?, ?)";
	JdbcHelper.executeUpdate(sql, model.getTenTaiKhoan(), model.getMatKhau(), model.getHoTen());
    }

    public void update(QuanTriVien model) {
	String sql = "update QuanTriVien set matKhau=?, hoTen=? where tenTaiKhoan=?";
	JdbcHelper.executeUpdate(sql, model.getMatKhau(), model.getHoTen(), model.getTenTaiKhoan());
    }

    public void delete(String primaryKey) {
	String sql = "delete from QuanTriVien where tenTaiKhoan=?";
	JdbcHelper.executeUpdate(sql, primaryKey);
    }

    public List<QuanTriVien> select() {
	String sql = "select * from QuanTriVien";
	return select(sql);
    }

    public List<QuanTriVien> selectByKeyword(String keyword) {
	String sql = "select * from QuanTriVien where tenTaiKhoan like ?";
	return select(sql, "%" + keyword + "%");
    }

    public QuanTriVien findById(String primaryKey) {
	String sql = "select * from QuanTriVien where tenTaiKhoan=?";
	List<QuanTriVien> list = select(sql, primaryKey);
	return list.size() > 0 ? list.get(0) : null;
    }

    private List<QuanTriVien> select(String sql, Object... args) {
	List<QuanTriVien> list = new ArrayList<>();
	try {
	    ResultSet rs = null;
	    try {
		rs = JdbcHelper.executeQuery(sql, args);
		while (rs.next()) {
		    QuanTriVien model = readFromResultSet(rs);
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

    private QuanTriVien readFromResultSet(ResultSet rs) throws SQLException {
	QuanTriVien model = new QuanTriVien();
	model.setTenTaiKhoan(rs.getString("tenTaiKhoan"));
	model.setMatKhau(rs.getString("matKhau"));
	model.setHoTen(rs.getString("hoTen"));
	return model;
    }
}
