// default package
// Generated 14-may-2017 1:22:01 by Hibernate Tools 5.2.1.Final

package beans;
/**
 * NivelEje generated by hbm2java
 */
@SuppressWarnings("serial")
public class NivelEje implements java.io.Serializable {

	private int id;
	private String description;

	public NivelEje() {
	}

	public NivelEje(int id, String description) {
		this.id = id;
		this.description = description;
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

}
