import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.codec.digest.DigestUtils;

import util.DatabaseRecieve;
import beans.Usuarios;

@WebServlet("/login")
public class LoginServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private DatabaseRecieve db;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		HttpSession sesion = request.getSession();
		db = new DatabaseRecieve();
		
        String usuario, pass, passcifrada;
        usuario = request.getParameter("email");
        pass = request.getParameter("password");
        passcifrada = DigestUtils.sha1Hex(pass);
        
        Usuarios medico = db.login(usuario, passcifrada);
        
        if(!(medico == null) && sesion.getAttribute("usuario") == null){
            //si coincide usuario y password y además no hay sesión iniciada
            sesion.setAttribute("usuario", medico.getName());
            sesion.setAttribute("apellido1", medico.getSurname1());
            if(medico.getSurname2() != null)
            	 sesion.setAttribute("apellido2", medico.getSurname2());
            sesion.setAttribute("id", medico.getId());
            sesion.setAttribute("email-medico", medico.getEmail());
            sesion.setAttribute("numero-colegiado", medico.getColegiado());
            sesion.setAttribute("fallo", false);
            sesion.setAttribute("login", true);
            
            response.sendRedirect("indexMedico.jsp");
        }else{
            //lógica para login inválido
        	sesion.setAttribute("fallo", true);
        	response.sendRedirect("inicio.jsp");
        }
    }
	

}
