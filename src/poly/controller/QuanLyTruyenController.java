package poly.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
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
import web.entity.Theloai;
import web.entity.Truyen;

@Transactional
@Controller
public class QuanLyTruyenController {
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
	public Admin getAdmin2(){
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

//	 _________________________________________________QUẢN LÝ DANH SÁCH TRUYỆN_________________________________________
	@RequestMapping("/admin/truyen/dstruyen")
	public String boruto(ModelMap model) {
		if(admin.getAdmin2().equals("true")){
			Session session = factory.getCurrentSession();
			String hql = "FROM Truyen";
			Query query = session.createQuery(hql);
			List<Truyen> list = query.list();
			model.addAttribute("truyen", list);
			return "admin/truyen/dstruyen";
		}
		return "error";
	}
//	__________________________________________________________INSERT____________________________________________________
	@RequestMapping(value="/admin/truyen/insert",method=RequestMethod.GET)
	public String inserttruyen(ModelMap model)
	{
		if(admin.getAdmin2().equals("true")){
			model.addAttribute("truyen", new Truyen());
			return "admin/truyen/insert";
		}
		return "error";
	}
	
	@RequestMapping(value="/admin/truyen/insert",method=RequestMethod.POST)
	public String inserttruyen(ModelMap model,
			@RequestParam("matruyen") String matruyen,
			@RequestParam("tentruyen") String tentruyen,
			@RequestParam("maloai") String maloai,
			@RequestParam("tacgia") String tacgia,
			@RequestParam("tinhtrang") String tinhtrang,
			@RequestParam("tomtat") String tomtat,
			@RequestParam("anh") MultipartFile anh)
	{
		if(admin.getAdmin2().equals("true")){
			String b=null;
				if(matruyen.trim().length()==0)
			{
				model.addAttribute("message", "Vui lòng nhập mã truyện");
			}
			else if(tentruyen.trim().length()==0)
			{
				model.addAttribute("message", "Vui lòng nhập tên truyện");
			}
			else if(tacgia.trim().length()==0)
			{
				model.addAttribute("message", "Vui lòng nhập tác giả");
			}
			else if(tomtat.trim().length()==0)
			{
				model.addAttribute("message", "Vui lòng nhập tóm tắt");
			}
			else if(anh.isEmpty())
			{
				model.addAttribute("message", "Vui lòng chọn file");
			}else if(anh.getContentType().equals("image/jpeg")||anh.getContentType().equals("image/png"))
			{
				try{
					String photoPath = context.getRealPath("/resource/images/"+anh.getOriginalFilename());
					anh.transferTo(new File(photoPath));
					b="/resource/images/"+anh.getOriginalFilename();
				}
				catch(Exception ex){
					
					model.addAttribute("message",ex);
				}
				Session session2 = factory.getCurrentSession();
				String hql = "FROM Truyen t WHERE t.Matruyen='"+matruyen+"'";
				Query query = session2.createQuery(hql);
				List<Truyen> list = query.list();
				int count = 0;
				for(Truyen u : list){
					count++;
				}
				if(count ==1)
				{
				
					model.addAttribute("message", "Mã truyện đã tồn tại");
				}else{
					Session session = factory.openSession();
					
					Truyen tt = new Truyen();
					Theloai theloai = (Theloai) session.get(Theloai.class, maloai);
//					Truyen t = (Truyen) session.get(Truyen.class, matruyen);
//					tt.setMaloai(maloai);
					tt.setTheloai(theloai);
					tt.setMatruyen(matruyen);
					tt.setTentruyen(tentruyen);
					tt.setTacgia(tacgia);
					tt.setTinhtrang(tinhtrang);
					tt.setTomtat(tomtat);
					tt.setAnh(b);
					Transaction t =session.beginTransaction();
					try{
						session.save(tt);
						t.commit();
						
						return "redirect:/admin/truyen/dstruyen.htm";
					}
					catch(Exception e){
						t.rollback();
						model.addAttribute("message", "Thêm mới thất bại!");
					}
					finally{
						session.close();
					}
				}
			}
			else{
				model.addAttribute("message", "File không hợp lệ");
			}
			model.addAttribute("maTruyen", matruyen);
			model.addAttribute("tenTruyen", tentruyen);
			model.addAttribute("tacGia", tacgia);
			model.addAttribute("tomTat", tomtat);
			return "admin/truyen/insert";
		}
		return "error";
	}

//	 ____________________________________________________________DELETE______________________________________________________
	@RequestMapping(value = "admin/truyen/delete/{matruyen}", method = RequestMethod.GET)
	public String delete(ModelMap model, @PathVariable String matruyen) {
		if(admin.getAdmin2().equals("true")){
			Session session = factory.getCurrentSession();
			try {
				Truyen t = (Truyen) session.get(Truyen.class, matruyen);
				session.delete(t);
				session.flush();
			}catch(Exception e) {
				e.printStackTrace();
			}
			return "redirect:/admin/truyen/dstruyen.htm";
		}
		return "error";
	}
	
	String maLoai = "";
	Theloai theLoai = new Theloai();
	String sAnh = "";
//	_________________________________________________________________UPDATE_____________________________________________
	@RequestMapping(value="/admin/truyen/update1/{matruyen1}")
	public String update(ModelMap model,@ModelAttribute("truyen")Truyen truyen,
						@PathVariable("matruyen1") String matruyen,
						BindingResult error)
	{
		if(admin.getAdmin2().equals("true")){
			if(truyen.getTentruyen().trim().length()==0)
			{
				error.rejectValue("tentruyen", "truyen", "Vui lòng nhập tên truyện");
			}
			else if(truyen.getTacgia().trim().length()==0)
			{
				error.rejectValue("tacgia", "truyen", "Vui lòng nhập tac gia");
			}
			else if(truyen.getTomtat().trim().length()==0)
			{
				error.rejectValue("tomtat", "truyen", "Vui lòng nhập tóm tắt");
			}
			else{
				Session session = factory.openSession();
				truyen.setAnh(sAnh);
				truyen.setMatruyen(matruyen);
//				Theloai theloai = (Theloai) session.get(Theloai.class, maLoai);
				truyen.setTheloai(theLoai);
				Transaction t =session.beginTransaction();
				try{
					session.update(truyen);
					t.commit();
					return "redirect:/admin/truyen/dstruyen.htm";
				}
				catch(Exception e){
					t.rollback();
					model.addAttribute("message", "Thêm mới thất bại!");
				}
				finally{
					session.close();
				}
			}
			return "admin/truyen/update";
		}
		return "error";
	}
	
	@RequestMapping("/admin/truyen/update/{matruyen}")
	public String edit(ModelMap model,@PathVariable("matruyen") String matruyen) 
	{
		if(admin.getAdmin2().equals("true")){
			Session session = factory.openSession();
			Truyen truyen = (Truyen) session.get(Truyen.class, matruyen);
			
			model.addAttribute("matruyen1", matruyen);
			model.addAttribute("truyen", truyen);
			theLoai = (Theloai) session.get(Theloai.class, truyen.getTheloai().getMaloai());
//			theLoai.setMaloai(truyen.getTheloai().getMaloai());
//			theLoai.setTenloai(truyen.getTheloai().getTenloai());
//			maLoai = truyen.getTheloai().getMaloai();
			model.addAttribute("anh", truyen.getAnh());
			sAnh = truyen.getAnh();
			return "admin/truyen/update";
		}
		return "error";
	}
	@RequestMapping(value="/xemanh/{matruyen}")
	public String xemanh(Model model,@PathVariable String matruyen){
		if(admin.getAdmin2().equals("true")){
			Session session = factory.openSession();
			Truyen tt = (Truyen) session.get(Truyen.class, matruyen);
			model.addAttribute("anh", tt.getAnh());
			model.addAttribute("matruyen", matruyen);
			return "admin/truyen/xemanh";
		}
		return "error";
	}
	@RequestMapping(value="/themanhtruyen/{matruyen}",method=RequestMethod.POST)
	public String themanhtruyen(Model model,
			@PathVariable String matruyen,
			@RequestParam("anh") MultipartFile anh)
	{
		if(admin.getAdmin2().equals("true")){
			Session session = factory.openSession();
			Truyen tt = (Truyen) session.get(Truyen.class, matruyen);
			String b="";
			try{
				String photoPath = context.getRealPath("/resource/images/"+anh.getOriginalFilename());
				anh.transferTo(new File(photoPath));
				b="/resource/images/"+anh.getOriginalFilename();
			}
			catch(Exception ex){
				
				model.addAttribute("message",ex);
			}
//			System.out.println("tên"+anh.getOriginalFilename());
			if(anh.getOriginalFilename().equals("")){
				return "redirect:/admin/truyen/dstruyen.htm";
			}else{
				tt.setAnh(b);
				Transaction t =session.beginTransaction();
				try{
					session.update(tt);
					t.commit();
					return "redirect:/admin/truyen/dstruyen.htm";
				}
				catch(Exception e){
					t.rollback();
					model.addAttribute("message", "Thêm mới thất bại!");
				}
				finally{
					session.close();
				}
			}
			return "admin/truyen/them";
		}
		return "error";
	}
	String matruyentranh = "";
//	 _________________________________________________QUẢN LÝ TỪNG TRUYỆN_________________________________________
	@RequestMapping("/admin/taptt/{matruyen}")
	public String taptruyen(ModelMap model,@PathVariable String matruyen) {
		if(admin.getAdmin2().equals("true")){
			Session session = factory.getCurrentSession();
			String hql = "FROM TapTT WHERE truyen.Matruyen='"+matruyen+"'";
			Query query = session.createQuery(hql);
			List<TapTT> list = query.list();
			model.addAttribute("taptt", list);
			model.addAttribute("matruyen", matruyen);
			matruyentranh = matruyen;
			model.addAttribute("matruyentranh", matruyentranh);
			return "admin/taptt/dstaptt";
		}
		return "error";
	}
	@ModelAttribute("matruyen")
	public ModelMap c(ModelMap model)
	{
		model.addAttribute("matruyentranh", matruyentranh);
		return model;
	}
//	__________________________________________________________INSERT TẬP____________________________________________________
	TapTT taptruyen = new TapTT();
	String mataptruyen;
	@RequestMapping(value="/admin/taptt/insert/{matruyen}",method=RequestMethod.GET)
	public String insertTap(ModelMap model,@PathVariable("matruyen") String matruyen)
	{
		if(admin.getAdmin2().equals("true")){
			model.addAttribute("matruyen", matruyen);
			model.addAttribute("taptt", new TapTT());
			return "admin/taptt/insert";
		}
		return "error";
	}
	@RequestMapping("/chonanhtap/{matruyen}")
	public String chonanhtap(ModelMap model, @ModelAttribute("taptt")TapTT taptt,
			@PathVariable("matruyen") String maTT
			,BindingResult error)
	{
		if(admin.getAdmin2().equals("true")){
			if(taptt.getTap()==0){
				model.addAttribute("matruyen", maTT);
				model.addAttribute("taptt", taptt);
				error.rejectValue("tap", "taptt", "vui vòng nhập tập");
			}else if(taptt.getTentapTT().trim().length()==0){
				model.addAttribute("matruyen", maTT);
				model.addAttribute("taptt", taptt);
				error.rejectValue("tentapTT", "taptt", "vui lòng nhập tên tập");
	
			}else if(taptt.getTap()<0 || taptt.getTap()>100){
				model.addAttribute("matruyen", maTT);
				model.addAttribute("taptt", taptt);
				error.rejectValue("tap", "taptt", "Tập không phải số, xin kiểm tra lại");
			}else{
				Session session = factory.openSession();
				Truyen truyen = (Truyen) session.get(Truyen.class, maTT);
				int tap = taptt.getTap();
				String tentap=taptt.getTentapTT();
				String stap =Integer.toString(tap); 
				String matap=maTT+stap;
				String hql = "FROM TapTT t WHERE t.Matap='"+matap+"'";
				Query query = session.createQuery(hql);
				List<TapTT> list = query.list();
				int count = 0;
				for(TapTT u : list){
					count++;
				}
				if(count ==1)
				{
					model.addAttribute("matruyen", maTT);
					model.addAttribute("taptt", taptt);
					error.rejectValue("tap", "taptt", "Tập đã tồn tại");
				}else{
					
					mataptruyen=maTT;
					taptruyen.setTap(tap);
					taptruyen.setMatap(matap);
					taptruyen.setTentapTT(tentap);
					taptruyen.setTruyen(truyen);
					Transaction t =session.beginTransaction();
					try{
						session.save(taptruyen);
						t.commit();
						return "redirect:/admin/taptt/"+maTT+".htm";
					}
					catch(Exception e){
						t.rollback();
						model.addAttribute("message", "Thêm mới thất bại! "+e);
					}
					finally{
						session.close();
					}
				}
			}
			return "admin/taptt/insert";
		}
		return "error";
	}
	
//	@RequestMapping(value="/save/{matruyen}")
//	public String save(ModelMap model,@ModelAttribute("taptt")TapTT taptt,@PathVariable("matruyen") String maTT)
//	{
//		if(admin.getAdmin2().equals("true")){
//			
//			Session session = factory.openSession();
//			Transaction t =session.beginTransaction();
//			session.save(taptruyen);
//			t.commit();
//			return "redirect:/admin/taptt/"+mataptruyen+".htm";
//		}
//		return "error";
//	}
//	 ____________________________________________________________DELETE TẬP______________________________________________________
	@RequestMapping(value = "delete/{matap}/{truyen.getMatruyen()}", method = RequestMethod.GET)
	public String deleteTap(ModelMap model, @PathVariable("matap") String matap, @PathVariable("truyen.getMatruyen()") String matruyen) {
		if(admin.getAdmin2().equals("true")){
			Session session = factory.getCurrentSession();
			try {
				TapTT t = (TapTT) session.get(TapTT.class, matap);
				String ma = t.getTruyen().getMatruyen();
				session.delete(t);
				session.flush();
			}catch(Exception e) {
				e.printStackTrace();
			}
			String s= "redirect:/admin/taptt/"+matruyen;
			return s;
		}
		return "error";
	}
//	______________________________________________________________UPDATE SỬA_____________________________________________
	@RequestMapping(value="/update/{matruyen}")
	public String updateTap(ModelMap model,@ModelAttribute("taptt")TapTT taptt,
			@PathVariable("matruyen") String matruyen
			,BindingResult error)
	{
		if(admin.getAdmin2().equals("true")){
			if(taptt.getTentapTT().trim().length()==0){
				model.addAttribute("matruyen", matruyen);
				model.addAttribute("taptt", taptt);
				error.rejectValue("tentapTT", "taptt", "vui lòng nhập tên tập");

			}else{
//				String stap =Integer.toString(taptt.getTap()); 
//				String matap=matruyen+stap;
//				Session session2 = factory.openSession();
//				String hql = "FROM TapTT t WHERE t.Matap='"+matap+"'";
//				Query query = session2.createQuery(hql);
//				List<TapTT> list = query.list();
//				session2.close();
//				int count = 0;
//				for(TapTT u : list){
//					count++;
//				}
//				if(count ==0 || taptruyen.getMatap().equals(matap))
//				{
				
				Session session = factory.openSession();
				Transaction t =session.beginTransaction();
				Truyen truyen = (Truyen) session.get(Truyen.class, matruyen);
				taptt.setMatap(taptruyen.getMatap());
				taptt.setTap(taptruyen.getTap());
				System.out.println(taptt.getMatap());
				taptt.setTruyen(truyen);
				try{
					session.update(taptt);
					t.commit();
					return "redirect:/admin/taptt/"+matruyen+".htm";
				}
				catch(Exception e){
					t.rollback();
					model.addAttribute("message", "Thêm mới thất bại!");
				}
				finally{
					session.close();
				}
			}
			return "admin/taptt/update";
		}
		return "error";
	}
	
	@RequestMapping("/update/{matap}/{truyen.getMatruyen()}")
	public String editTap(ModelMap model,
			@PathVariable("matap") String matap,
			@PathVariable("truyen.getMatruyen()") String matruyen) 
	{
		if(admin.getAdmin2().equals("true")){
			Session session = factory.openSession();
			TapTT taptt = (TapTT) session.get(TapTT.class, matap);
			taptruyen = taptt;
			matruyen = matruyen.trim();
			model.addAttribute("matruyen", matruyentranh);
			model.addAttribute("taptt", taptt);
			
			return "admin/taptt/update";
		}
		return "error";
		
	}
//	_______________________________________________ẢNH________________________________________________________________________
	
	@RequestMapping("showanhtap/{matap}")
	public String showanhtap(Model model, @PathVariable("matap") String matap)
	{
		if(admin.getAdmin2().equals("true")){
			matap = matap.trim();
			Session session = factory.getCurrentSession();
			String hql = "FROM Anh WHERE taptt.Matap='"+matap+"'";
			Query query = session.createQuery(hql);
			List<Truyen> list = query.list();
			model.addAttribute("anh", list);
			model.addAttribute("matap", matap);
			return "admin/taptt/anh";
		}
		return "error";
	}
//	______________________________________________Thêm_____________________________________________________________________
	Anh anhtap = new Anh();
	String matap;
	@RequestMapping(value="/insert/anh/{matap}",method=RequestMethod.GET)
	public String insertanh(ModelMap model,@PathVariable("matap") String matap)
	{
		if(admin.getAdmin2().equals("true")){
			model.addAttribute("matap", matap);
			return "admin/taptt/insertanh";
		}
		return "error";
	}
	@RequestMapping("/insertanh/{matap}")
	public String insertanhtap(ModelMap model
			,@PathVariable("matap") String matap
			,@RequestParam("tenanh") MultipartFile tenanh
			,@RequestParam("maanh") String maanh)
	{
		if(admin.getAdmin2().equals("true")){
			String ma = maanh;
			if(matap.trim().length()==0)
			{
				model.addAttribute("message", "Vui lòng nhập mã ảnh");
			}else if(tenanh.isEmpty()){
				model.addAttribute("message", "Vui lòng chọn file");
			}
			else if(tenanh.getContentType().equals("image/jpeg")||tenanh.getContentType().equals("image/png"))
			{
				String b="";
				try{
					String photoPath = context.getRealPath("/resource/images/"+tenanh.getOriginalFilename());
					tenanh.transferTo(new File(photoPath));
					b="/resource/images/"+tenanh.getOriginalFilename();
				}
				catch(Exception ex){
					
					model.addAttribute("message",ex);
				}
				Session session = factory.openSession();
				TapTT tap = (TapTT) session.get(TapTT.class, matap);
				anhtap.setTaptt(tap);
				anhtap.setTenAnh(b);
				int dem = maanh.length();
				if(dem ==1){
					maanh = matap+"00"+maanh;
				}else if(dem==2){
					maanh = matap+"0"+maanh;
					
				}else{
					maanh = matap+maanh;
				}
				anhtap.setMaAnh(maanh);
				String hql = "FROM Anh a WHERE a.MaAnh='"+maanh+"'";
				Query query = session.createQuery(hql);
				List<Anh> list = query.list();
				int count = 0;
				for(Anh u : list){
					count++;
				}
				if(count ==1)
				{
					model.addAttribute("message", "Mã ảnh đã tồn tại");
				}else{
				
					Transaction t =session.beginTransaction();
					try{
						session.save(anhtap);
						t.commit();
						return "redirect:/showanhtap/"+matap+".htm";
					}
					catch(Exception e){
						t.rollback();
						model.addAttribute("message", "Mã ảnh đã trùng");
					}
					finally{
						session.close();
					}
				}
			}else{
				model.addAttribute("message", "File không hợp lệ");
			}
			model.addAttribute("maAnh", ma);
			model.addAttribute("matap", matap);
			return "admin/taptt/insertanh";
		}
		return "error";
	}
//	_____________________________________________________________Xóa ảnh____________________________________________________
	@RequestMapping(value = "xoaanh/{matap}/{maAnh}")
	public String deleteanh(ModelMap model, @PathVariable("maAnh") String maAnh,@PathVariable("matap") String matap)
	{
		if(admin.getAdmin2().equals("true")){
			Session session = factory.getCurrentSession();	
			try {
				Anh a = (Anh) session.get(Anh.class, maAnh);
				session.delete(a);
				session.flush();
			}catch(Exception e) {
				e.printStackTrace();
			}
			String s= "redirect:/showanhtap/"+matap+".htm";
			return s;
		}
		return "error";
	}
//	_________________________________________________Thay ẢNH tập___________________________________________________________
	@RequestMapping("/chinhsuaanh/{matap}/{maAnh}")
	public String updateanh(ModelMap model,
			@PathVariable("matap") String matap,
			@PathVariable("maAnh") String maanh
			) 
	{
		if(admin.getAdmin2().equals("true")){
			Session session = factory.openSession();
			maanh=maanh.trim();
			Anh a = (Anh) session.get(Anh.class, maanh);
			model.addAttribute("matap", matap);
			model.addAttribute("maanh", maanh);
			model.addAttribute("tenanh", a.getTenAnh());
			return "admin/taptt/updateanh";
		}
		return "error";
		
	}
	@RequestMapping(value="/updateanh/{matap}/{maanh}")
	public String updateanh2(ModelMap model,
			@PathVariable("matap") String matap,
			@PathVariable("maanh") String maanh,
			@RequestParam("tenanh") MultipartFile tenanh)
	{
		if(admin.getAdmin2().equals("true")){
			String b="";
			try{
				String photoPath = context.getRealPath("/resource/images/"+tenanh.getOriginalFilename());
				tenanh.transferTo(new File(photoPath));
				b="/resource/images/"+tenanh.getOriginalFilename();
			}
			catch(Exception ex){
				
				model.addAttribute("message",ex);
			}
			Session session = factory.openSession();
			Transaction t =session.beginTransaction();
			Anh a = (Anh) session.get(Anh.class, maanh);
			if(tenanh.getOriginalFilename().equals("")){
				a.getTenAnh();
			}else{
				a.setTenAnh(b);
			}
			try{
				session.update(a);
				t.commit();
				return "redirect:/showanhtap/"+matap+".htm";
			}
			catch(Exception e){
				t.rollback();
				model.addAttribute("message", "Thêm mới thất bại!");
			}
			finally{
				session.close();
			}
			
		}
		return "error";
	}
}
