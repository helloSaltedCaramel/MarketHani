package com.kurly.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kurly.controller.Action;
import com.kurly.controller.ActionForward;
import com.kurly.model.CartDataDAO;
import com.kurly.model.UserDAO;

public class UserOrderAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("user_id") == null) {
			ActionForward forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath(request.getContextPath() + "/user/user_login.jsp");
			return forward;
		}
		
		String user_id = (String)session.getAttribute("user_id");
		CartDataDAO cdi = CartDataDAO.getInstance();
		
		request.setAttribute("userDTO", UserDAO.getInstance().getUserData(user_id));
		request.setAttribute("cartList", cdi.loadCartData(user_id));
		request.setAttribute("priceDTO", cdi.getSumPrice(user_id));
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/user/user_order.jsp");
		return forward;
	}
}
