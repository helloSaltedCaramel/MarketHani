package com.kurly.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kurly.controller.Action;
import com.kurly.controller.ActionForward;
import com.kurly.model.ProductDAO;
import com.kurly.model.ProductDTO;
import com.kurly.model.ReviewDAO;
import com.kurly.model.ReviewDTO;

public class UserProductReviewUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// get방식으로 넘어온 글번호를 가지고 DB에서 상세내역을 가져온 후 
		// 수정 폼 페이지로 해당 상세내역을 넘겨주는 비지니스로직
		
		int r_num = Integer.parseInt(request.getParameter("no"));

		int p_num = Integer.parseInt(request.getParameter("p_num"));
		
		/* int nowPage = Integer.parseInt(request.getParameter("page"));  오류 원인*/ 
		
		
		ProductDAO dao = ProductDAO.getInstance();
		
		ProductDTO dto = dao.productCont(p_num);
		
		ReviewDAO rdao = ReviewDAO.getInstance();
		
		ReviewDTO rdto = rdao.getReviewCont(r_num);
		
		
		request.setAttribute("modify", rdto);
		
		request.setAttribute("product", dto);
		
		
		/* request.setAttribute("page", dto); */
	
		
		// 추가
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("user/user_product_review_update.jsp");
	
		return forward;  //참조 주소값
		
		
	}

}
