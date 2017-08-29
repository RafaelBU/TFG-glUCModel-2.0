import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import beans.Usuarios;
import util.DatabaseRecieve;

@WebServlet("/listaPacientes/*")
public class ListaPacientesServlet extends HttpServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private DatabaseRecieve db;
		
	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        try {
	        	HttpSession sesion = request.getSession();
	        	db = new DatabaseRecieve();
	        	Long idDoctor = (Long)sesion.getAttribute("id");
	        	
	        	int num = Integer.parseInt(request.getParameter("num"));
	        	List<Usuarios> lista = db.cargaPacientes(idDoctor, num * 2);
	        	List<Usuarios> lista2 = new LinkedList<>();
	        	if(num == 1)
	        		num = num - 1;
	        	for(int i = num; i < lista.size(); i++){
	        		lista2.add(lista.get(i));
	        	}
	        	
	        	String json = new Gson().toJson(lista2);
	        	System.out.println(json);
	        	
	        	response.setContentType("application/json");
	            response.setCharacterEncoding("UTF-8");
	            
	            response.getWriter().write(json);
	           
	        	
	        } catch (Exception e) { }
	    }
	

}
