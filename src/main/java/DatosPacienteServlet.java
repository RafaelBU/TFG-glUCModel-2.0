import java.io.IOException;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Usuarios;
import util.DatabaseRecieve;

@WebServlet("/datosPaciente/*")
public class DatosPacienteServlet extends HttpServlet {

private static final long serialVersionUID = 1L;

private DatabaseRecieve db;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession sesion = request.getSession();
		request.setCharacterEncoding("UTF-8");
		int id = Integer.parseInt(request.getParameter("id-paciente"));
		Long idl = Long.valueOf(request.getParameter("id-paciente"));
		String nombre = request.getParameter("nombre-paciente");
		String apellido1 = request.getParameter("apellido1-paciente");
		System.out.println(apellido1);
		
		sesion.setAttribute("id-paciente", id);
		sesion.setAttribute("id-paciente-long", idl);
		sesion.setAttribute("nombre-paciente", nombre);
		sesion.setAttribute("apellido1-paciente", apellido1);
		if(request.getParameter("apellido2-paciente") != null){
			String apellido2 = request.getParameter("apellido2-paciente");
			sesion.setAttribute("apellido2-paciente", apellido2);
		}
		
		db = new DatabaseRecieve();
		Usuarios paciente = db.cargaPaciente(id);
		db = new DatabaseRecieve();
		System.out.println(id);
		double peso = db.cargaPesoPaciente(new Long(id));
		System.out.println(peso);
		
		sesion.setAttribute("altura", paciente.getHeight());
		sesion.setAttribute("peso", peso);
		Date fechaActual = Calendar.getInstance().getTime();
		long diferenciaEn_ms = fechaActual.getTime() - paciente.getDate().getTime();
		long dias = diferenciaEn_ms / (1000 * 60 * 60 * 24);
		int años = (int)dias / 365;
		sesion.setAttribute("edad", años);

		response.sendRedirect("perfilPaciente.jsp");
	}
}
