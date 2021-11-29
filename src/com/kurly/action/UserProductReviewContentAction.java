package com.kurly.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kurly.controller.Action;
import com.kurly.controller.ActionForward;
import com.kurly.model.ReviewDAO;
import com.kurly.model.ReviewDTO;

public class UserProductReviewContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		// get 방식으로 넘어온 글번호에 해당하는 게시글을 DB에서 조회하여
		// 해당 상세내역을 View Page로 이동시키는 비지니스 로직.
				
				int r_num = Integer.parseInt(request.getParameter("no"));
				
				ReviewDAO dao = ReviewDAO.getInstance();
				
				// 조회수 증가 메서드 호출 
				dao.r_hit(r_num);
				
				
				// 글번호에 해당하는 상세내역을 조회하는 메서드 호출
				ReviewDTO dto = dao.getReviewCont(r_num);
				
				// 키로 저장하여 View Page로 이동시키자.
				request.setAttribute("Cont", dto);
				
				ActionForward forward = new ActionForward();
				
				forward.setRedirect(false);
				forward.setPath("user/user_product_review_content.jsp");
				
				
				
				return forward;
			}

		}
