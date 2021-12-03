package com.kurly.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kurly.controller.Action;
import com.kurly.controller.ActionForward;
import com.kurly.model.OrderDAO;
import com.kurly.model.OrderHistoryDTO;

public class UserOrderHistoryAction implements Action{

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
		
		List<OrderHistoryDTO> list = OrderDAO.getInstance().loadOrderHistory(user_id);
		
		request.setAttribute("orderHistory", list);
		
		ActionForward forward = new ActionForward();
		forward.setPath("user/user_mypage_orderlist.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
