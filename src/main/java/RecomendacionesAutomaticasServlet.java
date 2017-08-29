import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import beans.Descripcionrec;
import beans.Mediciones;
import beans.Recomendaciones;
import util.DatabaseRecieve;

@WebServlet("/recomendadorAutomatico/*")
public class RecomendacionesAutomaticasServlet extends HttpServlet{

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
		Mediciones medicion = db.getMedicionPaciente(id);
		db = new DatabaseRecieve();
		List<Descripcionrec> listaDes  = db.getDescripciones();
		List<Double> resultados = new LinkedList<>();
		double suma = 0;
		List<Double> media = new LinkedList<>();
		List<Recomendaciones> listaReco = new LinkedList<>();
		ArrayList recomendaciones = new ArrayList();
		
		for(int i = 0; i < listaDes.size(); i++){
			resultados.add(1 - Math.abs(listaDes.get(i).getAdehiper() - medicion.getAdehiper()) / 10);
			resultados.add(1 - Math.abs(listaDes.get(i).getAdehipo() - medicion.getAdehipo()) / 10);
			resultados.add(1 - Math.abs(listaDes.get(i).getAdohiper() - medicion.getAdohiper()) / 10);
			resultados.add(1 - Math.abs(listaDes.get(i).getAdohipo() - medicion.getAdohipo()) / 10);
			resultados.add(1 - Math.abs(listaDes.get(i).getDcehiper() - medicion.getDcehiper()) / 10);
			resultados.add(1 - Math.abs(listaDes.get(i).getDcehipo() - medicion.getDcehipo()) / 10);
			resultados.add(1 - Math.abs(listaDes.get(i).getDcohiper() - medicion.getDcohiper()) / 10);
			resultados.add(1 - Math.abs(listaDes.get(i).getDcohipo() - medicion.getDcohipo()) / 10);
			resultados.add(1 - Math.abs(listaDes.get(i).getDdhiper() - medicion.getDdhiper()) / 10);
			resultados.add(1 - Math.abs(listaDes.get(i).getDdhipo() - medicion.getDdhipo()) / 10);
			resultados.add(1 - Math.abs(listaDes.get(i).getMhiper() - medicion.getMhiper()) / 10);
			resultados.add(1 - Math.abs(listaDes.get(i).getMhipo() - medicion.getMhipo()) / 10);
			resultados.add(1 - Math.abs(listaDes.get(i).getMmhiper()- medicion.getMmhiper()) / 10);
			resultados.add(1 - Math.abs(listaDes.get(i).getMmhipo()- medicion.getMmhipo()) / 10);
			
			for(int j = 0; j < resultados.size(); j++){
				suma+= resultados.get(j);
			}
			media.add(suma / 14);
			suma = 0;
			resultados.clear();
		}
		
		
		for(int i = 0; i < media.size(); i++){
			if(media.get(i) >= 0.5 && media.get(i) < 1){
				//Me quedo con esa recomendacion
				db = new DatabaseRecieve();
				listaReco = db.cargaRecomendacion(listaDes.get(i).getIdDes(), id);
				
			}
		}
		System.out.println("LISTA DE RECO");
		System.out.println(listaReco.size());
		String json0 = new Gson().toJson(listaReco);
		System.out.println(json0);
		
		db = new DatabaseRecieve();
		for(int j = 0; j < listaReco.size(); j++){
			recomendaciones.add(db.cargaRecomendacion(listaReco.get(j).getIdDes(), 
						listaReco.get(j).getId().getIdRec(), listaReco.get(j).getId().getIdSol(), listaReco.get(j).getIdActi(), listaReco.get(j).getIdPac()));
			db = new DatabaseRecieve();
		}
		
		
		System.out.println("MEDIAS");
		for(int i = 0; i < media.size(); i++){
			System.out.println(media.get(i));
		}
		
		
		String json = new Gson().toJson(recomendaciones);
		System.out.println(json);
    	
    	response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        response.getWriter().write(json);
		
	}

}
