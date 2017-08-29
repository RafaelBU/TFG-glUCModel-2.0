import java.io.IOException;
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

@WebServlet("/numeroPacientes/*")
public class NumeroPacientesServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private DatabaseRecieve db;
		
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sesion = request.getSession();
    	db = new DatabaseRecieve();
    	Long idDoctor = (Long)sesion.getAttribute("id");
    	List<Usuarios> listaPacientes = db.numeroPacientes(idDoctor);
    	
    	String json = new Gson().toJson(listaPacientes);
    	System.out.println(json);
    	
    	response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        response.getWriter().write(json);
    	
    	
	 }
}
