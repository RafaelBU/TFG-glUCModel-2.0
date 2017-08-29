import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import util.DatabaseRecieve;
import beans.Solucionrec;

@WebServlet("/cargaSoluciones/*")
public class SolucionesServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	private DatabaseRecieve db;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		db = new DatabaseRecieve();
		
		List<Solucionrec> lista = db.cargaSoluciones();
		
		String json = new Gson().toJson(lista);
    	System.out.println(json);
    	
    	response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        response.getWriter().write(json);
	}
}
