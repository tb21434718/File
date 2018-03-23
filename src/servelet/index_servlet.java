package servelet;


import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import domain.*;
import dao.FilmDao;

/**
 * Servlet implementation class index_servlet
 */
@WebServlet("/index_servlet")
public class index_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
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
		
		
		
		String round=request.getParameter("round");
		HttpSession session =request.getSession();
		FilmDao filmdao = new FilmDao();
		
		int round_int= Integer.parseInt(round);
		ArrayList<Filmtable> film=filmdao.getbaseflim(round_int);
		
		if(request.getParameter("type")!=null){
			String type=request.getParameter("type");
			String liid = request.getParameter("liid");
			System.out.println(liid);
			System.out.println(type);
			ArrayList<Filmtable> typefilm=filmdao.getFilmByType(type, round);
			
			ArrayList<Filmtable> newfilm=filmdao.getFiveNewFilmByType(type);
			ArrayList<Filmtable> highfilm=filmdao.getFiveHotFilmByType(type);
			request.setAttribute("film",typefilm);	
			request.setAttribute("type",type);
			request.setAttribute("liid",liid);
			//类型电影
			request.setAttribute("fivenewfilm",newfilm);
			request.setAttribute("highfilm",highfilm);
			
		}else{
			request.setAttribute("film",film);
			
			ArrayList<Filmtable> newfilm=filmdao.getFiveNewFilm();
			ArrayList<Filmtable> highfilm=filmdao.getFivehifhscoreFilm();
			request.setAttribute("fivenewfilm",newfilm);
			request.setAttribute("highfilm",highfilm);
		}
		
		if(session.getAttribute("login")==null) {

			ArrayList<Filmtable> vistor_film=new FilmDao().get_vistor_films();
			request.setAttribute("vistor_film", vistor_film);	
		}else {
			request.setAttribute("vistor_film", film);
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
