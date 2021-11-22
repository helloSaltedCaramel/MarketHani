package com.kurly.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kurly.controller.Action;
import com.kurly.controller.ActionForward;
import com.kurly.model.QnADAO;
import com.kurly.model.QnADTO;

public class UserProductQnAListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
				// kurly_qna 테이블에 있는 전체 레코드를 조회하여 
				// 해당 데이터를 View Page로 이동시키는 비지니스 로직.
				
				QnADAO dao = QnADAO.getInstance();
				
				List<QnADTO> QnAlist = dao.getQnAList();
				
				request.setAttribute("List", QnAlist);
				
				ActionForward forward = new ActionForward();
				
				forward.setRedirect(false);
				
				forward.setPath("user/user_product_QnA_list.jsp");
				
				return forward;
			}

		}