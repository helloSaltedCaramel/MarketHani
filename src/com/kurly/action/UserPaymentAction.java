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
		
		
		// order 테이블에 데이터 맞도록 해서 추가하기
		
		// 
		
		return null;
	}

}	
