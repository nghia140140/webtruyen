package web.entity;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name="TapTT")
public class TapTT {
	@Id
	private String Matap;
	private int Tap;
	private String TentapTT;
	@ManyToOne
	@JoinColumn(name= "MaTT")
	private Truyen truyen;
	@OneToMany(mappedBy = "taptt", fetch=FetchType.EAGER)
	private Collection<Anh> anh;
	
	public Collection<Anh> getAnh() {
		return anh;
	}
	public void setAnh(Collection<Anh> anh) {
		this.anh = anh;
	}
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
	public String getTentapTT() {
		return TentapTT;
	}
	public void setTentapTT(String tentapTT) {
		TentapTT = tentapTT;
	}
	public Truyen getTruyen() {
		return truyen;
	}
	public void setTruyen(Truyen truyen) {
		this.truyen = truyen;
	}
	
}
