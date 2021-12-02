package com.kurly.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kurly.controller.Action;
import com.kurly.controller.ActionForward;
import com.kurly.model.ProductDAO;
import com.kurly.model.ProductDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class AdminProdInsertAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String uploadPath = "C:\\Users\\HOIT\\git\\MarketHani\\WebContent\\upload\\product";
		int size = 10 * 1024 * 1024;
		
		MultipartRequest multi = new MultipartRequest(request, 
													  uploadPath, 
													  size, 
													  "UTF-8", 
													  new DefaultFileRenamePolicy());

		File p_img = multi.getFile("p_img");
		File p_contents = multi.getFile("p_contents");
		File p_contents_spec = multi.getFile("p_contents_spec");
		
		String p_img_name = settingFile(uploadPath, p_img);
		String p_contents_name = settingFile(uploadPath, p_contents);
		String p_contents_spec_name = settingFile(uploadPath, p_contents_spec);
		
		ProductDTO dto = new ProductDTO();
		
		// 서브카테고리, p_date는 DAO에서 기본값으로 추가
		dto.setP_num(Integer.parseInt(multi.getParameter("p_num")));
		dto.setP_category(multi.getParameter("p_category"));
		dto.setP_seller(multi.getParameter("p_seller"));
		dto.setP_name(multi.getParameter("p_name"));
		dto.setP_name_cont(multi.getParameter("p_name_cont"));
		dto.setP_price(Integer.parseInt(multi.getParameter("p_price")));
		dto.setP_discount(Integer.parseInt(multi.getParameter("p_discount")));
		dto.setP_point(Integer.parseInt(multi.getParameter("p_point")));
		dto.setP_unit(multi.getParameter("p_unit"));
		dto.setP_delivery(multi.getParameter("p_delivery"));
		dto.setP_wrap(multi.getParameter("p_wrap"));
		dto.setP_wrap_cont(multi.getParameter("p_wrap_cont"));
		dto.setP_qty(Integer.parseInt(multi.getParameter("p_qty")));
		dto.setP_image(p_img_name);
		dto.setP_contents(p_contents_name);
		dto.setP_contents_spec(p_contents_spec_name);
		
		int result = ProductDAO.getInstance().insertProduct(dto);
		
		PrintWriter writer = response.getWriter();
		if(result > 0) {
			writer.println("<script>");
			writer.println("alert('상품 추가에 실패하였습니다. 로그를 확인해주세요.')");
			writer.println("history.back()");
			writer.println("</script>");
		} else {
			writer.println("<script>");
			writer.println("alert('상품이 추가되었습니다. 신상품에서 확인해주세요.')");
			writer.println("location.href('main.jsp')");
			writer.println("</script>");
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath("admin/admin_main.jsp");
		forward.setRedirect(true);
		
		
		return forward;
	}
	
	private String settingFile(String uploadPath, File file) {
		Calendar cal = Calendar.getInstance();
		
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DAY_OF_MONTH);
		
		String directory = uploadPath+"/"+year+"-"+month+"-"+day;

		File folder = new File(directory);
		
		if(!folder.exists()) {  //폴더가 존재하지 않는 경우
			folder.mkdir();   //실제 폴더 만드는 메서드			
		}
		
		file.renameTo(new File(directory + "/" + file.getName()));
		
		String dbName = "/" + year + "-" + month + "-" + day + "/" + file.getName();
		
		return dbName;
	}
}
