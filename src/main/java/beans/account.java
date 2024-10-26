package beans;

public class account {
	int uid;
	int role;
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getRole() {
		return role;
	}
	public void setRole(int role) {
		this.role = role;
	}
	public account(int uid, int role) {
		super();
		this.uid = uid;
		this.role = role;
	}
	
}
