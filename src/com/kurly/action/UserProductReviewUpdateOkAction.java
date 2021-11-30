package com.kurly.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kurly.controller.Action;
import com.kurly.controller.ActionForward;
import com.kurly.model.ReviewDAO;
import com.kurly.model.ReviewDTO;

public class UserProductReviewUpdateOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 수정 폼 페이지에서 넘어온 데이터들을 DB에 전송하여 
		// 게시글을 수정하는 비지니스 로직
		
		ReviewDTO dto = new ReviewDTO();

		// 첨부파일이 저장될 경로(위치)
		String saveFolder = "C:\\Users\\amorf\\git\\MarketHani\\WebContent\\upload";

		// 첨부파일 최대 크기
		int fileSize = 10 * 1024 * 1024; // 10MB

		// 파일 업로드 진행시 이전 파일 업로드를 위한 객체 생성
		MultipartRequest multi = new MultipartRequest(request, saveFolder, fileSize, "UTF-8",
				new DefaultFileRenamePolicy());

		// 자료실 수정 폼 페이지에서 넘어온 데이터들을 받아 주자.
		
		
		String user_id = request.getParameter("user_id").trim();
		
		String r_title = request.getParameter("r_title").trim();
		
		String r_content = request.getParameter("r_content").trim();
		
		String r_image = request.getParameter("r_image").trim();
		
		
		
		// 히든으로 넘어온 데이터들도 받아주어야 한다.
		
		int r_num = Integer.parseInt(request.getParameter("r_num").trim());
		
		int nowPage = Integer.parseInt(request.getParameter("page").trim());
		
		ReviewDTO dto = new ReviewDTO();
		
		dto.setP_num(r_num);
		dto.setUser_id(user_id);
		dto.setR_title(r_title);
		dto.setR_content(r_content);
		dto.setR_image(r_image);
		
		ReviewDAO dao = ReviewDAO.getInstance();
		
		int res = dao.reviewUpdate(dto);
		
		PrintWriter out = response.getWriter();
		
		if(res > 0 ) {
			out.println("<script>");
			out.println("alert('게시물 수정 성공 :)')");
			out.println("location.href='board_content.do?no="+dto.getR_num()+"&page="+nowPage+"'");
			out.println("</script>");
	
		} else if(res == -1) {
			out.println("<script>");
			out.println("alert('아이디가 다름니다. 확인해 주세요)')");
			out.println("history.back()");
			out.println("</script>");
		} else  {
			out.println("<script>");
			out.println("alert('게시물 수정 실패 :(')");
			out.println("history.back()");
			out.println("</script>");
		
		
		
		
		
		
		
		
		return null;
	}

	}
}
