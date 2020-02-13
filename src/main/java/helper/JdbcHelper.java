package helper;

import java.sql.*;

public class JdbcHelper {

    private static Connection con = null;
    private static String url = "jdbc:sqlserver://";
    private static String serverName = "localhost";
//	private static String serverName = "10.200.201.168";
    private static String portNumber = "1433";
    private static String databaseName = "PS08464_GundamShop";
    private static String userName = "admin_gundamshop";
    private static String password = "123";

    public static String getConnectionUrl() {
	return url + serverName + ": " + portNumber + "; databaseName=" + databaseName + ";";
    }

    public static Connection getConnection() {
	try {
	    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	    con = DriverManager.getConnection(getConnectionUrl(), userName, password);
	} catch (Exception e) {
	    con = null;
	    e.printStackTrace();
	}
	return con;
    }

    public static void closeConnection() {
	try {
	    if (con != null) {
		con.close();
	    }
	    con = null;
	} catch (Exception e) {
	    e.printStackTrace();
	}
    }

    /**
     * Xây dựng PreparedStatement
     * 
     * @param sql  là câu lệnh SQL chứa có thể chứa tham số. Nó có thể là một lời
     *             gọi thủ tục lưu
     * @param args là danh sách các giá trị được cung cấp cho các tham số trong câu
     *             lệnh sql
     * @return PreparedStatement tạo được
     * @throws java.sql.SQLException lỗi sai cú pháp
     */
    public static PreparedStatement prepareStatement(String sql, Object... args) throws SQLException {
	Connection connection = getConnection();
	PreparedStatement pstmt = null;
	if (sql.trim().startsWith("{")) {
	    pstmt = connection.prepareCall(sql);
	} else {
	    pstmt = connection.prepareStatement(sql);
	}
	for (int i = 0; i < args.length; i++) {
	    pstmt.setObject(i + 1, args[i]);
	}
	return pstmt;
    }

    /**
     * Xây dựng PreparedStatement
     * 
     * @param sql  là câu lệnh SQL chứa có thể chứa tham số. Nó có thể là một lời
     *             gọi thủ tục lưu
     * @param args là danh sách các giá trị được cung cấp cho các tham số trong câu
     *             lệnh sql
     * @return PreparedStatement tạo được
     * @throws java.sql.SQLException lỗi sai cú pháp
     */
    public static PreparedStatement prepareStatementReturnKey(String sql, Object... args) throws SQLException {
	Connection connection = getConnection();
	PreparedStatement pstmt = null;
	if (sql.trim().startsWith("{")) {
	    pstmt = connection.prepareCall(sql);
	} else {
	    pstmt = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
	}
	for (int i = 0; i < args.length; i++) {
	    pstmt.setObject(i + 1, args[i]);
	}
	return pstmt;
    }

    /**
     * Thực hiện câu lệnh SQL thao tác (INSERT, UPDATE, DELETE) hoặc thủ tục lưu hao
     * tác dữ liệu
     * 
     * @param sql  là câu lệnh SQL chứa có thể chứa tham số. Nó có thể là một lời
     *             gọi thủ tục lưu
     * @param args là danh sách các giá trị được cung cấp cho các tham số trong câu
     *             lệnh sql
     */
    public static void executeUpdate(String sql, Object... args) {
	try {
	    PreparedStatement stmt = prepareStatement(sql, args);
	    try {
		stmt.executeUpdate();
	    } finally {
		stmt.getConnection().close();
	    }
	} catch (SQLException e) {
	    throw new RuntimeException(e);
	}
    }

    /**
     * Thực hiện câu lệnh SQL thao tác (INSERT, UPDATE, DELETE) hoặc thủ tục lưu hao
     * tác dữ liệu
     * 
     * @param sql  là câu lệnh SQL chứa có thể chứa tham số. Nó có thể là một lời
     *             gọi thủ tục lưu
     * @param args là danh sách các giá trị được cung cấp cho các tham số trong câu
     *             lệnh sql
     */
    public static int executeUpdateReturnKey(String sql, Object... args) {
	try {
	    PreparedStatement stmt = prepareStatementReturnKey(sql, args);

	    try {
		stmt.executeUpdate();
		ResultSet rs = stmt.getGeneratedKeys();

		int idValue = 0;
		if (rs.next()) {
		    idValue = rs.getInt(1);
		}
		return idValue;
	    } finally {
		stmt.getConnection().close();
	    }
	} catch (SQLException e) {
	    throw new RuntimeException(e);
	}
    }

    /**
     * Thực hiện câu lệnh SQL truy vấn (SELECT) hoặc thủ tục lưu truy vấn dữ liệu
     * 
     * @param sql  là câu lệnh SQL chứa có thể chứa tham số. Nó có thể là một lời
     *             gọi thủ tục lưu
     * @param args là danh sách các giá trị được cung cấp cho các tham số trong câu
     *             lệnh sql
     */
    public static ResultSet executeQuery(String sql, Object... args) {
	try {
	    PreparedStatement stmt = prepareStatement(sql, args);
	    return stmt.executeQuery();
	} catch (SQLException e) {
	    throw new RuntimeException(e);
	}
    }

}
