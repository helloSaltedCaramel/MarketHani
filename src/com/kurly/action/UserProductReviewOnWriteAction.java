package com.kurly.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kurly.controller.Action;
import com.kurly.controller.ActionForward;
import com.kurly.model.OrderDetailDAO;
import com.kurly.model.OrderDetailDTO;
import com.kurly.model.QnADAO;
import com.kurly.model.QnADTO;
import com.kurly.model.ReviewDAO;
import com.kurly.model.ReviewDTO;

public class UserProductReviewOnWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
			// DB의 전체 레코드를 View Page로 이동시키는 비지니스 로직
			int od_num = Integer.parseInt(request.getParameter("od_num"));
			
			OrderDetailDAO dao = OrderDetailDAO.getInstance();
			
			List<OrderDetailDTO> olist = dao.getReviewOnList(od_num);
			
			request.setAttribute("OList", olist);
			
			ActionForward forward= new ActionForward();
			
			forward.setRedirect(false); 
			
			forward.setPath("user/user_product_review_on_write.jsp");
			
			return forward;
		
		}

	}