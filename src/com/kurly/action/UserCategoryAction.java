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

		//카테고리에 해당하는 리스트 가져오기
		String category = request.getParameter("category");
		
		System.out.println(category);
		
		ProductDAO dao = ProductDAO.getInstance();
		List<ProductDTO> list = dao.getCategoryList(category);
		
		request.setAttribute("productList", list);
		request.setAttribute("listCount", list.size());
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		forward.setPath("/user/user_category.jsp");
		
		return forward;
	}

}
