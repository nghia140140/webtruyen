package web.bean;

public class User {
	private String taikhoan;
	private String matkhau;
	private String ten;
	public User(){
		super();
	}
	public User(String taikhoan, String matkhau, String ten){
		super();
		this.taikhoan = taikhoan;
		this.matkhau = matkhau;
		this.ten = ten;
		
	}
	public String getTaikhoan() {
		return taikhoan;
	}
	public void setTaikhoan(String taikhoan) {
		this.taikhoan = taikhoan;
	}
	public String getMatkhau() {
		return matkhau;
	}
	public void setMatkhau(String matkhau) {
		this.matkhau = matkhau;
	}
	public String getTen() {
		return ten;
	}
	public void setTen(String ten) {
		this.ten = ten;
	}

}
