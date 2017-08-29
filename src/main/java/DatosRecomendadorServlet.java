import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Mediciones;
import util.DatabaseRecieve;

@WebServlet("/datosRecomendador/*")
public class DatosRecomendadorServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private DatabaseRecieve db;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession sesion = request.getSession();
		request.setCharacterEncoding("UTF-8");
		int id = Integer.parseInt(request.getParameter("id-paciente"));
		String nombre = request.getParameter("nombre-paciente");
		String apellido1 = request.getParameter("apellido1-paciente");
		
		sesion.setAttribute("id-paciente", id);
		sesion.setAttribute("nombre-paciente", nombre);
		sesion.setAttribute("apellido1-paciente", apellido1);
		if(request.getParameter("apellido2-paciente") != null){
			String apellido2 = request.getParameter("apellido2-paciente");
			sesion.setAttribute("apellido2-paciente", apellido2);
		}
		
		db = new DatabaseRecieve();
		Mediciones medicion = db.getMedicionPaciente(id);
		if(medicion == null)
			response.sendRedirect("recomendadorVacio.jsp");
		else
			response.sendRedirect("recomendadorPaciente.jsp");
	}

}
