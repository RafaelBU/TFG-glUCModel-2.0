// default package
// Generated 14-may-2017 1:22:01 by Hibernate Tools 5.2.1.Final

package beans;
import java.math.BigDecimal;

/**
 * Sequence generated by hbm2java
 */
@SuppressWarnings("serial")
public class Sequence implements java.io.Serializable {

	private String seqName;
	private BigDecimal seqCount;

	public Sequence() {
	}

	public Sequence(String seqName) {
		this.seqName = seqName;
	}

	public Sequence(String seqName, BigDecimal seqCount) {
		this.seqName = seqName;
		this.seqCount = seqCount;
	}

	public String getSeqName() {
		return this.seqName;
	}

	public void setSeqName(String seqName) {
		this.seqName = seqName;
	}

	public BigDecimal getSeqCount() {
		return this.seqCount;
	}

	public void setSeqCount(BigDecimal seqCount) {
		this.seqCount = seqCount;
	}

}