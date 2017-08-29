import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.DatabaseSend;

@WebServlet("/enviaRecomendacionIndex/*")
public class EnviaRecomendacionIndexServlet extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String info = request.getParameter("infoRecomendacion");
		System.out.println(info);
		String [] arrayId = info.split(",");
	
		int idRec = Integer.parseInt(arrayId[0]);
		int idSol = Integer.parseInt(arrayId[1]);
		int idPac = Integer.parseInt(arrayId[2]);
		int idDes = Integer.parseInt(arrayId[3]);
		int idActi = Integer.parseInt(arrayId[4]);

		System.out.println(idSol);
		System.out.println(idDes);
		System.out.println(idActi);
		System.out.println(idPac);
		
		DatabaseSend.enviaRecomendacion(idRec, idSol, idPac, idDes, idActi, idPac);
		response.sendRedirect("indexMedico.jsp");
		
	}

}
