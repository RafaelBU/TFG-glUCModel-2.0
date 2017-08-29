// default package
// Generated 14-may-2017 1:22:01 by Hibernate Tools 5.2.1.Final

package beans;
import java.util.Date;

/**
 * Ejercicios generated by hbm2java
 */
@SuppressWarnings("serial")
public class Ejercicios implements java.io.Serializable {

	private Long clave;
	private Date date;
	private Long iduser;
	private Integer level;
	private Integer type;
	private int minutes;
	private String observations;

	public Ejercicios() {
	}

	public Ejercicios(int minutes) {
		this.minutes = minutes;
	}

	public Ejercicios(Date date, Long iduser, Integer level, Integer type, int minutes, String observations) {
		this.date = date;
		this.iduser = iduser;
		this.level = level;
		this.type = type;
		this.minutes = minutes;
		this.observations = observations;
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

	public Integer getLevel() {
		return this.level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public Integer getType() {
		return this.type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public int getMinutes() {
		return this.minutes;
	}

	public void setMinutes(int minutes) {
		this.minutes = minutes;
	}

	public String getObservations() {
		return this.observations;
	}

	public void setObservations(String observations) {
		this.observations = observations;
	}

}
