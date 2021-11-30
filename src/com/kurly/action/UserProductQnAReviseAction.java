package com.kurly.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kurly.controller.Action;
import com.kurly.controller.ActionForward;
import com.kurly.model.QnADAO;
import com.kurly.model.QnADTO;

public class UserProductQnAReviseAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		//QnA 글 수정 내용을 QnADTO 객체에 저장하기
		int qna_num = Integer.parseInt(request.getParameter("qna_num"));
		String qna_title = request.getParameter("qna_title");
		String qna_content = request.getParameter("qna_content");
		
		QnADTO dto = new QnADTO(); 
		dto.setQna_num(qna_num);
		dto.setQna_title(qna_title);
		dto.setQna_content(qna_content);
		
		//QnA 글 수정 메서드 호출
		QnADAO dao = QnADAO.getInstance();
		int res = dao.reviseQnA(dto);
		
		//한글깨짐방지
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		ActionForward forward = new ActionForward();
		
		//게시글 수정 결과값 포워드하기
		request.setAttribute("res", res);
		
		//페이지 넘어감 방지
		out.println("<script>");
		out.println("history.back()");
		out.println("</script>");	
		
		return forward;
	}

}
