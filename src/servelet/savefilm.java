package servelet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.Iterator;
import java.util.Date;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import dao.*;
import domain.*;

/**
 * Servlet implementation class savefilm
 */
@WebServlet("/SaveFilm")
public class savefilm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public savefilm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
        doPost(request,response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String round1 = null;
		String filmname = null;
		String writer = null;
		String link = null;
		String language = null;
		String score = null;
		System.out.println("123514461");
		String actor = null;
		String dector = null;
		String filmtype = null;
		String introduction = null;;
		String year = null;;
		String image = null;
		String country = null;
		request.setCharacterEncoding("utf-8"); 
		response.setContentType("text/html;charset=utf-8");  
		//ͼƬ���Ŀ¼
		String path = getServletContext().getRealPath("/film_images");
		System.out.println(path);
	    //��ʱ�ļ�Ŀ¼
	    String tmpPath = getServletContext().getRealPath("/tmp");
		boolean isMultipart =ServletFileUpload.isMultipartContent(request);
		DiskFileItemFactory factory = new DiskFileItemFactory(); 
		ServletFileUpload upload = new ServletFileUpload(factory);
	    upload.setSizeMax(4194304); 
	    
		List items = null;
		try {
			items = upload.parseRequest(request);
		} catch (FileUploadException e1) {
			e1.printStackTrace();
		} 
		
		factory.setRepository(new File(tmpPath)); 
		Iterator iter = items.iterator(); 
		while( iter.hasNext() ){ 
		FileItem item = (FileItem)iter.next(); 

	

		if( !item.isFormField() ){ 
			 String localfileName = item.getName();
			 if(localfileName!=null&&!("".equals(localfileName))){
			 int ii = localfileName.lastIndexOf(".");  
			 String sExt = localfileName.substring(ii,localfileName.length());//ȡ�ļ����ĺ�׺  
			 if(sExt.equals(".jpg")||sExt.equals(".png")||sExt.equals(".JPG")){
			 image = new Date().getTime() + sExt; 

			//item.getName ���ص����������ļ�����

		   File uploadedFile = new File(path+"/"+image);
			try {
				item.write(uploadedFile);
				} catch (Exception e) {
				e.printStackTrace();
				} 

			 }}}
		else{ 
				
			if("filmname".equals(item.getFieldName())){ 

				filmname = item.getString();} 
			
			if("actor".equals(item.getFieldName())){

				 actor = item.getString(); } 
			
			if("country".equals(item.getFieldName())){

				country = item.getString(); } 
			
			if("filmtype".equals(item.getFieldName())){

				filmtype = item.getString(); } 
			
			if("dector".equals(item.getFieldName())){

				dector = item.getString(); } 
			
			if("year".equals(item.getFieldName())){
				year = item.getString(); } 
			
			if("currpage".equals(item.getFieldName())){
				round1 = item.getString(); } 
			
			if("language".equals(item.getFieldName())){
				language = item.getString(); } 
			
			if("score".equals(item.getFieldName())){
				score = item.getString(); } 
			
			if("writer".equals(item.getFieldName())){
				writer = item.getString(); } 
			
			if("link".equals(item.getFieldName())){
				link = item.getString(); } 
			
			if("introduction".equals(item.getFieldName())){
				introduction = item.getString(); }
			}
	}
		Filmtable film=new Filmtable();
		film.setFilename(filmname);
		film.setActor(actor);
		film.setLanguage(language);
		film.setLink(link);
		film.setWriter(writer);
		film.setScore(score);
		film.setCountry(country);
		film.setDector(dector);
		film.setFilmtype(filmtype);
		film.setIntroduction(introduction);
		film.setYear(year);
		film.setImagename(image);
		System.out.println("save----");
		new FilmDao().InsertFilm(film);
		System.out.println(filmname);
		System.out.println(round1);
		RequestDispatcher view=request.getRequestDispatcher("/FilmList?round="+round1);
	    view.forward(request, response);
	}
}
	

