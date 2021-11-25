package com.kurly.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kurly.model.CartDataDAO;

@WebServlet("/cart_delete")
public class CartDeleteProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		HttpSession session = request.getSession();
		
		PrintWriter writer = response.getWriter();
		if(session.getAttribute("user_id") == null) {
			writer.write("request login");
			return;
		}
		
		String result = CartDataDAO.getInstance().deleteCartProduct(request.getParameter("cart_num"));
		writer.write(result);
	}

}
