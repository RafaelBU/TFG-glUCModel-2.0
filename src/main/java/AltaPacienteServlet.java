import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;

import util.DatabaseSend;

@WebServlet("/altaPaciente/*")
public class AltaPacienteServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession sesion = request.getSession();
		request.setCharacterEncoding("UTF-8");
		Long idDoctor = (Long)sesion.getAttribute("id");
		String nombre = request.getParameter("nombre");
		String apellido1 = request.getParameter("apellido1");
		String apellido2;
		if(request.getParameter("apellido2") != null)
			apellido2 = request.getParameter("apellido2");
		else
			apellido2 = null;
		String fechaN = request.getParameter("fechaN");
		String dni = request.getParameter("DNI");
		String email = request.getParameter("email");
		double altura = Double.parseDouble(request.getParameter("altura"));
		String sexoP = request.getParameter("sexo-paciente");
		String fechac = request.getParameter("fechaC");
		String pass = request.getParameter("contrasena");
		String passcifrada = DigestUtils.sha1Hex(pass);
		System.out.println(nombre);
		System.out.println(apellido1);
		System.out.println(apellido2);
		System.out.println(fechaN);
		System.out.println(dni);
		System.out.println(email);
		System.out.println(altura);
		System.out.println(sexoP);
		System.out.println(fechac);
		System.out.println(pass);
		System.out.println(passcifrada);
		
    	DatabaseSend.nuevoPaciente(nombre, apellido1, apellido2, fechaN, dni, email, altura, sexoP, fechac, passcifrada, idDoctor);
    	response.sendRedirect("gestionPacientes.jsp");
    	
	}

}
