package web.entity;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="Theloai")
public class Theloai {
	@Id
	private String Maloai;
	private String Tenloai;
	@OneToMany(mappedBy = "theloai", fetch=FetchType.EAGER)
	private Collection<Truyen> truyen;
	public String getMaloai() {
		return Maloai;
	}
	public void setMaloai(String maloai) {
		Maloai = maloai;
	}
	public String getTenloai() {
		return Tenloai;
	}
	public void setTenloai(String tenloai) {
		Tenloai = tenloai;
	}
	public Collection<Truyen> getTruyen() {
		return truyen;
	}
	public void setTruyen(Collection<Truyen> truyen) {
		this.truyen = truyen;
	}
	
}
