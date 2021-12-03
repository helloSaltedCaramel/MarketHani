package com.kurly.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kurly.controller.Action;
import com.kurly.controller.ActionForward;
import com.kurly.model.ProductDAO;
import com.kurly.model.ProductDTO;

public class UserProductReviewWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int p_num = Integer.parseInt(request.getParameter("p_num"));
		
		ProductDAO dao = ProductDAO.getInstance();
		ProductDTO dto = dao.productCont(p_num);
		
		request.setAttribute("product", dto);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		forward.setPath("user/user_product_review_write.jsp");
		
		
		
		return forward;
	}

}
