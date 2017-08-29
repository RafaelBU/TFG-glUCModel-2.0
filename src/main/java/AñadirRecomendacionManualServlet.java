import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import beans.Actividadesrec;
import beans.Mediciones;
import beans.Recomendaciones;
import beans.RecomendacionesId;
import beans.Solucionrec;
import util.DatabaseRecieve;
import util.DatabaseSend;


@WebServlet("/añadeRecomendacionManual/*")
public class AñadirRecomendacionManualServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private DatabaseRecieve db;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession sesion = request.getSession();
		int idSol = Integer.parseInt(request.getParameter("idSol"));
		int idPaciente = (int)sesion.getAttribute("id-paciente");
		String nombre = (String)sesion.getAttribute("usuario");
		String apellido1 = (String)sesion.getAttribute("apellido1");
		String apellido2 = null;
		if(sesion.getAttribute("apellido2") != null)
			apellido2 = (String)sesion.getAttribute("apellido2");
			
		db = new DatabaseRecieve();
		Mediciones medicion = db.cargaVariablesDes(idPaciente);
		db = new DatabaseRecieve();
		int idDes = db.cargaDescripcion(medicion.getAdehiper(), medicion.getAdehipo(), medicion.getAdohiper(), medicion.getAdohipo(),
						medicion.getDcehiper(), medicion.getDcehipo(), medicion.getDcohiper(), medicion.getDcohipo(), medicion.getDdhiper(), medicion.getDdhipo(),
						medicion.getMhiper(), medicion.getMhipo(), medicion.getMmhiper(), medicion.getMmhipo());
		
		Recomendaciones recomendacion = DatabaseSend.añadirRecomendacion(idSol, idPaciente, idDes, nombre, apellido1, apellido2);
		db = new DatabaseRecieve();
		int idRec = db.cargaUltimoIdRec();
		RecomendacionesId rId = recomendacion.getId();
		rId.setIdRec(idRec);
		recomendacion.setId(rId);
		db = new DatabaseRecieve();
		Actividadesrec actividades = db.cargaActividades(recomendacion.getIdActi());
		db = new DatabaseRecieve();
		Solucionrec solucion = db.cargaSoluciones(idSol);
		
		ArrayList<Object> infoRecomendacion = new ArrayList<Object>();
		infoRecomendacion.add(recomendacion);
		infoRecomendacion.add(actividades);
		infoRecomendacion.add(solucion);
		
		String json = new Gson().toJson(infoRecomendacion);
		System.out.println(json);
    	
    	response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        response.getWriter().write(json);
		
	}
	
}
