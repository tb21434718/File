package servelet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.*;
import domain.*;
/**
 * Servlet implementation class updatefilm
 */
@WebServlet("/updatefilm")
public class updatefilm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updatefilm() {
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
			String id = request.getParameter("id");
			Filmtable film = new FilmDao().getFilmByFilmId(id);
			System.out.println("updatefilm.java");
			request.setAttribute("film", film);
			String round=(String)request.getParameter("currpage");
			request.setAttribute("currpage", round);
			System.out.println("update"+round);
			RequestDispatcher view=request.getRequestDispatcher("updatefilm.jsp");
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
