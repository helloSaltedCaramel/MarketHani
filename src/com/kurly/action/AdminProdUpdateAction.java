package com.kurly.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kurly.controller.Action;
import com.kurly.controller.ActionForward;
import com.kurly.model.ProductDAO;
import com.kurly.model.ProductDTO;

public class AdminProdUpdateAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int p_num = Integer.parseInt(request.getParameter("p_num"));
		
		HttpSession session = request.getSession();
		
		if(!((String)session.getAttribute("user_id")).equals("haniadmin")) {
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("user/user_login.jsp");
		}
		
		ProductDTO dto = ProductDAO.getInstance().productCont(p_num);
		
		request.setAttribute("productDTO", dto);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("admin/admin_prodUpdate.jsp");
		
		return forward;
	}
	
}
