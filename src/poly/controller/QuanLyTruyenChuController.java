package poly.controller;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
import web.entity.TapTC;
import web.entity.TapTT;
import web.entity.Truyen;

@Transactional
@Controller
public class QuanLyTruyenChuController {
	@Autowired
	SessionFactory factory;
	@Autowired
	ServletContext context;
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

//	 _________________________________________________QUẢN LÝ  TRUYỆN CHỮ_________________________________________
	String matruyenchu = "";
	String mataptruyen;
	@RequestMapping("/admin/taptc/{matruyen}")
	public String taptruyenTranh(ModelMap model,@PathVariable String matruyen) {
		if(admin.getAdmin2().equals("true")){
			Session session = factory.getCurrentSession();
			String hql = "FROM TapTC WHERE truyen.Matruyen='"+matruyen+"'";
			Query query = session.createQuery(hql);
			List<TapTC> list = query.list();
			model.addAttribute("taptc", list);
			mataptruyen=matruyen;
			model.addAttribute("matruyen", matruyen);
			matruyenchu = matruyen;
			return "admin/taptc/dstaptc";
		}
		return "error";
	}
	@ModelAttribute("matruyen")
	public ModelMap c(ModelMap model)
	{
		model.addAttribute("matruyenchu", matruyenchu);
		return model;
	}
//	__________________________________________________________INSERT TẬP____________________________________________________
	TapTC taptruyenchu = new TapTC();
	@RequestMapping(value="/themtruyenchu/{matruyen}",method=RequestMethod.GET)
	public String insertTapTC(ModelMap model,@PathVariable("matruyen") String matruyen)
	{
		if(admin.getAdmin2().equals("true")){
			model.addAttribute("matruyen", matruyen);
			return "admin/taptc/insert";
		}
		return "error";
	}
	@RequestMapping("/luutruyenchu/{matruyen}")
	public String chonanhtap(ModelMap model,
			@PathVariable("matruyen") String maTT,
			@RequestParam("tap") int tap,
			@RequestParam("tentapTC") String tentapTC,
			@RequestParam("noidung") MultipartFile noidung
			)
	{
		if(admin.getAdmin2().equals("true")){
			String stap = Integer.toString(tap);
			Session session = factory.openSession();
			if(stap.trim().length()==0){
				model.addAttribute("message", "Vui lòng nhập tập");
			}
			else if(tap<0 || tap>100){
				model.addAttribute("message", "Tập không phải số, xin kiểm tra lại");
			}
			else if(tentapTC.trim().length()==0){
				model.addAttribute("message", "Vui lòng nhập tên tập");
			}else if(noidung.isEmpty()){
				model.addAttribute("message", "Vui lòng nhập file");
			}else if(noidung.getContentType().equals("text/plain")){
				String matap=maTT+tap;
				String hql = "FROM TapTC t WHERE t.Matap='"+matap+"'";
				Query query = session.createQuery(hql);
				List<TapTC> list = query.list();
				int count = 0;
				for(TapTC u : list){
					count++;
				}
				System.out.println(count);
				if(count ==1)
				{
					model.addAttribute("message", "Tập đã tồn tại");
				}else{
					TapTC taptc = new TapTC();
					Truyen truyen = (Truyen) session.get(Truyen.class, maTT);
					taptc.setMatap(matap);
					taptc.setTap(tap);
					taptc.setTentapTC(tentapTC);
					taptc.setTruyen(truyen);
					String b=null;
					try{
						String photoPath = context.getRealPath("/resource/images/"+noidung.getOriginalFilename());
						noidung.transferTo(new File(photoPath));
						b="/resource/images/"+noidung.getOriginalFilename();
					}
					catch(Exception ex){
						
						model.addAttribute("message",ex);
					}
					taptc.setNoidung(b);
					Transaction t =session.beginTransaction();
					try{
						session.save(taptc);
						t.commit();
						return "redirect:/admin/taptc/"+maTT+".htm";
					}
					catch(Exception e){
						t.rollback();
						model.addAttribute("message", "Thêm mới thất bại!: "+e);
					}
					finally{
						session.close();
					}
				}
			}
			else{
				model.addAttribute("message", "File không hợp lệ");
			}
			model.addAttribute("Tap", tap);
			model.addAttribute("tenTap", tentapTC);
			model.addAttribute("matruyen", maTT);
			return "admin/taptc/insert";
		}
		return "error";
	}
//	_________________________________________xoa tap____________________________________________________________
	@RequestMapping(value = "xoatruyenchu/{matap}")
	public String delete(ModelMap model, @PathVariable String matap) {
		if(admin.getAdmin2().equals("true")){
			Session session = factory.getCurrentSession();
			try {
				TapTC t = (TapTC) session.get(TapTC.class, matap);
				session.delete(t);
				session.flush();
			}catch(Exception e) {
				e.printStackTrace();
			}
			return "redirect:/admin/taptc/"+mataptruyen+".htm";
		}
		return "error";
	}
//	______________________________________________________________UPDATE SỬA_____________________________________________
	TapTC trTranh = new TapTC();
	@RequestMapping(value="/updateTC/{matruyen}")
	public String updateTapTC(ModelMap model,@ModelAttribute("taptc")TapTC taptc,
			@PathVariable("matruyen") String matruyen,
			BindingResult error)
	{
		if(admin.getAdmin2().equals("true")){
			if(taptc.getTentapTC().trim().length()==0){
				error.rejectValue("tentapTC", "taptc", "Vui lòng nhập tên tập");
				model.addAttribute("matruyen", matruyen);
			}else{
			Session session = factory.openSession();
			Transaction t =session.beginTransaction();
			Truyen truyen = (Truyen) session.get(Truyen.class, matruyen);
			
			trTranh.setTruyen(truyen);
			trTranh.setTentapTC(taptc.getTentapTC());
			try{
				session.update(trTranh);
				t.commit();
				return "redirect:/admin/taptc/"+matruyen+".htm";
			}
			catch(Exception e){
				t.rollback();
				model.addAttribute("message", "Thêm mới thất bại!: "+e);
			}
			finally{
				session.close();
			}
			}
			return "admin/taptc/update";
		}
		return "error";
	}
	
