package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entities.SanPham;
import helper.JdbcHelper;

public class SanPhamDAO {
    public void insert(SanPham model) {
	String sql = "insert into SanPham (tenSanPham, donGia, soLuong, maLoai, hinh, luotThich) values (?, ?, ?, ?, ?, ?)";
	JdbcHelper.executeUpdate(sql, model.getTenSanPham(), model.getDonGia(), model.getSoLuong(), model.getMaLoai(), model.getHinh(), model.getLuotThich());
    }

    public int insertReturnKey(SanPham model) {
	String sql = "insert into SanPham (tenSanPham, donGia, soLuong, maLoai, hinh, luotThich) values (?, ?, ?, ?, ?, ?)";
	return JdbcHelper.executeUpdateReturnKey(sql, model.getTenSanPham(), model.getDonGia(), model.getSoLuong(), model.getMaLoai(), model.getHinh(), model.getLuotThich());
    }

    public void update(SanPham model) {
	String sql = "update SanPham set tenSanPham=?, donGia=?, soLuong=?, maLoai=?, hinh=?, luotThich=? where maSanPham=?";
	JdbcHelper.executeUpdate(sql, model.getTenSanPham(), model.getDonGia(), model.getSoLuong(), model.getMaLoai(), model.getHinh(), model.getLuotThich(), model.getMaSanPham());
    }

    public void delete(String primaryKey) {
	String sql = "delete from SanPham where maSanPham=?";
	JdbcHelper.executeUpdate(sql, primaryKey);
    }

    public List<SanPham> selectBasedOnPage(String maLoai, String soTrang) {
	String sql = "{call sp_danhSachTaiTrang(" + maLoai + ", " + soTrang + ")}";
	return select(sql);
    }

    /**
     * Tìm tất cả dữ liệu trong bảng
     */
    public List<SanPham> select() {
	String sql = "select * from SanPham";
	return select(sql);
    }

    /**
     * Tìm các sản phẩm theo mã loại
     */
    public List<SanPham> selectFromCategory(String maLoai) {
	String sql = "select * from SanPham where maLoai=?";
	return select(sql, maLoai);
    }

    /**
     * Tìm các sản phẩm mới nhất dựa theo số lượng và mã loại truyền vào
     */
    public List<SanPham> selectNewFromCategory(int quantity, String maLoai) {
	String sql = "select top " + quantity + " * from SanPham where maLoai=? order by maSanPham desc";
	return select(sql, maLoai);
    }

    /**
     * Tìm các sản phẩm đầu tiên dựa theo số lượng và mã loại truyền vào
     */
    public List<SanPham> selectFirstFromCategory(int quantity, String maLoai) {
	String sql = "select top " + quantity + " * from SanPham where maLoai=? order by maSanPham asc";
	return select(sql, maLoai);
    }

    /**
     * Tìm những sản phẩm nổi bặt (nhiều lượt thích) dựa trên mã loại và lượt thích
     * truyền vào
     */
    public List<SanPham> selectHotFromCategory(String maLoai, int luotThich) {
	String sql = "select top 3 * from SanPham where maLoai=? and luotThich>" + luotThich + " order by luotThich desc";
	return select(sql, maLoai);
    }

    public List<SanPham> selectByKeyword(String keyword) {
	String sql = "select * from SanPham where tenSanPham like ?";
	return select(sql, "%" + keyword + "%");
    }

    public SanPham findById(String primaryKey) {
	String sql = "select * from SanPham where maSanPham=?";
	List<SanPham> list = select(sql, primaryKey);
	return list.size() > 0 ? list.get(0) : null;
    }

    private List<SanPham> select(String sql, Object... args) {
	List<SanPham> list = new ArrayList<>();
	try {
	    ResultSet rs = null;
	    try {
		rs = JdbcHelper.executeQuery(sql, args);
		while (rs.next()) {
		    SanPham model = readFromResultSet(rs);
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

    private SanPham readFromResultSet(ResultSet rs) throws SQLException {
	SanPham model = new SanPham();
	model.setMaSanPham(rs.getInt("maSanPham"));
	model.setTenSanPham(rs.getString("tenSanPham"));
	model.setDonGia(rs.getDouble("donGia"));
	model.setSoLuong(rs.getInt("soLuong"));
	model.setMaLoai(rs.getInt("maLoai"));
	model.setHinh(rs.getString("hinh"));
	model.setLuotThich(rs.getInt("luotThich"));

	return model;
    }
}
