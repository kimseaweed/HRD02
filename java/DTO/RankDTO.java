package HRD02.DTO;

public class RankDTO {
	public RankDTO() {}
	public RankDTO(int m_NO, String m_NAME, int tot) {
		super();
		M_NO = m_NO;
		M_NAME = m_NAME;
		this.tot = tot;
	}
	public int getM_NO() {
		return M_NO;
	}
	public void setM_NO(int m_NO) {
		M_NO = m_NO;
	}
	public String getM_NAME() {
		return M_NAME;
	}
	public void setM_NAME(String m_NAME) {
		M_NAME = m_NAME;
	}
	public int getTot() {
		return tot;
	}
	public void setTot(int tot) {
		this.tot = tot;
	}
	int M_NO;
	String M_NAME;
	int tot;
}
