import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;


import beans.Recomendaciones;

import util.DatabaseRecieve;

@WebServlet("/cargaRecomendador/*")
public class CargaRecomendadorServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private DatabaseRecieve db;
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession sesion = request.getSession();
		int id = (int)sesion.getAttribute("id-paciente");
		
		db = new DatabaseRecieve();
		
		List<Recomendaciones> lista = db.dameIdRecomendacionesManuales(id, false);
		
		ArrayList recomendaciones = new ArrayList();
		
		for(int i = 0; i < lista.size(); i++){
			db = new DatabaseRecieve();
			recomendaciones.add(db.cargaRecomendacion(lista.get(i).getIdDes(), 
								lista.get(i).getId().getIdRec(), lista.get(i).getId().getIdSol(), lista.get(i).getIdActi(), lista.get(i).getIdPac()));
			
		}
		
		String json = new Gson().toJson(recomendaciones);
		System.out.println(json);
    	
    	response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        response.getWriter().write(json);
		
	}

}
