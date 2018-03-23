package servelet;

import java.io.IOException;
import java.io.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.*;
import domain.*;

/**
 * Servlet implementation class deletefilm
 */
@WebServlet("/deletefilm")
public class deletefilm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deletefilm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String path = getServletContext().getRealPath("/film_images");
		String round1 = request.getParameter("currpage");
		System.out.println(round1);
		String id = request.getParameter("id");
		Filmtable film = new FilmDao().getFilmByFilmId(id);
		String imagename = film.getImagename();
		if(imagename!=null){
			File imageposition = new File(path+"/"+imagename);
			 if (imageposition.exists()) {
			imageposition.delete();
		}
		}
		 
		System.out.println("É¾³ý±êÇ©");
		new FilmDao().DeleteFilm(film);
		
		RequestDispatcher view=request.getRequestDispatcher("/FilmList?round="+round1); 
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
