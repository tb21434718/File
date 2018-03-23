package dao;

import domain.Usertable;
import tools.ConnDB;
import java.sql.ResultSet;
import java.sql.SQLException;
import domain.Usertable;


public class UserDao {
	private ConnDB conn = null;

	public UserDao() {
		conn = new ConnDB();
	}

	   public Usertable getUserByUsername(String username) {
		   String sql = "select * from usertable where username='"+username+"'";
		   ResultSet rst = conn.executeQuery(sql);
		   Usertable user = new Usertable();
		   try {
		   if(rst.next()) {
			   user.setId(rst.getInt(1)); //find id
			   user.setUsername(rst.getString(2));
			   user.setPassword(rst.getString(3));
	
		       }
	        } catch (SQLException e) {
				e.printStackTrace();// ����쳣��Ϣ
			} finally {
				conn.close(); // �ر����ݿ�����
			}
			return user;
	   }
       @SuppressWarnings("finally")
	public boolean logincheck(String username, String password) {
    	   String sql = "select * from usertable where username='"+username+"'"+" and "+"password='"+password+"'";
		   ResultSet rst = conn.executeQuery(sql);
		   boolean result = false;
		   try {
		   if(rst.next()) {
                if(username.equals(rst.getString(2)) && password.equals(rst.getString(3))) {
                	result = true;
                }
		       }
	        } catch (SQLException e) {
				e.printStackTrace();
			} finally {
				conn.close(); 
				return result;
			}
    	   
       }
	   public Usertable getUserByUserId(int id) {
		   String sql = "select * from usertable where id='"+id+"'";
		   ResultSet rst = conn.executeQuery(sql);
		   Usertable user = new Usertable();
		   try {
		   if(rst.next()) {
			   user.setId(rst.getInt(1)); //find id
			   user.setUsername(rst.getString(2));
			   user.setPassword(rst.getString(3));
		       }
	        } catch (SQLException e) {
				e.printStackTrace();// ����쳣��Ϣ
			} finally {
				conn.close(); // �ر����ݿ�����
			}
			return user;
	   }
	   @SuppressWarnings("finally")
	public boolean registersuccess(String username , String password) {
		   boolean result = false;
		   
			String sqlcc = "select * from usertable where username='"+username+"'";
			 ResultSet rst = conn.executeQuery(sqlcc);
			try {
				   if(rst.next()) {
		                	result = false;
		                }
				   else { 
					   result = true;
				   InsertUser(username,password);
				   }
			        } catch (SQLException e) {
						e.printStackTrace();
					} finally {
						conn.close(); 
						return result;
					}
		   
	   }
	   public int InsertUser(String username , String password) {
		   String sql="insert into usertable (username,password) values ('"+username+"','"+password+"')";
		   int result = conn.executeUpdate(sql);
		   conn.close(); // �ر����ݿ�����
		   return result;

	   }
}
