package com.kurly.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kurly.controller.Action;
import com.kurly.controller.ActionForward;
import com.kurly.model.ReviewDAO;
import com.kurly.model.ReviewDTO;

public class UserProductReviewdeleteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
				// 삭제 폼 페이지에서 넘어온 글번호와 비밀번호를 가지고 
				// DB에서 게시글을 삭제하는 비지니스 로직
				
				int r_num = Integer.parseInt(request.getParameter("r_num").trim());
				
				ReviewDAO dao = ReviewDAO.getInstance();
				
				//삭제 전 r_num에 해당하는 p_num 받아오기
				ReviewDTO dto = dao.getReviewCont(r_num);
				int p_num = dto.getP_num();
				
				//삭제 수행 및 r_num 업데이트
				int res = dao.deleteReveiwUpload(r_num);
				dao.sequenceUpdate(r_num);
			
				ActionForward forward = new ActionForward();
				
				PrintWriter out = response.getWriter();
				
				if(res > 0 ) {
					forward.setRedirect(true);
					forward.setPath("user_product_review_list.do?p_num=" + p_num);
					
				}else {
					out.println("<script>");
					out.println("alert('게시글 삭제 실패')");
					out.println("history.back()");
					out.println("</script>");
				}
				
				
				return forward;
			}

		}
