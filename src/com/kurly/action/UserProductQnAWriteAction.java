package com.kurly.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kurly.controller.Action;
import com.kurly.controller.ActionForward;
import com.kurly.model.QnADAO;
import com.kurly.model.QnADTO;

public class UserProductQnAWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		
		QnADTO dto = new QnADTO();

		String user_id = request.getParameter("user_id");
		String qna_title = request.getParameter("qna_title");
		String qna_content = request.getParameter("qna_content");
		int p_num = Integer.parseInt(request.getParameter("p_num"));
		
		//비밀글 여부 지정
		int qna_secret = -1;
		
		if(request.getParameter("is_secret") != null)
			qna_secret = 1;
		else
			qna_secret = 0;
		
		System.out.println("is_secret >>> " + request.getParameter("is_secret"));
		
		dto.setUser_id(user_id);
		dto.setQna_title(qna_title);
		dto.setQna_content(qna_content);
		dto.setQna_secret(qna_secret);
		dto.setP_num(p_num);
	
		//writeQnA 메서드 호출 : QnA게시판 글쓰기
		QnADAO dao = QnADAO.getInstance();
	
		int res = dao.writeQnA(dto);
		
		//한글깨짐방지
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		ActionForward forward = new ActionForward();
		
		//게시글 작성 DB삽입  결과값 포워드하기
		request.setAttribute("res", res);
		
		//페이지 넘어감 방지
		out.println("<script>");
		out.println("history.back()");
		out.println("</script>");	
		
		return forward;
	}

}
