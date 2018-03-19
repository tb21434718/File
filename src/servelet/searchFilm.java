package servelet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FilmDao;
import domain.Filmtable;

/**
 * Servlet implementation class searchFilm
 */
@WebServlet("/searchFilm")
public class searchFilm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public searchFilm() {
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
		String filmname=request.getParameter("filmname");
		String round=request.getParameter("round");
		if(round==null) round=1+"";
		int num=1;
		try {
			num=new FilmDao().getTotalRecordsByfilmname(filmname);
			if(num>0){
				num = num/8==0?(num/8):((num/8) + 1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ArrayList<Filmtable> filmlist = new ArrayList<Filmtable>(100);
		filmlist=new FilmDao().getFindFilmByfilmname(filmname, Integer.parseInt(round));
		request.setAttribute("filmname",filmname);
		request.setAttribute("filmlist", filmlist);
		request.setAttribute("filmnum", num);
		request.setAttribute("round", round);
		//放入搜索电影名称 
//		Iterator<Filmtable> iterator = filmlist.iterator();
//		  Filmtable film = new Filmtable();
//		  while (iterator.hasNext()){
//		   film = (Filmtable)iterator.next();
//		   System.out.println(film.getFilename());
//		  }
		
		RequestDispatcher view=request.getRequestDispatcher("/searchfilm2.jsp");
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
