package servelet;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.*;
import domain.*;
import tools.*;

/**
 * Servlet implementation class register
 */
@WebServlet("/register")
public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public register() {
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
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String sql="insert into usertable (username,password) values ('"+username+"','"+password+"')";
		String sqlcc = "select * from usertable where username='"+username+"'";
		UserDao userdao = new UserDao();
		boolean result = userdao.registersuccess(username, MD5Util.makeMD5(password));
		if(result) {
			          RequestDispatcher view=request.getRequestDispatcher("login.jsp");
		               view.forward(request, response);
				}
		else {
				
			request.setAttribute("registerfalse","yxx");
			RequestDispatcher view=request.getRequestDispatcher("/login.jsp");
			view.forward(request, response);
		}
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
