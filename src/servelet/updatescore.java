package servelet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import KafkaUtil.KafkaProducerAction;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import dao.*;
import domain.*;
/**
 * Servlet implementation class updatescore
 */
@WebServlet("/updatescore")
public class updatescore extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String recommendmessage[]=new String[4];
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updatescore() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8"); 
		response.setContentType("text/html;charset=utf-8");  
		HttpSession session=request.getSession();
		String score = request.getParameter("score");
		String filmid=request.getParameter("filmid");
		String username = (String) session.getAttribute("username");
		Usertable user2 = new UserDao().getUserByUsername(username);
		int userid = user2.getId();
		String userid1=Integer.toString(userid);
		
		double a = 0 ;
		int b = 0;
		FilmDao filmdao = new FilmDao();
		Filmtable filmtable = filmdao.getFilmByFilmId(filmid);
		if(filmtable.getScore()!=null){
		 a = Double.parseDouble(filmtable.getScore());
		}
		a=a*filmtable.getScorecount();
		if(score!=null){
        b = Integer.parseInt(score);
		}
		int c = filmtable.getScorecount()+1;
		double result = (a+b)/c;
		filmtable.setScorecount(filmtable.getScorecount()+1);
	    DecimalFormat df = new DecimalFormat("0.0");
	    filmtable.setScore(df.format(result));
	    
	    boolean updateresult = filmdao.UpdateFilm(filmtable);
	    boolean insertresult = filmdao.insertCheck(userid1,filmid);
		
		
		
		
	//	int userid=new UserDao().getUserByUsername((String)session.getAttribute("username")).getId();
	    if(updateresult&&!insertresult){
		new ScoredDao().insertScoreByuserIdandFilmid(userid1, filmid, score);
		
		//use recommend engine
		recommendmessage[0]=(String) session.getAttribute("uid");
		recommendmessage[1]=filmid;  
		recommendmessage[2]=score;
		recommendmessage[3]="2018";     
		KafkaProducerAction.send(recommendmessage);
		
		request.setAttribute("hasscored","yes");
	    }
		int point=Integer.parseInt(score);
		String points=point*6+"px";
		request.setAttribute("points",points);
		request.setAttribute("id",filmid);
		RequestDispatcher view=request.getRequestDispatcher("/single?id="+filmid);
	    view.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
