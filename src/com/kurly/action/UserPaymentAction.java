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
import com.kurly.model.OrderDAO;
import com.kurly.model.PriceSumDTO;

public class UserPaymentAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		

		HttpSession session = request.getSession();
		
		if(session.getAttribute("user_id") == null) {
			ActionForward forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath(request.getContextPath() + "/user/user_login.jsp");
			return forward;
		}
		
		// cart에 있는 데이터 insert all로 order Detail에 컬럼 추가
		String user_id = (String)session.getAttribute("user_id");
		
		List<CartDataDTO> cartList = CartDataDAO.getInstance().loadCartData(user_id);
		
		PriceSumDTO priceData = CartDataDAO.getInstance().getSumPrice(user_id);
		
		int deliveryFee = priceData.getSaleSum() < 30000 ? 3000 : 0;
		
		int order_id = OrderDAO.getInstance().insertOrder(user_id,
																request.getParameter("receiver"),
																request.getParameter("user_address"),
																request.getParameter("receiver_message"),
																request.getParameter("receiver_phone"),
																0,
																priceData.getPointSum(),
																request.getParameter("payment_way"),
																priceData.getSaleSum(),
																deliveryFee);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("user/user_ordered.jsp");
		return forward;
	}

}	
