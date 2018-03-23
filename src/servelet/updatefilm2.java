package servelet;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import dao.FilmDao;
import domain.Filmtable;

/**
 * Servlet implementation class updatefilm2
 */
@WebServlet("/updatefilm2")
public class updatefilm2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updatefilm2() {
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
		String filmid = null;
		String filmname = null;
		String link = null;
		System.out.println("updatefilm2");
		String actor = null;
		String dector = null;
		String writer = null;
		String filmtype = null;
		String introduction = null;;
		String year = null;
		String language = null;
		String score = null;
		String image = null;
		String country = null;
		request.setCharacterEncoding("utf-8"); 
		response.setContentType("text/html;charset=utf-8");  
		String path = getServletContext().getRealPath("/film_images");
		System.out.println(path);
	    String tmpPath = getServletContext().getRealPath("/tmp");
		boolean isMultipart =ServletFileUpload.isMultipartContent(request);
		DiskFileItemFactory factory = new DiskFileItemFactory(); 
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setHeaderEncoding("utf-8");
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
			 String sExt = localfileName.substring(ii,localfileName.length());
			 if(sExt.equals(".jpg")||sExt.equals(".png")||sExt.equals(".JPG")){
			 image = new Date().getTime() + sExt; 


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
			
			if("filmid".equals(item.getFieldName())){

				filmid = item.getString(); } 
			}
	}
		
		if(filmid!=null && image!=null){
		Filmtable oldfilm = new FilmDao().getFilmByFilmId(filmid);
		String imagename = oldfilm.getImagename();
		if(imagename!=null){
			File imageposition = new File(path+"/"+imagename);
			 if (imageposition.exists()) {
			imageposition.delete();
			System.out.println("已删除图片");
		}
		}
		}
	
		 try {
				
			 filmname = new String(filmname.getBytes("iso-8859-1"),"utf-8");
			
			 filmtype = new String(filmtype.getBytes("iso-8859-1"),"utf-8");
			 
			 link = new String(link.getBytes("iso-8859-1"),"utf-8");
			 
			 dector = new String(dector.getBytes("iso-8859-1"),"utf-8");
			 
			 actor = new String(actor.getBytes("iso-8859-1"),"utf-8");
			 
			 writer = new String(writer.getBytes("iso-8859-1"),"utf-8");
			
			 introduction = new String(introduction.getBytes("iso-8859-1"),"utf-8");
			
			 country = new String(country.getBytes("iso-8859-1"),"utf-8");
			
			 language = new String(language.getBytes("iso-8859-1"),"utf-8");
			 
			
			 System.out.println("filename:"+filmname);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		Filmtable film=new FilmDao().getFilmByFilmId(filmid);
		film.setId(filmid);
		System.out.println(filmid);
		film.setFilename(filmname);
		film.setActor(actor);
		film.setLanguage(language);
		film.setLink(link);
		film.setScore(score);
		film.setWriter(writer);
		film.setCountry(country);
		film.setDector(dector);
		film.setFilmtype(filmtype);
		film.setIntroduction(introduction);
		film.setYear(year);
		if(image!=null){
		film.setImagename(image);
		}
		new FilmDao().UpdateFilm(film);
		System.out.println(filmname);
		System.out.println(round1);
		RequestDispatcher view=request.getRequestDispatcher("/FilmList?round="+round1);
	    view.forward(request, response);
	}
	}

