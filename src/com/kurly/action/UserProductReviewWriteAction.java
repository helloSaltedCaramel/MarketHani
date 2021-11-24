package com.kurly.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kurly.controller.Action;
import com.kurly.controller.ActionForward;
import com.kurly.model.ReviewDTO;

public class UserProductReviewWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 게시글 작성 폼 페이지에서 넘어온 데이터들을
		// jsp_bbs DB에 저장하는 클래스.
				int r_num = Integer.parseInt(request.getParameter("r_num").trim());
				
				String user_id = request.getParameter("user_id").trim();
				
				int p_num = Integer.parseInt(request.getParameter("p_num").trim());
				
				String r_title = request.getParameter("r_title").trim();
				
				String r_content = request.getParameter("r_content").trim();
				
				String r_image = request.getParameter("r_image").trim();
				
				
				
				ReviewDTO dto = new ReviewDTO();
				
				return null;
			}

		}