import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import beans.Mediciones;
import beans.Pruebas;
import beans.Recomendaciones;
import beans.RecomendacionesId;
import beans.Usuarios;
import util.DatabaseRecieve;
import util.DatabaseSend;

@WebServlet("/añadeRecomendacionIndex/*")
public class AñadeRecomendacionIndexServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private DatabaseRecieve db;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession sesion = request.getSession();
		String mediciones = request.getParameter("array");
		mediciones = mediciones.replace("[", "");
		mediciones = mediciones.replace("]", "");
		mediciones = mediciones.replaceAll("\"", "");
		String [] arrayMedicionesInicial = mediciones.split(",");
		List<String> arrayMediciones = new LinkedList<>();
		String fondoOjos = request.getParameter("fondoOjos");
		boolean tieneFondoOjos;
		if(fondoOjos.equals("true"))
			tieneFondoOjos = true;
		else
			tieneFondoOjos = false;
		double imcDouble = Double.parseDouble(request.getParameter("imc"));
		int imc = (int) imcDouble;
		int idSol = Integer.parseInt(request.getParameter("idSol"));
		
		for(int i = 0; i < 14; i++){
			if(i < arrayMedicionesInicial.length)
				arrayMediciones.add(arrayMedicionesInicial[i]);
			else
				arrayMediciones.add("-1");
		}
		
		System.out.println(mediciones);
		System.out.println(arrayMediciones);
		System.out.println(fondoOjos);
		System.out.println(tieneFondoOjos);
		System.out.println(imc);
		System.out.println(idSol);
		
		List<Double> listaMediciones = new LinkedList<>();
		
		for(int i = 0; i < arrayMediciones.size(); i++){
			listaMediciones.add(Double.parseDouble(arrayMediciones.get(i)));
		}
		
    	db = new DatabaseRecieve();
    	Long idDoctor = (Long)sesion.getAttribute("id");
    	List<Usuarios> listaUsuarios = db.cargaPacientes(idDoctor, -1);
    	List<Long> listaIdUsuarios = new LinkedList<>();
    	List<Double> listaPesoUsuarios = new LinkedList<>();
    	List<Double> listaAlturaUsuarios = new LinkedList<>();
    	List<Mediciones> listaMedicionesSistema = new LinkedList<>();
    	ArrayList<Object> infoRecomendacion = new ArrayList<Object>();
    	
    	for(int i = 0; i < listaUsuarios.size(); i++){
    		db = new DatabaseRecieve();
    		listaIdUsuarios.add(listaUsuarios.get(i).getId());
    		listaPesoUsuarios.add(db.cargaPesoPaciente(listaUsuarios.get(i).getId()));
    		listaAlturaUsuarios.add(listaUsuarios.get(i).getHeight());
    	}
    	
    	db = new DatabaseRecieve();
    	
    	for(int i = 0; i < listaIdUsuarios.size(); i++){
    		listaMedicionesSistema.add(db.getMedicionPaciente((listaIdUsuarios.get(i).intValue())));
    		db = new DatabaseRecieve();
    		System.out.println((listaIdUsuarios.get(i).intValue()));
    	}
    	
    	for(int i = 0; i < listaMedicionesSistema.size(); i++){
    		System.out.println(listaMedicionesSistema.get(i));
    	}
		
    	boolean valida = true;
    	
    	for(int i = 0; i < listaMedicionesSistema.size(); i++){
    		if(listaMedicionesSistema.get(i) != null){
    			System.out.println("Paciente número " + listaIdUsuarios.get(i));
    			System.out.println(valida);
	    		if(listaMediciones.get(0) != -1){
	    			System.out.println(listaMedicionesSistema.get(i).getAdehiper());
	    			if(listaMediciones.get(0) < listaMedicionesSistema.get(i).getAdehiper()){
	    				System.out.println("1) Me hago falsa con paciente " + listaIdUsuarios.get(i));
	    				valida = false;
	    			}
	        			
	    		}
	    		if(listaMediciones.get(1) != -1){
	    			System.out.println(listaMedicionesSistema.get(i).getAdehipo());
	    			if(listaMediciones.get(1) < listaMedicionesSistema.get(i).getAdehipo()){
	    				System.out.println("2) Me hago falsa con paciente " + listaIdUsuarios.get(i));
	        			valida = false;
	    			}
	    		}
	    		if(listaMediciones.get(2) != -1){
	    			if(listaMediciones.get(2) < listaMedicionesSistema.get(i).getDdhiper())
	        			valida = false;
	    		}
	    		if(listaMediciones.get(3) != -1){
	    			if(listaMediciones.get(3) < listaMedicionesSistema.get(i).getDdhipo())
	        			valida = false;
	    		}
	    		if(listaMediciones.get(4) != -1){
	    			if(listaMediciones.get(4) < listaMedicionesSistema.get(i).getMmhiper())
	        			valida = false;
	    		}
	    		if(listaMediciones.get(5) != -1){
	    			if(listaMediciones.get(5) < listaMedicionesSistema.get(i).getMmhipo())
	        			valida = false;
	    		}
	    		if(listaMediciones.get(6) != -1){
	    			if(listaMediciones.get(6) < listaMedicionesSistema.get(i).getDcohiper())
	        			valida = false;
	    		}
	    		if(listaMediciones.get(7) != -1){
	    			if(listaMediciones.get(7) < listaMedicionesSistema.get(i).getDcohipo())
	        			valida = false;
	    		}
	    		if(listaMediciones.get(8) != -1){
	    			if(listaMediciones.get(8) < listaMedicionesSistema.get(i).getMhiper())
	        			valida = false;
	    		}
	    		if(listaMediciones.get(9) != -1){
	    			if(listaMediciones.get(9) < listaMedicionesSistema.get(i).getMhipo())
	        			valida = false;
	    		}
	    		if(listaMediciones.get(10) != -1){
	    			if(listaMediciones.get(10) < listaMedicionesSistema.get(i).getDcehiper())
	        			valida = false;
	    		}
	    		if(listaMediciones.get(11) != -1){
	    			if(listaMediciones.get(11) < listaMedicionesSistema.get(i).getDcehipo())
	        			valida = false;
	    		}
	    		if(listaMediciones.get(12) != -1){
	    			if(listaMediciones.get(12) < listaMedicionesSistema.get(i).getAdohiper())
	        			valida = false;
	    		}
	    		if(listaMediciones.get(13) != -1){
	    			if(listaMediciones.get(13) < listaMedicionesSistema.get(i).getAdohipo())
	        			valida = false;
	    		}
	    		
	    		if(valida){
	    			System.out.println("1) Soy valida aun para paciente " + listaIdUsuarios.get(i));
	    			double peso = listaPesoUsuarios.get(i);
	    			double altura = listaAlturaUsuarios.get(i);
	    			int resultado = (int)(peso / (altura * altura));
	    			System.out.println("imc :" + imc);
	    			System.out.println("formula : " + resultado);
	    			if(imc != resultado)
	    				valida = false;
	    			
	    			db = new DatabaseRecieve();
	    			Pruebas prueba = db.cargaFondoOjosPaciente(listaIdUsuarios.get(i));
	    			
	    			if(prueba != null){
	    				Date fechaActual = Calendar.getInstance().getTime();
	        			long diferenciaEn_ms = fechaActual.getTime() - prueba.getDate().getTime();
	        			long dias = diferenciaEn_ms / (1000 * 60 * 60 * 24);
	        			int años = (int)dias / 365;
	        			System.out.println("Años " + años);
	        			
	        			if(!tieneFondoOjos && años > 1)
	        				valida = false;
	        			if(tieneFondoOjos && años < 1)
	        				valida = false;
	    			}
	    			else{
	    				if(tieneFondoOjos)
	    					valida = false;
	    			}
	    			
	    		}
	    		
	    		
	    		if(valida){
	    			System.out.println("2) Soy valida aun para paciente " + listaIdUsuarios.get(i));
	    			db = new DatabaseRecieve();
	    			int idDes = db.cargaDescripcion(listaMedicionesSistema.get(i).getAdehiper(), listaMedicionesSistema.get(i).getAdehipo(), 
	    											listaMedicionesSistema.get(i).getAdohiper(), listaMedicionesSistema.get(i).getAdohipo(),
	    											listaMedicionesSistema.get(i).getDcehiper(), listaMedicionesSistema.get(i).getDcehipo(), 
	    											listaMedicionesSistema.get(i).getDcohiper(), listaMedicionesSistema.get(i).getDcohipo(), 
	    											listaMedicionesSistema.get(i).getDdhiper(), listaMedicionesSistema.get(i).getDdhipo(),
	    											listaMedicionesSistema.get(i).getMhiper(), listaMedicionesSistema.get(i).getMhipo(), 
	    											listaMedicionesSistema.get(i).getMmhiper(), listaMedicionesSistema.get(i).getMmhipo());
	    			
	    			int idPaciente = listaIdUsuarios.get(i).intValue();
	    			String nombre = (String)sesion.getAttribute("usuario");
	    			String apellido1 = (String)sesion.getAttribute("apellido1");
	    			String apellido2 = null;
	    			if(sesion.getAttribute("apellido2") != null)
	    				apellido2 = (String)sesion.getAttribute("apellido2");
			
					Recomendaciones recomendacion = DatabaseSend.añadirRecomendacion(idSol, idPaciente, idDes, nombre, apellido1, apellido2);
					db = new DatabaseRecieve();
					
					int idRec = db.cargaUltimoIdRec();
					RecomendacionesId rId = recomendacion.getId();
					rId.setIdRec(idRec);
					recomendacion.setId(rId);
					int idActi = recomendacion.getIdActi();
					
					/*db = new DatabaseRecieve();
					Actividadesrec actividades = db.cargaActividades(recomendacion.getIdActi());
					
					db = new DatabaseRecieve();
					Solucionrec solucion = db.cargaSoluciones(idSol);*/
					
					db = new DatabaseRecieve();
					infoRecomendacion.add(db.cargaRecomendacion(idDes, idRec, idSol, idActi, idPaciente));
	    		}
    		}
    		else{
    			valida = false;
    		}
    		
    		valida = true;
    	}
    	
    	
		String json = new Gson().toJson(infoRecomendacion);
    	System.out.println(json);
    	
		response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        response.getWriter().write(json);
		
	}

}
