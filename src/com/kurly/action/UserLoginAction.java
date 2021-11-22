package com.kurly.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kurly.controller.Action;
import com.kurly.controller.ActionForward;
import com.kurly.model.LoginDTO;
import com.kurly.model.UserDAO;

public class UserLoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		LoginDTO dto = new LoginDTO(request.getParameter("id"), request.getParameter("pw"));
		
		boolean result = UserDAO.getInstance().loginCheck(dto);
		
		ActionForward forward = new ActionForward();
		
		if(result) {
			HttpSession session = request.getSession();
			
			session.setAttribute("user_id", request.getParameter("id"));
		} else {
			PrintWriter writer = response.getWriter();
			
			writer.println("<script>");
			writer.println("alert('아이디와 비밀번호가 일치하지 않습니다.)");
			writer.println("history.back()");
			writer.println("</script>");
		}
		
		
		return null;
	}

}
