package tools;

import java.io.InputStream; //瀵煎叆java.io.InputStream绫�
import java.sql.*; //瀵煎叆java.sql鍖呬腑鐨勬墍鏈夌被
import java.util.Properties; //瀵煎叆java.util.Properties绫�

public class ConnDB {
	public Connection conn = null; // 澹版槑Connection瀵硅薄鐨勫疄渚�
	public Statement stmt = null; // 澹版槑Statement瀵硅薄鐨勫疄渚�
	public ResultSet rs = null; // 澹版槑ResultSet瀵硅薄鐨勫疄渚�
	private static String propFileName = "connDB.properties"; // 鎸囧畾璧勬簮鏂囦欢淇濆瓨鐨勪綅缃�
	private static Properties prop = new Properties(); // 鍒涘缓骞跺疄渚嬪寲Properties瀵硅薄鐨勫疄渚�
	private static String dbClassName = "com.mysql.jdbc.Driver"; // 瀹氫箟淇濆瓨鏁版嵁搴撻┍鍔ㄧ殑鍙橀噺
	private static String dbUrl = "jdbc:mysql://localhost:3306/yxx_film?useUnicode=true&characterEncoding=UTF-8&useSSL=true&user=root&password=root";

	public ConnDB() { // 鏋勯�犳柟娉�
		try { // 鎹曟崏寮傚父
			// 灏哖roperties鏂囦欢璇诲彇鍒癐nputStream瀵硅薄涓�
			InputStream in = getClass().getResourceAsStream(propFileName);
			prop.load(in); // 閫氳繃杈撳叆娴佸璞″姞杞絇roperties鏂囦欢
			dbClassName = prop.getProperty("DB_CLASS_NAME"); // 鑾峰彇鏁版嵁搴撻┍鍔�
			// 鑾峰彇杩炴帴鐨刄RL
			dbUrl = prop.getProperty("DB_URL", dbUrl);
		} catch (Exception e) {
			e.printStackTrace(); // 杈撳嚭寮傚父淇℃伅
		}
	}

	/**
	 * 鍔熻兘锛氳幏鍙栬繛鎺ョ殑璇彞
	 * 
	 * @return
	 */
	public static Connection getConnection() {
		Connection conn = null;
		try { // 杩炴帴鏁版嵁搴撴椂鍙兘鍙戠敓寮傚父鍥犳闇�瑕佹崟鎹夎寮傚父
			Class.forName(dbClassName).newInstance(); // 瑁呰浇鏁版嵁搴撻┍鍔�
			conn = DriverManager.getConnection(dbUrl); // 寤虹珛涓庢暟鎹簱URL涓畾涔夌殑鏁版嵁搴撶殑杩炴帴
		} catch (Exception ee) {
			ee.printStackTrace(); // 杈撳嚭寮傚父淇℃伅
		}
		if (conn == null) {
			System.err
					.println("璀﹀憡: DbConnectionManager.getConnection() 鑾峰緱鏁版嵁搴撻摼鎺ュけ璐�.\r\n\r\n閾炬帴绫诲瀷:"
							+ dbClassName + "\r\n閾炬帴浣嶇疆:" + dbUrl); // 鍦ㄦ帶鍒跺彴涓婅緭鍑烘彁绀轰俊鎭�
		}
		return conn; // 杩斿洖鏁版嵁搴撹繛鎺ュ璞�
	}

	/*
	 * 鍔熻兘锛氭墽琛屾煡璇㈣鍙�
	 */
	public ResultSet executeQuery(String sql) {
		try { // 鎹曟崏寮傚父
			conn = getConnection(); // 璋冪敤getConnection()鏂规硶鏋勯�燙onnection瀵硅薄鐨勪竴涓疄渚媍onn
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
					ResultSet.CONCUR_READ_ONLY);
			rs = stmt.executeQuery(sql);
		} catch (SQLException ex) {
			System.err.println(ex.getMessage()); // 杈撳嚭寮傚父淇℃伅
		}
		return rs; // 杩斿洖缁撴灉闆嗗璞�
	}

	/*
	 * 鍔熻兘:鎵ц鏇存柊鎿嶄綔
	 */
	public int executeUpdate(String sql) {
		int result = 0; // 瀹氫箟淇濆瓨杩斿洖鍊肩殑鍙橀噺
		try { // 鎹曟崏寮傚父
			conn = getConnection(); // 璋冪敤getConnection()鏂规硶鏋勯�燙onnection瀵硅薄鐨勪竴涓疄渚媍onn
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
					ResultSet.CONCUR_READ_ONLY);
			result = stmt.executeUpdate(sql); // 鎵ц鏇存柊鎿嶄綔
		} catch (SQLException ex) {
			result = 0; // 灏嗕繚瀛樿繑鍥炲�肩殑鍙橀噺璧嬪�间负0
			ex.printStackTrace();
		}
		return result; // 杩斿洖淇濆瓨杩斿洖鍊肩殑鍙橀噺
	}

	/*
	 * 鍔熻兘:鍏抽棴鏁版嵁搴撶殑杩炴帴
	 */
	public void close() {
		try { // 鎹曟崏寮傚父
			if (rs != null) { // 褰揜esultSet瀵硅薄鐨勫疄渚媟s涓嶄负绌烘椂
				rs.close(); // 鍏抽棴ResultSet瀵硅薄
			}
			if (stmt != null) { // 褰揝tatement瀵硅薄鐨勫疄渚媠tmt涓嶄负绌烘椂
				stmt.close(); // 鍏抽棴Statement瀵硅薄
			}
			if (conn != null) { // 褰揅onnection瀵硅薄鐨勫疄渚媍onn涓嶄负绌烘椂
				conn.close(); // 鍏抽棴Connection瀵硅薄
			}
		} catch (Exception e) {
			e.printStackTrace(System.err); // 杈撳嚭寮傚父淇℃伅
		}
	}
}

