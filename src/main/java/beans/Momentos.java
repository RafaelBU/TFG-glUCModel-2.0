// default package
// Generated 14-may-2017 1:22:01 by Hibernate Tools 5.2.1.Final

package beans;
/**
 * Momentos generated by hbm2java
 */
@SuppressWarnings("serial")
public class Momentos implements java.io.Serializable {

	private int id;
	private String description;
	private Short hourfrom;
	private Short hourto;

	public Momentos() {
	}

	public Momentos(int id, String description) {
		this.id = id;
		this.description = description;
	}

	public Momentos(int id, String description, Short hourfrom, Short hourto) {
		this.id = id;
		this.description = description;
		this.hourfrom = hourfrom;
		this.hourto = hourto;
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Short getHourfrom() {
		return this.hourfrom;
	}

	public void setHourfrom(Short hourfrom) {
		this.hourfrom = hourfrom;
	}

	public Short getHourto() {
		return this.hourto;
	}

	public void setHourto(Short hourto) {
		this.hourto = hourto;
	}

}
