package servelet;


import java.io.IOException;
import java.util.ArrayList;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import domain.*;
import dao.FilmDao;
import dao.RecommendDao;

/**
 * Servlet implementation class index_servlet
 */
@WebServlet("/index_servlet")
public class index_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	RecommendDao recommend=new RecommendDao();//判断是否有推荐列表
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public index_servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session =request.getSession();
		FilmDao temp=new FilmDao();
		String round=request.getParameter("round");
		String userid=(String)session.getAttribute("uid");
		ArrayList<Filmtable> newfilm=new FilmDao().getFiveNewFilm();
		ArrayList<Filmtable> highfilm=new FilmDao().getFivehifhscoreFilm();
		request.setAttribute("fivenewfilm",newfilm);
		request.setAttribute("highfilm",highfilm);
		int round_int= Integer.parseInt(round);
		ArrayList<Filmtable> film=new FilmDao().getbaseflim(round_int);
		
		if(request.getParameter("type")!=null){
			String type=request.getParameter("type");
			System.out.println(type);
			ArrayList<Filmtable> typefilm=new FilmDao().getFilmByType(type, round);
			request.setAttribute("film",typefilm);	
			request.setAttribute("type",type);
		}else{
			request.setAttribute("film",film);
		}
		
		//推荐
		temp.get_vistor_films();
		ArrayList<Filmtable> vistor_film=temp.getVistor_film();
		if(session.getAttribute("login")==null) {

			System.out.println("登录前"+vistor_film.size());
			request.setAttribute("vistor_film", vistor_film);	
		}else {//登录后
			System.out.println("登录后");
		//	request.setAttribute("vistor_film", film);
			//用户登录后 after user login
			List<String> recommendtmp=recommend.getRecommendMovie(userid);
			if(recommendtmp.isEmpty()||recommendtmp.size()==0)
			{System.out.println("推荐结果为空");
				request.setAttribute("vistor_film", vistor_film);	
			}
			else{
				//加判断条件
				request.setAttribute("vistor_film", new FilmDao().getRecommend(recommendtmp));
				
			}  
		}
		
		request.setAttribute("round1",round);
		
		
		 RequestDispatcher view=request.getRequestDispatcher("film.jsp");
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
