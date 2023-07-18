package HRD02.DTO;

public class VoteDTO {
	String v_name;
	String v_birth; //생년
	String v_age; //나이
	String v_gender; //성별
	String v_no; 
	String v_time;
	String v_confirm; //유권자확인
	
	public VoteDTO() {}
	public VoteDTO(String v_name, String v_birth, String v_age, String v_gender, String v_no, String v_time,
			String v_confirm) {
		super();
		this.v_name = v_name;
		this.v_birth = v_birth;
		this.v_age = v_age;
		this.v_gender = v_gender;
		this.v_no = v_no;
		this.v_time = v_time;
		this.v_confirm = v_confirm;
	}
	public String getV_name() {
		return v_name;
	}
	public void setV_name(String v_name) {
		this.v_name = v_name;
	}
	public String getV_birth() {
		return v_birth;
	}
	public void setV_birth(String v_birth) {
		this.v_birth = v_birth;
	}
	public String getV_age() {
		return v_age;
	}
	public void setV_age(String v_age) {
		this.v_age = v_age;
	}
	public String getV_gender() {
		return v_gender;
	}
	public void setV_gender(String v_gender) {
		this.v_gender = v_gender;
	}
	public String getV_no() {
		return v_no;
	}
	public void setV_no(String v_no) {
		this.v_no = v_no;
	}
	public String getV_time() {
		return v_time;
	}
	public void setV_time(String v_time) {
		this.v_time = v_time;
	}
	public String getV_confirm() {
		return v_confirm;
	}
	public void setV_confirm(String v_confirm) {
		this.v_confirm = v_confirm;
	}
}
