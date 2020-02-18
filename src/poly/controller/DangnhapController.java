package poly.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import web.bean.Admin;
import web.bean.User;
import web.entity.Anh;
import web.entity.TaiKhoan;
import web.entity.TapTT;
import web.entity.Truyen;

@Transactional
@Controller
public class DangnhapController {
	@Autowired
	SessionFactory factory;
	@Autowired
	Admin admin;
	@Autowired
	User taiKhoan;
//	_________________________________________________________ĐĂNG NHẬP & ĐĂNG XUẤT______________________________________________

	@RequestMapping("/login")
	public String Login(ModelMap model){
		if(admin.getAdmin2().equals("false") && admin.getAdmin1().equals("0") ){
			return "login/login";
		}
		else{
			return "redirect:/trangchu/doctruyen.htm";
		}
	}
	@ModelAttribute("admin")
	public Admin getAdmin(){
		return admin;
	}
	@ModelAttribute("admin")
	public ModelMap b(ModelMap model)
	{
		if(admin.getAdmin1().equals("1"))
		{
			model.addAttribute("admin", admin.getAdmin1());
			model.addAttribute("ten", taiKhoan.getTen());
			model.addAttribute("taikhoan", taiKhoan.getTaikhoan());
		}else{
			model.addAttribute("admin", admin.getAdmin2());
		}
		return model;
	}
	@ModelAttribute("taiKhoan")
	public User geTaiKhoan(){
		return taiKhoan;
	}
	@RequestMapping("/logout")
	public String dangxuat(ModelMap model)
	{
		admin.setAdmin1("0");
		admin.setAdmin2("false");
		return "redirect:/trangchu/doctruyen.htm";
	}
	@RequestMapping("/dxadmin")
	public String dxadmin() {
		admin.setAdmin2("false");
		return "redirect:/trangchu/doctruyen.htm";
	}
	@RequestMapping("/quanly")
	public String quanly() {
		if(admin.getAdmin2().equals("true"))
		return "redirect:/admin/truyen/dstruyen.htm";
		return "error";
	}
//	_______________________________________________________________ADMIN______________________________________________

	@RequestMapping(value="/dangnhap")
	public String index(ModelMap model,
			@RequestParam("taikhoan") String taikhoan,
			@RequestParam("matkhau") String matkhau)
	{
		if(taikhoan.trim().length()==0){
			model.addAttribute("message", "Vui lòng điền tài khoản");
		}else if(matkhau.trim().length()==0){
			model.addAttribute("message", "Vui lòng điền tài khoản");
		}else{
			Session session = factory.getCurrentSession();
			TaiKhoan t = (TaiKhoan) session.get(TaiKhoan.class, taikhoan);
			if(t!=null){
	//			System.out.println("Tài khoản");
	//		}
	////		System.out.println("Tài khoản"+t.getTaikhoan());
	//		String hql = "FROM TaiKhoan t WHERE t.Taikhoan='"+taikhoan+"' AND t.Matkhau='"+matkhau+"'";
	//		Query query = session.createQuery(hql);
	//		List<TaiKhoan> list = query.list();
	//		int count=0;
	//		for(TaiKhoan u : list){
	//			count++;
	//		}
	//		if(count ==1)
	//		{
				admin.setAdmin2("false");
				admin.setAdmin1("1");
	//			for(TaiKhoan u : list){
					taiKhoan.setTaikhoan(t.getTaikhoan());
					taiKhoan.setMatkhau(t.getMatkhau());
					taiKhoan.setTen(t.getTen());
	//			}
				
				return "redirect:/trangchu/doctruyen.htm";
			}else if(taikhoan.equals("truongxuannghia140@gmail.com")&&matkhau.equals("hungSoi007")){
				admin.setAdmin1("0");
				admin.setAdmin2("true");
				return "redirect:/trangchu/doctruyen.htm";
			}
			else{
				model.addAttribute("message", "Tài khoản hoặc mật khẩu sai");
				return "login/login";
			}
		}
		return "login/login";
	}

	@RequestMapping(value="/xuatTK")
	public String xuatTK(ModelMap model){
		Session session = factory.getCurrentSession();
		String hql = "FROM TaiKhoan";
		Query query = session.createQuery(hql);
		List<TaiKhoan> list = query.list();
		model.addAttribute("taikhoan", list);
		return "login/taikhoan";
	}
//	_____________________________________________xem TK______________________________________
	@RequestMapping(value="/xemTK/{taikhoan}")
	public String xemTK(ModelMap model,@PathVariable("taikhoan")String taikhoan)
	{
		Session session = factory.getCurrentSession();
		TaiKhoan t = (TaiKhoan) session.get(TaiKhoan.class, taikhoan);
		List<TaiKhoan> list = new ArrayList<>();
		list.add(t);
		model.addAttribute("taikhoan", list);
		return "login/thongtin";
	}
//	_______________________________________________xóa TK_________________________________________________
	@RequestMapping(value="/xoaTK/{taikhoan}")
	public String xoaTK(ModelMap model,@PathVariable("taikhoan")String taikhoan){
		
	Session session = factory.getCurrentSession();
	try {
		TaiKhoan t = (TaiKhoan) session.get(TaiKhoan.class, taikhoan);
		session.delete(t);
		session.flush();
	}catch(Exception e) {
		e.printStackTrace();
	}
		return "redirect:/xuatTK.htm";
	}
//___________________________________________________ĐĂNG KÝ_________________________________________________________
	@RequestMapping(value="/dangky",method=RequestMethod.GET)
	public String dangky(ModelMap model)
	{
		model.addAttribute("tk", new TaiKhoan());
		return "login/dangky";
	}
	@RequestMapping(value="/dangky",method=RequestMethod.POST)
	public String dangky2(ModelMap model,
			@ModelAttribute("tk")TaiKhoan tk,
			@RequestParam("matkhau2") String mk,
			BindingResult error)
	{	
		if(tk.getTen().trim().length()==0)
		{
			error.rejectValue("ten", "tk", "Vui lòng nhập tên");
		}else if(tk.getTaikhoan().trim().length()==0)
		{
			error.rejectValue("taikhoan", "tk", "Vui lòng nhập tài khoản");
		}else if(tk.getMatkhau().trim().length()==0)
		{
			error.rejectValue("matkhau", "tk", "Vui lòng nhập mật khẩu");
		}else if(mk.trim().length()==0)
		{
			model.addAttribute("message2", "Vui lòng nhập lại mật khẩu");
		}else if(tk.getMatkhau().equals(mk)){
			Session session = factory.openSession();
			TaiKhoan taikhoan = (TaiKhoan) session.get(TaiKhoan.class, tk.getTaikhoan());
			if(taikhoan!=null){
				error.rejectValue("taikhoan", "tk", "Vui lòng chọn tài khoản khác, Tài khoản trùng");
			}else{
				Transaction t =session.beginTransaction();
				try{
					session.save(tk);
					t.commit();
					return "login/login";
				}
				catch(Exception e){
					t.rollback();
					model.addAttribute("message", "Thêm mới thất bại!" +e);
				}
				finally{
					session.close();
				}
			}
		}else{
			model.addAttribute("message2", "Kiểm tra lại, mật khẩu không khớp");
		}
		model.addAttribute("mk", mk);
		return "login/dangky";
	
	}
}
