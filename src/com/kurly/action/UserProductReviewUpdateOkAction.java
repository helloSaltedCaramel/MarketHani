package com.kurly.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kurly.controller.Action;
import com.kurly.controller.ActionForward;
import com.kurly.model.ReviewDAO;
import com.kurly.model.ReviewDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class UserProductReviewUpdateOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 수정 폼 페이지에서 넘어온 데이터들을 DB에 전송하여 
		// 게시글을 수정하는 비지니스 로직
		
		ReviewDTO dto = new ReviewDTO();

		// 첨부파일이 저장될 경로(위치)
		String saveFolder = "C:\\Users\\ahn28\\git\\MarketHani\\WebContent\\upload";

		// 첨부파일 최대 크기
		int fileSize = 10 * 1024 * 1024; // 10MB

		// 파일 업로드 진행시 이전 파일 업로드를 위한 객체 생성
		MultipartRequest multi = new MultipartRequest(
				request, 
				saveFolder, 
				fileSize, 
				"UTF-8",
				new DefaultFileRenamePolicy()
				);

		// 자료실 수정 폼 페이지에서 넘어온 데이터들을 받아 주자.
		
		
		String user_id = multi.getParameter("user_id").trim();
		
		String r_title = multi.getParameter("r_title").trim();
		
		String r_content = multi.getParameter("r_content").trim();
		
		// type="file"로 넘어온 데이터는 getFile() 메서드로 받아주어야 한다.
		File r_image = multi.getFile("r_image");
		
		// 히든으로 넘어온 데이터들도 받아주어야 한다.
		
		int r_num = Integer.parseInt(multi.getParameter("r_num").trim());
		
		/* int nowPage = Integer.parseInt(multi.getParameter("page").trim()); */
		
		if(r_image != null) {
			String fileName = r_image.getName();
			
			Calendar cal = Calendar.getInstance();
			
			int year = cal.get(Calendar.YEAR);
			int month = cal.get(Calendar.MONTH);
			int day = cal.get(Calendar.DAY_OF_MONTH);
			
			//.......//upload/2021-11-05
			String homedir = saveFolder+"/"+year+"-"+month+"-"+day;
			
			// 날짜 폴더를 만들어야 한다.
			File path1 = new File(homedir);
			if(!path1.exists()) {
				path1.mkdir();
				
			}
			// 파일을 만들어 보자.
			// 파일은 "작성자_파일명"
			//....../upload/2021-11-05/작성자_파일명
			String reFileName = user_id+"_" + fileName;
			r_image.renameTo(new File(homedir + "/"+ reFileName));
			
			String fileDBName = 
					"/" +year+"-"+month+"-"+day+"/"+reFileName;
			dto.setR_image(fileDBName);
			
		}
		
		dto.setR_num(r_num);
		dto.setUser_id(user_id);
		dto.setR_title(r_title);
		dto.setR_content(r_content);
	
		ReviewDAO dao = ReviewDAO.getInstance();
		ReviewDTO rdto = dao.getReviewCont(r_num);    // 위에 선언해준 dto 를 이용해서 작성해야하는데 위에 선언한 dto는 깡통으로 아무것도 들어있지 않음 그래서 
													  // 반환형이 ReviewDTO type에 원하는 객체를 반환해옴 
		
		int p_num = rdto.getP_num();
		int res = dao.reviewUpdate(dto);
		
		
		
		ActionForward forward = new ActionForward();
		
		PrintWriter out = response.getWriter();
		
		if(res > 0 ) {
			forward.setRedirect(true);
			forward.setPath("user_product_review_content.do?no=" + r_num + "&p_num=" + p_num);   //자바 변수 이어서주는 방법  ex)no=2 & p_num=82

		} else  {
			out.println("<script>");  
			out.println("alert('게시물 수정 실패 :(')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	

	}
}
