package util;


import java.util.Iterator;
import java.util.List;

import org.hibernate.*;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.google.gson.Gson;

import beans.*;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

@Path("/doctor")
public class DatabaseRecieve {
	Session session = null;

	public DatabaseRecieve() {
		this.session = HibernateUtil.getSessionFactory().getCurrentSession();
	}
	
	
	public Usuarios login(String email, String password)
	{
		Usuarios medico = null;
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			Query q = session.createQuery(
					"FROM Usuarios as u WHERE u.email = :email AND u.password = :password AND u.colegiado IS NOT NULL");
			
			q.setParameter("email", email);
			q.setParameter("password", password);
			
			List<Usuarios> lmedico = (List<Usuarios>)q.list();
			if(!lmedico.isEmpty())
				medico = lmedico.get(0);
			
			tx.commit(); 
			
			return medico;
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
			return null;
			
		}
		
	}

	public List<Usuarios> cargaPacientes(Long idDoctor, int num){
		
		List<Usuarios> list = null;
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			Query q = session.createQuery("FROM Usuarios as u WHERE u.iddoctor = :id ORDER BY u.id DESC");
			q.setLong("id", idDoctor);
			if(num != -1)
				q.setMaxResults(num);
			list = (List<Usuarios>)q.list();
			
			
			tx.commit();
			
			return list;
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
			return null;
		}
	}
	
	public List<Usuarios> numeroPacientes(Long idDoctor){
		List<Usuarios> list = null;
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			Query q = session.createQuery("FROM Usuarios as u WHERE u.iddoctor = :id");
			q.setParameter("id", idDoctor);
			
			list = (List<Usuarios>)q.list();
			
			tx.commit();
			
			return list;
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
			return null;
		}
	}
	
	public Usuarios cargaPaciente(int idPac){
		
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			Query q = session.createQuery("FROM Usuarios as u WHERE u.id = :idPac");
			q.setParameter("idPac", idPac);
			Usuarios paciente = (Usuarios)q.getSingleResult();
			
			tx.commit(); 
			
			return paciente;
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
			return null;
		}
		
	}
	
	public List<Double> cargaPesos(Long idPac){
		
		List<Double> list = null;
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			Query q = session.createQuery("SELECT p.peso " +
										  "FROM Pesos as p " +
										  "WHERE p.iduser = :idPac " +
										  "ORDER BY p.clave ASC");
			q.setParameter("idPac", idPac);
			q.setMaxResults(12);
			list = (List<Double>)q.list();
			
			
			tx.commit(); 
			
			return list;
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
			return null;
		}
	}
	
	public List<Double> cargaGlucemias(Long idPac){
			
			List<Double> list = null;
			Transaction tx = null;
			try {
				tx = session.beginTransaction();
				Query q = session.createQuery("SELECT g.value " +
											  "FROM Glucemias as g " +
											  "WHERE g.iduser = :idPac " +
											  "ORDER BY g.clave ASC");
				q.setParameter("idPac", idPac);
				q.setMaxResults(7);
				list = (List<Double>)q.list();
				
				
				tx.commit(); 
				
				return list;
			} catch (Exception e) {
				tx.rollback();
				e.printStackTrace();
				return null;
			}
		}
	
	public List<Double> cargaInsulinas(Long idPac){
			
			List<Double> list = null;
			Transaction tx = null;
			try {
				tx = session.beginTransaction();
				Query q = session.createQuery("SELECT i.value " +
											  "FROM Insulinas as i " +
											  "WHERE i.iduser = :idPac " +
											  "ORDER BY i.clave ASC");
				q.setParameter("idPac", idPac);
				q.setMaxResults(7);
				list = (List<Double>)q.list();
				
				
				tx.commit(); 
				
				return list;
			} catch (Exception e) {
				tx.rollback();
				e.printStackTrace();
				return null;
			}
		}
	
	public double cargaPesoPaciente(Long idPac){
		List<Double> list = null;
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			Query q = session.createQuery("SELECT p.peso " +
										  "FROM Pesos as p " +
										  "WHERE p.iduser = :idPac " +
										  "ORDER BY p.clave DESC");
			q.setParameter("idPac", idPac);
			list = (List<Double>)q.list();
			
			if(!list.isEmpty()){
				tx.commit();
				return list.get(0);
			}
			else{
				tx.commit();
				return -1;
			}
			
			
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
			return -1;
		}
	}
	
	public Pruebas cargaFondoOjosPaciente(Long idPaciente){
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			Query q = session.createQuery("FROM Pruebas as p "+
							              "WHERE p.iduser = :idPaciente");
			
			q.setParameter("idPaciente", idPaciente);
			Pruebas prueba = (Pruebas)q.uniqueResult();
			
			tx.commit();
			
			return prueba;
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
			return null;
		}
	}
	
	public boolean compruebaEmail(String email){
		boolean existe = false;
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			Query q = session.createQuery("FROM Usuarios as u "+
										  "WHERE u.email = :email");
			
			q.setParameter("email", email);
			if(q.getSingleResult() == null)
				existe = true;
			tx.commit();
			
			return existe;
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
			return true;
		}
	}
	
	public List<Usuarios> buscaPacientes(Long idDoctor, String usuario){
		List<Usuarios> list = null;
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			Query q = session.createQuery("FROM Usuarios as u "+
							"WHERE u.iddoctor = :id AND u.name LIKE :usuario");
			
			q.setLong("id", idDoctor);
			q.setParameter("usuario", usuario + "%");
			list = (List<Usuarios>)q.list();
			
			tx.commit();
			
			return list;
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
			return null;
		}
	}
	
	public Mediciones getMedicionPaciente(int idPaciente){
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			Query q = session.createQuery("FROM Mediciones as m " +
										  "WHERE m.idPaciente = :idPaciente");
			
			q.setParameter("idPaciente", idPaciente);
			Mediciones medicion = (Mediciones) q.uniqueResult();
			
			tx.commit();
			
			return medicion;
			
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
			return null;
		}
	}
	
	public List<Descripcionrec> getDescripciones(){
		List<Descripcionrec> list = null;
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			Query q = session.createQuery("FROM Descripcionrec");
			
			
			list = (List<Descripcionrec>)q.list();
			
			
			tx.commit();
			
			return list;
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
			return null;
		}
		
	}
	
	public List<Recomendaciones> dameIdRecomendacionesManuales(int idPac, boolean enviada){
		List<Recomendaciones> list = null;
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			
			Query q = session.createQuery("FROM Recomendaciones as r "+
					                       "WHERE r.idPac = :idPac AND r.enviada = :enviada " +
										   "ORDER BY r.id.idRec DESC");
			
			q.setParameter("idPac", idPac);
			q.setParameter("enviada", enviada);
			list = (List<Recomendaciones>)q.list();
			
			
			tx.commit();
			
			return list;
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
			return null;
		}
	}
	
	public List<Recomendaciones> dameIdRecomendacionesManuales(Long idPac, boolean enviada){
		List<Recomendaciones> list = null;
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			Query q = session.createQuery("FROM Recomendaciones as r "+
					                       "WHERE r.idPac = :idPac AND r.enviada = :enviada " +
										   "ORDER BY r.id.idRec DESC");
			
			q.setParameter("idPac", idPac);
			q.setParameter("enviada", enviada);
			list = (List<Recomendaciones>)q.list();
			
			
			tx.commit();
			
			return list;
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
			return null;
		}
	}
	
	public int cargaUltimoIdRec(){
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			Query q = session.createQuery("SELECT max( r.id.idRec ) FROM Recomendaciones as r");
			
			
			int idRec = (int)q.getSingleResult();
			
			
			tx.commit();
			
			return idRec;
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
			return -1;
		}
		
	}
	
	public List<Recomendaciones> cargaRecomendacion(Integer idDes, int idPac){
		
		List<Recomendaciones> list = null;
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			Query q = session.createQuery("FROM Recomendaciones as r "+
					                       "WHERE r.idDes = :idDes " +
												"AND r.idPac != :idPac");
			q.setParameter("idDes", idDes);
			q.setParameter("idPac", idPac);
	
			list = (List<Recomendaciones>)q.list();
			
			tx.commit();
			
			return list;
			
			
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
			return null;
		}
	}
	
	public Object cargaRecomendacion(Integer idDes, Integer idRec, Integer idSol, Integer idActi, Integer idPac ){
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			Query q = session.createQuery("FROM Descripcionrec as d, " +
										         "Solucionrec as s,  " +
										         "Actividadesrec as a, " +
										         "Recomendaciones as r, " +
										         "Usuarios as u " +
					                       "WHERE r.id.idRec = :idRec " +
					                          "AND r.id.idSol = :idSol " +
					                          "AND d.idDes = :idDes " +
										      "AND s.idSol = :idSol " +
					                       	  "AND a.idActi = :idActi " +
					                       	  "AND u.id = :idPac ");
			
			q.setParameter("idRec", idRec);
			q.setParameter("idDes", idDes);
			q.setParameter("idSol", idSol);
			q.setParameter("idActi", idActi);
			q.setParameter("idPac", idPac);
			Object recomendacion = q.uniqueResult();
			
			
			tx.commit();
			
			return recomendacion;
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
			return null;
		}
		
		
	}
	
	
	public Descripcionrec cargaDescripciones(Integer idDes){
		List<Descripcionrec> list = null;
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			Query q = session.createQuery("FROM Descripcionrec as d "+
					                       "WHERE d.idDes = :idDes");
			q.setInteger("idDes", idDes);
	
			list = (List<Descripcionrec>)q.list();
			System.out.println(list.get(0));
			Descripcionrec descripcion = list.get(0);
			
			tx.commit();
			
			return descripcion;
			
			
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
			return null;
		}
		
	}
	
	public List<Solucionrec> cargaSoluciones(){
		List<Solucionrec> list = null;
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			Query q = session.createQuery("FROM Solucionrec");
			
			
			list = (List<Solucionrec>)q.list();
			tx.commit();
			
			return list;
			
			
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
			return null;
		}
		
	}
	
	public Solucionrec cargaSoluciones(Integer idSol){
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			Query q = session.createQuery("FROM Solucionrec as s "+
					                       "WHERE s.idSol = :idSol");
			
			q.setParameter("idSol", idSol);
			Solucionrec solucion = (Solucionrec)q.uniqueResult();
			tx.commit();
			
			return solucion;
			
			
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
			return null;
		}
		
	}
	
	public Actividadesrec cargaActividades(Integer idActi){
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			Query q = session.createQuery("FROM Actividadesrec as a "+
					                       "WHERE a.idActi = :idActi");
			
			q.setParameter("idActi", idActi);
			Actividadesrec actividades = (Actividadesrec)q.uniqueResult();
			tx.commit();
			
			return actividades;
			
			
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
			return null;
		}
		
	}
	
	public Mediciones cargaVariablesDes(int idPaciente){
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			Query q = session.createQuery("FROM Mediciones as m "+
					                       "WHERE m.idPaciente = :idPaciente");
			
			q.setParameter("idPaciente", idPaciente);
			Mediciones medicion = (Mediciones)q.getSingleResult();
			tx.commit();
			
			return medicion;
			
			
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
			return null;
		}
		
	}
	
	public int cargaDescripcion(double Adehiper, double Adehipo , double Adohiper, double Adohipo,
						double Dcehiper, double Dcehipo, double Dcohiper, double Dcohipo, double Ddhiper, double Ddhipo,
						double Mhiper, double Mhipo, double Mmhiper, double Mmhipo){
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			Query q = session.createQuery( "SELECT r.idDes " +
										   "FROM Descripcionrec as r "+
					                       "WHERE r.adehiper = :Adehiper " +
											"AND r.adehipo = :Adehipo " +
											"AND r.adohiper = :Adohiper " +
											"AND r.adohipo = :Adohipo " +
											"AND r.dcehiper = :Dcehiper " +
											"AND r.dcehipo = :Dcehipo " +
											"AND r.dcohiper = :Dcohiper " +
											"AND r.dcohipo = :Dcohipo " +
											"AND r.ddhiper = :Ddhiper " +
											"AND r.ddhipo = :Ddhipo " +
											"AND r.mhiper = :Mhiper " +
											"AND r.mhipo = :Mhipo " +
											"AND r.mmhiper = :Mmhiper " +
											"AND r.mmhipo = :Mmhipo " );
			
			q.setParameter("Adehiper", Adehiper);
			q.setParameter("Adehipo", Adehipo);
			q.setParameter("Adohiper", Adohiper);
			q.setParameter("Adohipo", Adohipo);
			q.setParameter("Dcehiper", Dcehiper);
			q.setParameter("Dcehipo", Dcehipo);
			q.setParameter("Dcohiper", Dcohiper);
			q.setParameter("Dcohipo", Dcohipo);
			q.setParameter("Ddhiper", Ddhiper);
			q.setParameter("Ddhipo", Ddhipo);
			q.setParameter("Mhiper", Mhiper);
			q.setParameter("Mhipo", Mhipo);
			q.setParameter("Mmhiper", Mmhiper);
			q.setParameter("Mmhipo", Mmhipo);
			int idDes= (int)q.getSingleResult();
			tx.commit();
			
			return idDes;
			
			
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
			return -1;
		}
		
	}
	
}
