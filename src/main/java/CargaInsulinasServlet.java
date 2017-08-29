import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import util.DatabaseRecieve;

@WebServlet("/cargaInsulinas/*")
public class CargaInsulinasServlet extends HttpServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private DatabaseRecieve db;
		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sesion = request.getSession();
		Long id = (Long)sesion.getAttribute("id-paciente-long");
    	db = new DatabaseRecieve();
    	List<Double> listaInsulinas = db.cargaInsulinas(id);
    	
    	String json = new Gson().toJson(listaInsulinas);
    	System.out.println(json);
    	
    	response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        response.getWriter().write(json);
    	
    	
	 }

}
