package com.kurly.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kurly.controller.Action;
import com.kurly.controller.ActionForward;
import com.kurly.model.ProductDAO;

public class AdminProdDisableAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int p_num = Integer.parseInt(request.getParameter("p_num"));
		String url = request.getParameter("url");
		
		int result = ProductDAO.getInstance().disableProduct(p_num);
		
		if(result > 0) {
			ActionForward forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath(url);
			return forward;
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath("main.jsp");
		forward.setRedirect(true);
		return forward;
	}


}
