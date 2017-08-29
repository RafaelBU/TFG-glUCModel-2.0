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

@WebServlet("/buscaPacientes/*")
public class BuscaPacientesServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private DatabaseRecieve db;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession sesion = request.getSession();
		String usuario = request.getParameter("nombrePaciente");
		System.out.println(usuario);
		db = new DatabaseRecieve();
    	Long idDoctor = (Long)sesion.getAttribute("id");
    	List<Usuarios> lista = db.buscaPacientes(idDoctor, usuario);
    	
    	String json = new Gson().toJson(lista);
    	System.out.println(json);
    	
    	response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        response.getWriter().write(json);
	}

}
