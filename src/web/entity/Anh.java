package web.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="Anh")
public class Anh {
	@Id
	private String MaAnh;
	private String TenAnh;
	@ManyToOne
	@JoinColumn(name= "MaTap")
	private TapTT taptt;
	public String getMaAnh() {
		return MaAnh;
	}
	public void setMaAnh(String maAnh) {
		MaAnh = maAnh;
	}
	public String getTenAnh() {
		return TenAnh;
	}
	public void setTenAnh(String tenAnh) {
		TenAnh = tenAnh;
	}
	public TapTT getTaptt() {
		return taptt;
	}
	public void setTaptt(TapTT taptt) {
		this.taptt = taptt;
	}
	
}
