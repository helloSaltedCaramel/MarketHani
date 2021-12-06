package com.kurly.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kurly.controller.Action;
import com.kurly.controller.ActionForward;
import com.kurly.model.ProductDAO;
import com.kurly.model.ProductDTO;
import com.kurly.model.QnADAO;
import com.kurly.model.QnADTO;

public class UserProductViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		//상품번호에 해당하는 상세정보 및 QnA DTO를 각각 받아 넘겨주는 비지니스 로직 
		//상품번호 받아오기
		int p_num = Integer.parseInt(request.getParameter("p_num").trim());
		
		
		//번호에 해당하는 ProductDTO 받아오기
		ProductDAO p_dao = ProductDAO.getInstance();
		ProductDTO dto = p_dao.productCont(p_num);
		
		//attribute 설정
		request.setAttribute("productCont", dto);
		
		//forward
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		forward.setPath("user/user_product_detail.jsp");
		
		return forward;
	}

}
