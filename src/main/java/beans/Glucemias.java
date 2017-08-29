// default package
// Generated 14-may-2017 1:22:01 by Hibernate Tools 5.2.1.Final

package beans;
import java.util.Date;

/**
 * Glucemias generated by hbm2java
 */
@SuppressWarnings("serial")
public class Glucemias implements java.io.Serializable {

	private Long clave;
	private Date date;
	private Long iduser;
	private Integer moment;
	private String observations;
	private Double value;

	public Glucemias() {
	}

	public Glucemias(Date date, Long iduser, Integer moment, String observations, Double value) {
		this.date = date;
		this.iduser = iduser;
		this.moment = moment;
		this.observations = observations;
		this.value = value;
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

	public Integer getMoment() {
		return this.moment;
	}

	public void setMoment(Integer moment) {
		this.moment = moment;
	}

	public String getObservations() {
		return this.observations;
	}

	public void setObservations(String observations) {
		this.observations = observations;
	}

	public Double getValue() {
		return this.value;
	}

	public void setValue(Double value) {
		this.value = value;
	}

}