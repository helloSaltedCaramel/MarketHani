package com.kurly.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kurly.controller.Action;
import com.kurly.controller.ActionForward;
import com.kurly.model.ReviewDAO;

public class UserProductReviewdeleteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
				// 삭제 폼 페이지에서 넘어온 글번호와 비밀번호를 가지고 
				// DB에서 게시글을 삭제하는 비지니스 로직
				
				String user_id = request.getParameter("user_id").trim();
				
				int r_num = Integer.parseInt(request.getParameter("r_num").trim());
				
				ReviewDAO dao = ReviewDAO.getInstance();
				
				int res = dao.deleteReveiwUpload(r_num,user_id);
				
				
				
				dao.sequenceUpdate(r_num);
				
				ActionForward forward = new ActionForward();
				
				PrintWriter out = response.getWriter();
				
				if(res > 0 ) {
					forward.setRedirect(true);
					forward.setPath("upload_list.do");
					
				}else if(res == -1) {
					out.println("<script>");
					out.println("alert('비밀번호가 틀립니다. 확인해 주세요')");
					out.println("history.back()");
					out.println("</script>");
				}else {
					out.println("<script>");
					out.println("alert('자료실 삭제 실패')");
					out.println("history.back()");
					out.println("</script>");
				}
				
				
				return forward;
			}

		}
