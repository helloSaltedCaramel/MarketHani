package com.kurly.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kurly.controller.Action;
import com.kurly.controller.ActionForward;
import com.kurly.model.QnADAO;

public class UserProductQnADeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int qna_num = Integer.parseInt(request.getParameter("qna_num"));
		
		QnADAO dao = QnADAO.getInstance();
		int res = dao.deleteQnA(qna_num);
		
		//한글깨짐방지
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		ActionForward forward = new ActionForward();
		
		//게시글 삭제 결과값 포워드하기
		request.setAttribute("res", res);
		
		//페이지 넘어감 방지
		out.println("<script>");
		out.println("history.back()");
		out.println("</script>");	
		
		return forward;
		
	}

}
