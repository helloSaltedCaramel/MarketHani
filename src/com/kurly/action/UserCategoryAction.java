package com.kurly.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kurly.controller.Action;
import com.kurly.controller.ActionForward;
import com.kurly.model.ProductDAO;
import com.kurly.model.ProductDTO;

public class UserCategoryAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		//카테고리 및 정렬방식 가져오기
		String category = request.getParameter("cat");
		String sortby = request.getParameter("sort");
		
		System.out.println("sort >>> " + sortby);
		
		//제품리스트 가져오기
		ProductDAO dao = ProductDAO.getInstance();
		List<ProductDTO> list = dao.getCategoryList(category, sortby);
		
		//제품 리스트 및 수량 전달
		request.setAttribute("productList", list);
		request.setAttribute("listCount", list.size());
		
		//제품 카테고리 및 정렬방식 전달
		request.setAttribute("category", category);
		request.setAttribute("sortBy", sortby);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		forward.setPath("/user/user_category.jsp");
		
		return forward;
	}

}
