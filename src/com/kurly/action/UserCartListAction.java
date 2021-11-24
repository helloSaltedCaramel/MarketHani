package com.kurly.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kurly.controller.Action;
import com.kurly.controller.ActionForward;
import com.kurly.model.CartDataDAO;
import com.kurly.model.CartDataDTO;

public class UserCartListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		HttpSession session = request.getSession();
		
		// 비회원일 시 login 페이지로 redirect
		if(session.getAttribute("user_id") == null) {
			ActionForward forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath(request.getContextPath() + "/user/user_login.jsp");
			return forward;
		}
		
		List<CartDataDTO> list = CartDataDAO.getInstance().loadCartData((String)session.getAttribute("user_id"));
		
		int costSum = list.stream()
							.mapToInt(dto -> dto.getP_price() * dto.getCart_qty())						
							.sum();
							
		int saleSum = list.stream()
							.mapToInt(dto -> dto.getSalePrice() * dto.getCart_qty())
							.sum();
		
		request.setAttribute("cartList", list);
		request.setAttribute("costSum", costSum);
		request.setAttribute("saleSum", saleSum);

		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/user/user_cart.jsp");
		return forward;
	}

}
