package servelet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import domain.*;
import dao.*;

/**
 * Servlet implementation class FilmList
 */
@WebServlet("/FilmList")
public class FilmList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FilmList() {
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
		int totalrecords = 0 ;
		String round=request.getParameter("round");
		
		System.out.println("SERVLET:"+round);
		FilmDao temp=new FilmDao();
		try {
			    totalrecords=temp.getTotalRecords();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		temp.getbaseflim(Integer.parseInt(round));
		ArrayList<Filmtable> film=temp.getBase();
	
		request.setAttribute("filmlist", film);
		request.setAttribute("round",round);
		int totalpages = 0;
		if(totalrecords/8==0){
		   totalpages = (totalrecords/8);
		}else{
			totalpages = (totalrecords/8)+1;
		}
		request.setAttribute("total",totalpages);
		System.out.println(totalpages);
        RequestDispatcher view=request.getRequestDispatcher("/FilmList.jsp");
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
