package com.kurly.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kurly.controller.Action;
import com.kurly.controller.ActionForward;
import com.kurly.model.ReviewDAO;
import com.kurly.model.ReviewDTO;

public class UserProductReviewListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
				// kurly_review 테이블에 있는 전체 레코드를 조회하여 
				// 해당 데이터를 View Page로 이동시키는 비지니스 로직.
				
		
				ReviewDAO dao = ReviewDAO.getInstance();
				
				List<ReviewDTO> list = dao.getReviewList();
				
				request.setAttribute("List", list);
				
				ActionForward forward = new ActionForward();
				
				forward.setRedirect(false);
				
				forward.setPath("user/user_product_review_list.jsp");
				
				return forward;
			}

		}
