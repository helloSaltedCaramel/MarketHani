package com.kurly.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kurly.controller.Action;
import com.kurly.controller.ActionForward;

public class UserLogoutAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		HttpSession session = request.getSession();
		
		session.invalidate();	// 세션 만료
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(true);
		forward.setPath(request.getContextPath() + "/main.jsp");
		
		return forward;
	}
	
}
