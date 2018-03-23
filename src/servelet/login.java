package servelet;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tools.*;
import dao.*;
import domain.*;

import java.sql.*;


/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
      // UserTable user=new UserTable();
    /**
     * @see HttpServlet#HttpServlet()
     */
	private ConnDB conn = null;

    public login() {
        super();
        // TODO Auto-generated constructor stub
        conn = new ConnDB();
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
		UserDao userdao = new UserDao();
		boolean res=userdao.logincheck(username, MD5Util.makeMD5(password));
		if(res) {
			
			HttpSession session=request.getSession();
        	session.setAttribute("login", "yes");
        	session.setAttribute("username", username);
        	request.setAttribute("round",1);
            //RequestDispatcher view=request.getRequestDispatcher("/index_servlet?round=1");
  			response.sendRedirect("http://localhost:8080/File/index_servlet?round=1");
		}
			else {
            	    PrintWriter writer=response.getWriter();
            	    writer.write("<script>alert('error please try again');window.history.back(-1); </script>");
            	    System.out.println("zlhwez");
            	//writer.write("<script>window.close();</script>");
            	    writer.close();
            	    writer.flush();
	                }
			} 
	
		
		
		
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	       doGet(request,response);
	}

}
