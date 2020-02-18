package web.entity;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="TaiKhoan")
public class TaiKhoan{
	@Id
	private String Taikhoan;
	private String Matkhau;
	private String Ten;
	@OneToMany(mappedBy = "taikhoan", fetch=FetchType.EAGER)
	private Collection<TheoDoi> theodoi;
	public String getTaikhoan() {
		return Taikhoan;
	}
	public void setTaikhoan(String taikhoan) {
		Taikhoan = taikhoan;
	}
	public String getMatkhau() {
		return Matkhau;
	}
	public void setMatkhau(String matkhau) {
		Matkhau = matkhau;
	}
	public String getTen() {
		return Ten;
	}
	public void setTen(String ten) {
		Ten = ten;
	}
	public Collection<TheoDoi> getTheodoi() {
		return theodoi;
	}
	public void setTheodoi(Collection<TheoDoi> theodoi) {
		this.theodoi = theodoi;
	}
	
	public TaiKhoan() {
		// TODO Auto-generated constructor stub
		super();
	}
	
	public TaiKhoan(String taikhoan, String matkhau, String ten){
		super();
		this.Taikhoan = taikhoan;
		this.Matkhau = matkhau;
		this.Ten = ten;
	}
}