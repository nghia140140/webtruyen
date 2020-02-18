package poly.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import web.bean.Admin;
import web.bean.Noidung;
import web.bean.User;
import web.entity.TaiKhoan;
import web.entity.TapTC;
import web.entity.TapTT;
import web.entity.Theloai;
import web.entity.TheoDoi;
import web.entity.Truyen;

@Transactional
@Controller
public class TruyenController {
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
//	____________________________________________Xuất truyện______________________________________________________________
	@RequestMapping(value="/{matruyen}")
	public String botruyen(ModelMap model, @PathVariable("matruyen") String matruyen) {
		Session session = factory.getCurrentSession();
		String hpl = "FROM Truyen t WHERE t.Matruyen='"+matruyen+"'";
		Query query = session.createQuery(hpl);
		List<Truyen> list = query.list();
		model.addAttribute("truyen", list);
		
		Truyen t = (Truyen)  session.get(Truyen.class, matruyen);
		Theloai tt = t.getTheloai();
		if(tt.getMaloai().equals("TT"))
		{
			Session session2 = factory.getCurrentSession();
			String hql2 = "FROM TapTT t WHERE t.truyen.Matruyen='"+matruyen+"'";
			
			Query query2 = session2.createQuery(hql2);
			List<TapTT> list2 = query2.list();
			model.addAttribute("tap", list2);
		}else{
			Session session2 = factory.getCurrentSession();
			String hql2 = "FROM TapTC t WHERE t.truyen.Matruyen='"+matruyen+"'";
			
			Query query2 = session2.createQuery(hql2);
			List<TapTC> list2 = query2.list();
			model.addAttribute("tap", list2);
		}
		
		Session session3 = factory.getCurrentSession();
		String hql2 = "FROM TheoDoi t WHERE t.truyen.Matruyen='"+matruyen+"'";
		
		Query query2 = session3.createQuery(hql2);
		List<TheoDoi> list2 = query2.list();
		int count = 0;
		for(TheoDoi u : list2){
			count++;
		}
		if(count == 1){
			model.addAttribute("theodoi", "1");
		}else{
			model.addAttribute("theodoi", "0");
		}

		return "botruyen/botruyen";
	}
//	_____________________________________________Theo Dõi_______________________________________________
	@RequestMapping("/theodoi")
	public String xuatTD(ModelMap model) {
		if(admin.getAdmin1().equals("1")){
			Session session = factory.getCurrentSession();
			String hql = "FROM TheoDoi t WHERE t.taikhoan.Taikhoan = '"+taiKhoan.getTaikhoan()+"'";
			Query query = session.createQuery(hql);
			List<TheoDoi> list = query.list();
			model.addAttribute("truyen", list);
			return "theodoi";
		}
		return "error";
	}
//	______________________________________________Thêm Theo doi____________________________________________
	@RequestMapping(value="/theodoi/{matruyen}")
	public String theodoi(ModelMap model,@PathVariable("matruyen") String matruyen)
	{
		if(admin.getAdmin1().equals("1")){
			Session session = factory.getCurrentSession();
			String hpl = "FROM TheoDoi";
			Query query = session.createQuery(hpl);
			List<TheoDoi> list = query.list();
			int count=0;
			for(TheoDoi u : list){
				count++;
			}
			TheoDoi truyen = new TheoDoi();
			String dem = Integer.toString(++count);
			String maTD = matruyen + dem;
			truyen.setMaTD(maTD);
			TaiKhoan tk = (TaiKhoan) session.get(TaiKhoan.class, taiKhoan.getTaikhoan());
			truyen.setTaikhoan(tk);
			Truyen tr = (Truyen)  session.get(Truyen.class, matruyen);
			truyen.setTruyen(tr);
			
			Session session2 = factory.openSession();
			Transaction t =session2.beginTransaction();
			try{
				session2.save(truyen);
				t.commit();
				return "redirect:/"+matruyen+".htm";
	
			}
			catch(Exception e){
				t.rollback();
				model.addAttribute("message", e);
				
			}
			finally{
				session2.close();
			}
			return "redirect:/"+matruyen+".htm";
		}
		return "error";
	}
	@RequestMapping(value="/huytheodoi/{matruyen}")
	public String huytheodoi(ModelMap model,@PathVariable("matruyen") String matruyen)
	{
		if(admin.getAdmin1().equals("1")){
			String matd = "";
			Session session2 = factory.getCurrentSession();
			String hpl = "FROM TheoDoi t WHERE t.truyen.Matruyen = '"+matruyen+"'";
			Query query = session2.createQuery(hpl);
			List<TheoDoi> list = query.list();
			for(TheoDoi u : list){
				matd = u.getMaTD();
			}
			Session session = factory.openSession();
			TheoDoi td =(TheoDoi)session.get(TheoDoi.class, matd);
			
			Transaction t =session.beginTransaction();
			try{
				session.delete(td);;
				t.commit();
				return "redirect:/"+matruyen+".htm";
	
			}
			catch(Exception e){
				t.rollback();
				model.addAttribute("message", e);
				
			}
			finally{
				session.close();
			}
			return "redirect:/"+matruyen+".htm";
		}
		return "error";
	}
	
//	___________________________________________________Xuất tập TT___________________________________________________________
	@RequestMapping("/xem/{matap}")
	public String xemtruyentranh(ModelMap model,@PathVariable("matap") String matap )
	{
		matap = matap.trim();
		Session session = factory.getCurrentSession();
		TapTT t = (TapTT)  session.get(TapTT.class, matap);
		String hpl = "FROM Anh WHERE taptt.Matap='"+matap+"'";
		Query query = session.createQuery(hpl);
		List<TapTT> list = query.list();
		model.addAttribute("anh", list);
		model.addAttribute("tapso", t.getTap());
		return "botruyen/tap";
	}
//	___________________________________________________Xuất tập TC___________________________________________________________

	@RequestMapping("/xemtc/{matap}")
	public String xemtruyenchu(ModelMap model,@PathVariable("matap") String matap )
	{
		matap = matap.trim();
		Session session = factory.getCurrentSession();
		TapTC t = (TapTC)  session.get(TapTC.class, matap);
		String noidung = t.getNoidung();
		File docfile = new File("C:\\Users\\DELL\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp4\\wtpwebapps\\Webtruyen"
				+noidung);
		List<Noidung> list = new ArrayList<>();
		BufferedReader br = null;
        try {   
        	
            br = new BufferedReader(new InputStreamReader(
            		new FileInputStream(docfile), "UTF8"));
            
            String a;
            list = new ArrayList<>();
            while ((a = br.readLine()) != null) {
                Noidung cau =new Noidung(a);
                list.add(cau);
                a = br.readLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                br.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        String tentap = t.getTentapTC();
        int tapthu = t.getTap();
        String c = Integer.toString(t.getTap());
		model.addAttribute("cau", list);
		model.addAttribute("tentap", tentap);
		model.addAttribute("tapthu", c);
		model.addAttribute("matap", matap);
		return "botruyen/taptc";
	}
//	@ModelAttribute("/search")
//	public String search(ModelMap model,
//			@RequestParam("search")String search)
//	{
//		Session session = factory.getCurrentSession();
//		String hpl = "FROM Truyen t WHERE t.Tentruyen='"+search+"'";
//		Query query = session.createQuery(hpl);
//		List<Truyen> list = query.list();
//		model.addAttribute("truyen", list);
//		
//		return "search";
//	}
}