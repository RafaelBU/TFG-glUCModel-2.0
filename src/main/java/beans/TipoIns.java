// default package
// Generated 14-may-2017 1:22:01 by Hibernate Tools 5.2.1.Final

package beans;
/**
 * TipoIns generated by hbm2java
 */
@SuppressWarnings("serial")
public class TipoIns implements java.io.Serializable {

	private int id;
	private String description;
	private String category;

	public TipoIns() {
	}

	public TipoIns(int id, String description) {
		this.id = id;
		this.description = description;
	}

	public TipoIns(int id, String description, String category) {
		this.id = id;
		this.description = description;
		this.category = category;
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

	public String getCategory() {
		return this.category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

}