// default package
// Generated 14-may-2017 1:22:01 by Hibernate Tools 5.2.1.Final
package beans;
import java.util.Date;

/**
 * Actividadesrec generated by hbm2java
 */
@SuppressWarnings("serial")
public class Actividadesrec implements java.io.Serializable {

	private Integer idActi;
	private Date fechaActividad;
	private String accion;

	public Actividadesrec() {
	}

	public Actividadesrec(Date fechaActividad, String accion) {
		this.fechaActividad = fechaActividad;
		this.accion = accion;
	}

	public Integer getIdActi() {
		return this.idActi;
	}

	public void setIdActi(Integer idActi) {
		this.idActi = idActi;
	}

	public Date getFechaActividad() {
		return this.fechaActividad;
	}

	public void setFechaActividad(Date fechaActividad) {
		this.fechaActividad = fechaActividad;
	}

	public String getAccion() {
		return this.accion;
	}

	public void setAccion(String accion) {
		this.accion = accion;
	}

}
