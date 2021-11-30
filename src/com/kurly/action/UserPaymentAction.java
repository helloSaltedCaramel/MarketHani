package com.kurly.action;

import java.io.IOException;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kurly.controller.Action;
import com.kurly.controller.ActionForward;
import com.kurly.model.CartDAO;
import com.kurly.model.CartDataDAO;
import com.kurly.model.CartDataDTO;
import com.kurly.model.OrderDAO;
import com.kurly.model.OrderDetailDAO;
import com.kurly.model.PriceSumDTO;
import com.kurly.model.UserDAO;

/**
 * UserPaymentAction 로직 진행순서
 * 0. 세션에서 user_id 가져오기, 만료되었을 시 로그인 창으로 이동
 * 1. kurly_cart 테이블에서 해당 유저의 장바구니 리스트 가져오기
 * 2. kurly_cart 테이블에서 해당 유저의 장바구니 리스트의 총합 가격, 할인 가격, 포인트 가격 가져오기
 * 3. 배송비 가져오기, 주문하기에서 사용한 적립금 가져오기
 * 4. request.getParameter로 제출한 데이터를 가져와서 kurly_order 테이블에 주문데이터 추가하기
 * 5. 4에서 입력한 주문번호를 가져와서 kurly_order_detail에 주문했던 제품들 추가
 * 6. 주문한 회원의 포인트 업데이트
 * 7. 주문한 회원의 장바구니 리스트 없애기
 * 8. 주문완료 페이지로 이동
 * @author HOIT
 *
 */
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
		

		String user_id = (String)session.getAttribute("user_id");
		
		List<CartDataDTO> cartList = CartDataDAO.getInstance().loadCartData(user_id);
		
		PriceSumDTO priceData = CartDataDAO.getInstance().getSumPrice(user_id);
		
		int deliveryFee = priceData.getSaleSum() < 30000 ? 3000 : 0;
		int user_point = Integer.parseInt(request.getParameter("used_point"));
		
		// order 테이블 데이터 추가
		int order_id = OrderDAO.getInstance().insertOrder(user_id,
															request.getParameter("receiver"),
															request.getParameter("user_address"),
															request.getParameter("receiver_message"),
															request.getParameter("receiver_phone"),
															user_point,
															priceData.getPointSum(),
															request.getParameter("payment_way"),
															priceData.getSaleSum(),
															deliveryFee);
		
		OrderDetailDAO.getInstance().insertOrderDetail(order_id, cartList);
		
		UserDAO.getInstance().updateUserPoint(priceData.getPointSum() - user_point, user_id);
		
		CartDAO.getInstance().deleteCartList(user_id);
		
		int paymentBalance = priceData.getSaleSum() + deliveryFee - user_point;
		
		request.setAttribute("point", priceData.getPointSum());
		request.setAttribute("paymentBalance", paymentBalance);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("user/user_ordered.jsp");
		return forward;
	}

}	
