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

@WebServlet("/cargaListaEnviadas/*")
public class ListaRecomendacionesEnviadasServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private DatabaseRecieve db;
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession sesion = request.getSession();
		int id = (int)(sesion.getAttribute("id-paciente"));
		
		db = new DatabaseRecieve();
		
		List<Recomendaciones> listaReco = db.dameIdRecomendacionesManuales(id, true);
		
		ArrayList recomendaciones = new ArrayList();
		
		for(int i = 0; i < listaReco.size(); i++){
			db = new DatabaseRecieve();
			recomendaciones.add(db.cargaRecomendacion(listaReco.get(i).getIdDes(), 
								listaReco.get(i).getId().getIdRec(), listaReco.get(i).getId().getIdSol(), listaReco.get(i).getIdActi(), listaReco.get(i).getIdPac()));
			
			
		}
		
		System.out.println("Recomendaciones Enviadas");
		String json = new Gson().toJson(recomendaciones);
		System.out.println(json);
    	
    	response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        response.getWriter().write(json);
		
	}
}
