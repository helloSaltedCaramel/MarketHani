package com.kurly.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kurly.controller.Action;
import com.kurly.controller.ActionForward;
import com.kurly.model.ProductDAO;
import com.kurly.model.ProductDTO;

public class UserNewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		//전달된 정렬방식(sortby)을 적용하여 제품 리스트 받아오기 
		String sortby = request.getParameter("sort");
		
		List<ProductDTO> list = ProductDAO.getInstance().getNewProductList(sortby);
		
		//제품 리스트 및 수량 전달
		request.setAttribute("productList", list);
		request.setAttribute("listCount", list.size());
	
		//제품 정렬방식 전달
		request.setAttribute("sortBy", sortby);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		forward.setPath("/user/user_new.jsp");
		
		return forward;
	}

}