	@RequestMapping("/updateTC/{matap}/{matruyen}")
	public String editTapTC(ModelMap model,
			@PathVariable("matap") String matap,
			@PathVariable("matruyen") String matruyen) 
	{
		if(admin.getAdmin2().equals("true")){
			Session session = factory.openSession();
			TapTC taptc = (TapTC) session.get(TapTC.class, matap);
			trTranh = taptc;
			model.addAttribute("matruyen", matruyen);
			model.addAttribute("taptc", taptc);
			return "admin/taptc/update";
		}
		return "error";
		
	}
	
	
	@RequestMapping(value="/updateNoidung/{matruyen}")
	public String updateNoidung(ModelMap model,
			@PathVariable("matruyen") String matruyen,
			@RequestParam("noidung") MultipartFile noidung)
	{
		if(admin.getAdmin2().equals("true")){
			Session session = factory.openSession();
			Transaction t =session.beginTransaction();
			Truyen truyen = (Truyen) session.get(Truyen.class, matruyen);
			trTranh.setTruyen(truyen);
			if(noidung.getOriginalFilename() != null){
				String b="";
				try{
					String photoPath = context.getRealPath("/resource/images/"+noidung.getOriginalFilename());
					noidung.transferTo(new File(photoPath));
					b="/resource/images/"+noidung.getOriginalFilename();
					trTranh.setNoidung(b);
				}
				catch(Exception ex){
					
					model.addAttribute("message",ex);
				}
			}
			try{

				session.update(trTranh);
				t.commit();
				return "redirect:/admin/taptc/"+matruyen+".htm";
			}
			catch(Exception e){
				t.rollback();
				model.addAttribute("message", "Thêm mới thất bại!: "+e);
			}
			finally{
				session.close();
			}
			return "admin/taptc/updatenoidung";
		}
		return "error";
	}
	
	@RequestMapping("/updateNoidung/{matap}/{truyen.getMatruyen()}")
	public String editNoidung(ModelMap model,
			@PathVariable("matap") String matap,
			@PathVariable("truyen.getMatruyen()") String matruyen) 
	{
		if(admin.getAdmin2().equals("true")){
			Session session = factory.openSession();
			TapTC taptc = (TapTC) session.get(TapTC.class, matap);
			trTranh = taptc;
			model.addAttribute("matruyen", matruyen);
			return "admin/taptc/updatenoidung";
		}
		return "error";
		
	}
}
