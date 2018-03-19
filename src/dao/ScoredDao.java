package dao;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import domain.*;
import tools.ConnDB;
public class ScoredDao {
	private ConnDB conn = null;
	public ScoredDao() {
		conn = new ConnDB();
	}
   public Scoretable getScoretableByuserIdandFilmid(String userid,String filmid) {
	   String sql="select * from scoretable where uid='"+userid+"' and fid='"+filmid+"'";
	   ResultSet rs = conn.executeQuery(sql);
	 
	   Scoretable score=new Scoretable();
	   try {
		if(rs.next()) {
			   score.setId(rs.getInt(1));
			   score.setUid(rs.getInt(2));
			   score.setFid(rs.getInt(3));
			   score.setScore(rs.getInt(4));
			   score.setTime(rs.getString(5));
		   }
		 
		   
		   else score=null;
		conn.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	   return score;
   }
 public void insertScoreByuserIdandFilmid(String userid,String filmid,String score) {
	    System.out.println("rilegou");
        Date date = new Date(System.currentTimeMillis());
        //设置要获取到什么样的时间
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //获取String类型的时间
        String createdate = sdf.format(date);
        System.out.println(createdate);
	   
	   String sql="insert into scoretable (uid,fid,score,time) values ('"+userid+"','"+filmid+"','"+score+"','"+createdate+"')";
	   conn.executeUpdate(sql);
	   conn.close();
	  
   }
}
