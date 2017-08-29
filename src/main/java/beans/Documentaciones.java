// default package
// Generated 14-may-2017 1:22:01 by Hibernate Tools 5.2.1.Final

package beans;
import java.util.Date;

/**
 * Documentaciones generated by hbm2java
 */
@SuppressWarnings("serial")
public class Documentaciones implements java.io.Serializable {

	private Long clave;
	private Date date;
	private byte[] fichero;
	private String filename;
	private Long filesize;
	private Long iduser;
	private Long tipodestino;
	private String description;
	private String filetype;

	public Documentaciones() {
	}

	public Documentaciones(Date date, byte[] fichero, String filename, Long filesize, Long iduser, Long tipodestino,
			String description, String filetype) {
		this.date = date;
		this.fichero = fichero;
		this.filename = filename;
		this.filesize = filesize;
		this.iduser = iduser;
		this.tipodestino = tipodestino;
		this.description = description;
		this.filetype = filetype;
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

	public byte[] getFichero() {
		return this.fichero;
	}

	public void setFichero(byte[] fichero) {
		this.fichero = fichero;
	}

	public String getFilename() {
		return this.filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public Long getFilesize() {
		return this.filesize;
	}

	public void setFilesize(Long filesize) {
		this.filesize = filesize;
	}

	public Long getIduser() {
		return this.iduser;
	}

	public void setIduser(Long iduser) {
		this.iduser = iduser;
	}

	public Long getTipodestino() {
		return this.tipodestino;
	}

	public void setTipodestino(Long tipodestino) {
		this.tipodestino = tipodestino;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getFiletype() {
		return this.filetype;
	}

	public void setFiletype(String filetype) {
		this.filetype = filetype;
	}

}