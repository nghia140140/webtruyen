package web.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="TheoDoi")
public class TheoDoi {
	@Id
	private String MaTD;
//	private String MaTruyen;
	@OneToOne
    @JoinColumn(name = "MaTruyen")
    private Truyen truyen;
	
	public Truyen getTruyen() {
		return truyen;
	}
	public void setTruyen(Truyen truyen) {
		this.truyen = truyen;
	}
	@ManyToOne
	@JoinColumn(name= "TaiKhoan")
	private TaiKhoan taikhoan;
	public String getMaTD() {
		return MaTD;
	}
	public void setMaTD(String maTD) {
		MaTD = maTD;
	}
	public TaiKhoan getTaikhoan() {
		return taikhoan;
	}
	public void setTaikhoan(TaiKhoan taikhoan) {
		this.taikhoan = taikhoan;
	}
	
//	public String getMaTruyen() {
//		return MaTruyen;
//	}
//	public void setMaTruyen(String maTruyen) {
//		MaTruyen = maTruyen;
//	}
	
}
