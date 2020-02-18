package poly.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import web.bean.Admin;
import web.bean.User;
import web.entity.Truyen;

@Transactional
@Controller
@RequestMapping("/trangchu/")
public class Trangchu {
	@Autowired
	SessionFactory factory;
	@Autowired
	Admin admin;
	@Autowired
	User taiKhoan;
	@ModelAttribute("taiKhoan")
	public User geTaiKhoan(){
		return taiKhoan;
	}
	@ModelAttribute("admin")
	public Admin getAdmin(){
		return admin;
	}
	@ModelAttribute("admin")
	public ModelMap a(ModelMap model)
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
	@RequestMapping("doctruyen")
	public String boruto(ModelMap model) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Truyen t WHERE t.theloai.Maloai ='TT'";
		Query query = session.createQuery(hql);
		
		@SuppressWarnings("unchecked")
		List<Truyen> list = query.list();
		model.addAttribute("truyentranh", list);
		
		String hql2 = "FROM Truyen t WHERE t.theloai.Maloai ='TC'";
		Query query2 = session.createQuery(hql2);
		
		@SuppressWarnings("unchecked")
		List<Truyen> list2 = query2.list();
		model.addAttribute("truyenchu", list2);
		return "trangchu/doctruyen";
	}
	@RequestMapping("truyentranh")
	public String truyentranh(Model model)
	{
		Session session = factory.getCurrentSession();
		String hql = "FROM Truyen t WHERE t.theloai.Maloai ='TT'";
		Query query = session.createQuery(hql);
		
		@SuppressWarnings("unchecked")
		List<Truyen> list = query.list();
		model.addAttribute("truyentranh", list);
		return "trangchu/truyentranh";
	}
	@RequestMapping("truyenchu")
	public String truyenchu(Model model)
	{
		Session session = factory.getCurrentSession();
		String hql = "FROM Truyen t WHERE t.theloai.Maloai ='TC'";
		Query query = session.createQuery(hql);
		
		@SuppressWarnings("unchecked")
		List<Truyen> list = query.list();
		model.addAttribute("truyenchu", list);
		return "trangchu/truyenchu";
	}
}
