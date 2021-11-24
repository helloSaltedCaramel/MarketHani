package com.kurly.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kurly.controller.Action;
import com.kurly.controller.ActionForward;
import com.kurly.model.CartDataDAO;

public class UserCartListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		HttpSession session = request.getSession();
		
		// 비회원일 시 login 페이지로 redirect
		if(session.getAttribute("user_id") == null) {
			ActionForward forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath(request.getContextPath() + "user/user_login.jsp");
			return forward;
		}
		
		request.setAttribute("list", CartDataDAO.getInstance().loadCartData((String)session.getAttribute("user_id")));
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath(request.getContextPath()  + "user/user_cart.jsp");
		return forward;
	}

}
