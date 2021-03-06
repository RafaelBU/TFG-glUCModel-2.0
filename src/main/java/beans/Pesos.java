// default package
// Generated 14-may-2017 1:22:01 by Hibernate Tools 5.2.1.Final

package beans;
import java.util.Date;

/**
 * Pesos generated by hbm2java
 */
@SuppressWarnings("serial")
public class Pesos implements java.io.Serializable {

	private Long clave;
	private Date date;
	private Long iduser;
	private Double peso;

	public Pesos() {
	}

	public Pesos(Date date, Long iduser, Double peso) {
		this.date = date;
		this.iduser = iduser;
		this.peso = peso;
	}

	public Long getClave() {
		return this.clave;
	}

	public void setClave(Long clave) {
		this.clave = clave;
	}

	public Date getDate() {
		return this.date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Long getIduser() {
		return this.iduser;
	}

	public void setIduser(Long iduser) {
		this.iduser = iduser;
	}

	public Double getPeso() {
		return this.peso;
	}

	public void setPeso(Double peso) {
		this.peso = peso;
	}

}
