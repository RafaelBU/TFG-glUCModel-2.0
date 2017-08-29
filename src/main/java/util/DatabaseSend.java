package util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.ws.rs.Path;

import org.hibernate.Session;
import org.hibernate.Transaction;

import beans.Recomendaciones;
import beans.RecomendacionesId;
import beans.Solucionrec;
import beans.Usuarios;
import beans.Actividadesrec;
@Path("/doctor")
public class DatabaseSend {
	
	public static void nuevoPaciente(String nombre, String apellido1, String apellido2, String fechaN, String dni, 
									String email, double altura, String sexoP, String fechac, String pass, Long idDoctor) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Transaction tx = null;
		tx = session.beginTransaction();
		
		Usuarios u = new Usuarios();
		Date fechaNacimiento;
		Date fechaConsentimiento;
		
		u.setName(nombre);
		u.setSurname1(apellido1);
		if(apellido2 != null)
			u.setSurname2(apellido2);
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		
		try {
			fechaNacimiento = formatter.parse(fechaN);
			u.setDate(fechaNacimiento);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		u.setDni(dni);
		u.setEmail(email);
		u.setHeight(altura);
		u.setSex(sexoP);
		
		try {
			fechaConsentimiento = formatter.parse(fechac);
			u.setFechaconsen(fechaConsentimiento);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		u.setPassword(pass);
		u.setIddoctor(idDoctor);
		
		session.save(u);
		tx.commit();
	}
	

	public static String añadirSolucion(String texto) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Transaction tx = null;
		tx = session.beginTransaction();
		Solucionrec solucion = new Solucionrec();
		solucion.setTexto(texto);
		solucion.setCategoria("categoria por defecto");
		
		

		session.save(solucion);
		tx.commit();
		
		return solucion.getIdSol().toString();
	}
	
	public static void enviaRecomendacion(int idRec, int idSol, int idPaciente, int idDes, int idActi, int idPac){
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Transaction tx = null;
		tx = session.beginTransaction();
		
		RecomendacionesId recId = new RecomendacionesId();
		
		if(idPaciente == idPac)
			recId.setIdRec(idRec);
		
		recId.setIdSol(idSol);
		
		Date fecha = Calendar.getInstance().getTime();
		Recomendaciones recomendacion = new Recomendaciones();
		
		recomendacion.setId(recId);
		recomendacion.setIdPac(idPaciente);
		recomendacion.setIdDes(idDes);
		recomendacion.setIdActi(idActi);
		recomendacion.setEnviada(true);
		recomendacion.setLeida(false);
		recomendacion.setFecha(fecha);
		
		session.saveOrUpdate(recomendacion);
		tx.commit();
		
		
		
	}
	
	public static Recomendaciones añadirRecomendacion(int idSol, int idPaciente, int idDes, String nombre, String apellido1, String apellido2){
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Transaction tx = null;
		tx = session.beginTransaction();
		
		RecomendacionesId recId = new RecomendacionesId();
		Actividadesrec actividad = new Actividadesrec();
		
		
		recId.setIdSol(idSol);
		
		Date fecha = Calendar.getInstance().getTime();
		actividad.setFechaActividad(fecha);
		actividad.setAccion(nombre + " " + apellido1 + " " + apellido2 + " ha creado la recomendación");
		session.save(actividad);
		Recomendaciones recomendacion = new Recomendaciones();
		
		recomendacion.setId(recId);
		recomendacion.setIdPac(idPaciente);
		recomendacion.setIdDes(idDes);
		recomendacion.setIdActi(actividad.getIdActi());
		recomendacion.setEnviada(false);
		recomendacion.setLeida(false);
		recomendacion.setFecha(fecha);
		

		session.save(recomendacion);
		
		tx.commit();
		
		return recomendacion;
	}

}
