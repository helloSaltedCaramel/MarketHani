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
		
		String username = UserDAO.getInstance().loginCheck(dto);
		
		ActionForward forward = new ActionForward();
		
		if(username != null) {
			HttpSession session = request.getSession();
			
			session.setAttribute("user_id", request.getParameter("id"));
			session.setAttribute("user_name", username);
			
			forward.setRedirect(true);
			forward.setPath(request.getContextPath() + "/main.jsp");
		} else {
			forward.setRedirect(true);
			forward.setPath(request.getContextPath() + "/user/user_login.jsp?notFound=true");
		}
		
		
		return forward;
	}

}
