import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import util.DatabaseSend;

@WebServlet("/añadeSolucion/*")
public class AñadirSolucionServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String textoSolucion = request.getParameter("solucion");
		System.out.println(textoSolucion);
		
		String idSol = DatabaseSend.añadirSolucion(textoSolucion);
		
		String json = new Gson().toJson(idSol);
    	System.out.println(json);
    	
		response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        response.getWriter().write(json);
		
	}

}
