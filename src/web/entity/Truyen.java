package web.entity;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;


@Entity
@Table(name="Truyen")
public class Truyen {
	@Id
	private String Matruyen;
	private String Tentruyen;
	private String Tacgia;
	private String Tinhtrang;
	private String Tomtat;
	@OneToOne(mappedBy = "truyen", fetch=FetchType.EAGER)
	private TheoDoi theodoi;
	
	@OneToMany(mappedBy = "truyen", fetch=FetchType.EAGER)
	@Fetch(value = FetchMode.SUBSELECT)
	private Collection<TapTT> taptt;
	@OneToMany(mappedBy = "truyen", fetch=FetchType.EAGER)
	@Fetch(value = FetchMode.SUBSELECT)
	private Collection<TapTC> taptc;
	@ManyToOne
	@JoinColumn(name= "Maloai")
	private Theloai theloai;
	private String Anh;
	public String getMatruyen() {
		return Matruyen;
	}
	public void setMatruyen(String matruyen) {
		Matruyen = matruyen;
	}
	public String getTentruyen() {
		return Tentruyen;
	}
	public void setTentruyen(String tentruyen) {
		Tentruyen = tentruyen;
	}
	
	public Theloai getTheloai() {
		return theloai;
	}
	public void setTheloai(Theloai theloai) {
		this.theloai = theloai;
	}
	public String getTacgia() {
		return Tacgia;
	}
	public void setTacgia(String tacgia) {
		Tacgia = tacgia;
	}
	public String getTinhtrang() {
		return Tinhtrang;
	}
	public void setTinhtrang(String tinhtrang) {
		Tinhtrang = tinhtrang;
	}
	public String getTomtat() {
		return Tomtat;
	}
	public void setTomtat(String tomtat) {
		Tomtat = tomtat;
	}
	
	public Collection<TapTT> getTaptt() {
		return taptt;
	}
	public void setTaptt(Collection<TapTT> taptt) {
		this.taptt = taptt;
	}
	
	public Collection<TapTC> getTaptc() {
		return taptc;
	}
	public void setTaptc(Collection<TapTC> taptc) {
		this.taptc = taptc;
	}
	public String getAnh() {
		return Anh;
	}
	public void setAnh(String anh) {
		Anh = anh;
	}
	public TheoDoi getTheodoi() {
		return theodoi;
	}
	public void setTheodoi(TheoDoi theodoi) {
		this.theodoi = theodoi;
	}
}
