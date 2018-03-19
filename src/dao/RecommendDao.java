package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import domain.Filmtable;
import tools.ConnDB;

public class RecommendDao {
	private ConnDB conn = null;
	public RecommendDao(){
		conn = new ConnDB();
	}
	public List<String> getRecommendMovie(String username) {
		String sql="select * from tenscore where userid="+username;
		System.out.println(sql);
		ResultSet rs = conn.executeQuery(sql);
		List<String> recommendmovielist=new ArrayList<String>();
		try {
			rs.last();
			if(rs.getRow()!=1)
			{
				return recommendmovielist;
			
			}
			rs.beforeFirst();
			while(rs.next()){
				if(rs.getString(2).equals("-1")){
					return recommendmovielist;
				}
                //数据格式是  movieid:recommendlevel,movieid:recommendlevel......
			String movielist=rs.getString(2);
			String moviearray[]=movielist.split(",");
			
			List<String> movieid=new ArrayList<String>();
			for(int i=0;i<moviearray.length;i++){
				String movieidtmp[]=moviearray[i].split(":");
				recommendmovielist.add(movieidtmp[0]);
			}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw new RuntimeException();
		}
		
		return recommendmovielist;
		
	}
public static void main(String[] args) {
	RecommendDao d=new RecommendDao();
	List<String>t=d.getRecommendMovie("26");
	if(t.isEmpty()||t.size()==0)
		System.out.println(111);
	for (String s :t)
		System.out.println(s);
	
}
}
