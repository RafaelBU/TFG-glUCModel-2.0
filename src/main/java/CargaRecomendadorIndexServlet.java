
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
import beans.Usuarios;
import util.DatabaseRecieve;

@WebServlet("/cargaRecomendadorIndex/*")
public class CargaRecomendadorIndexServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private DatabaseRecieve db;
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession sesion = request.getSession();
		Long idDoctor = (Long)sesion.getAttribute("id");
		ArrayList recomendaciones = new ArrayList();
		
		db = new DatabaseRecieve();
		
		List<Usuarios> listaPacientes = db.cargaPacientes(idDoctor, -1);
		
		for(int i = 0; i < listaPacientes.size(); i++){
			db = new DatabaseRecieve();
			Integer idp = (int) (long)listaPacientes.get(i).getId();
			System.out.println("Soy el paciente" +idp);
			List<Recomendaciones> listaReco = db.dameIdRecomendacionesManuales(idp, false);
			
			for(int j = 0; j < listaReco.size(); j++){
				db = new DatabaseRecieve();
				recomendaciones.add(db.cargaRecomendacion(listaReco.get(j).getIdDes(), 
									listaReco.get(j).getId().getIdRec(), listaReco.get(j).getId().getIdSol(), listaReco.get(j).getIdActi(), listaReco.get(j).getIdPac()));
				
				
			}
			
		}
		
		String json = new Gson().toJson(recomendaciones);
		System.out.println(json);
    	
    	response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        response.getWriter().write(json);
		
	}
}
