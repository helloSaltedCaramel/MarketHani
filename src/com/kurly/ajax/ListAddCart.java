package com.kurly.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kurly.model.CartDAO;
import com.kurly.model.CartDTO;

@WebServlet("/addcart_list")
public class ListAddCart extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession();
		PrintWriter writer = response.getWriter();
		
		if(session.getAttribute("user_id") == null) {
			writer.write("request login");
			return;
		}

		CartDTO dto = new CartDTO();
		dto.setUser_id((String)session.getAttribute("user_id"));
		dto.setCart_pnum(request.getParameter("p_num"));
		writer.write(CartDAO.getInstance().addCartByList(dto));
	}

}
