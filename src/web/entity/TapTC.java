package web.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="TapTC")
public class TapTC {
	@Id
	private String Matap;
	private int Tap;
	private String TentapTC;
	private String Noidung;
	@ManyToOne
	@JoinColumn(name= "MaTC")
	private Truyen truyen;
	public String getMatap() {
		return Matap;
	}
	public void setMatap(String matap) {
		Matap = matap;
	}
	public int getTap() {
		return Tap;
	}
	public void setTap(int tap) {
		Tap = tap;
	}
	public String getTentapTC() {
		return TentapTC;
	}
	public void setTentapTC(String tentapTC) {
		TentapTC = tentapTC;
	}
	public String getNoidung() {
		return Noidung;
	}
	public void setNoidung(String noidung) {
		Noidung = noidung;
	}
	public Truyen getTruyen() {
		return truyen;
	}
	public void setTruyen(Truyen truyen) {
		this.truyen = truyen;
	}
	
}
