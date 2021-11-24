package com.kurly.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kurly.controller.Action;
import com.kurly.controller.ActionForward;
import com.kurly.model.UserDAO;
import com.kurly.model.UserDTO;

public class UserRegistAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		// 생년월일은 선택사항이므로 값이 없을 경우 null 처리는 안되고 1899/01/01로 설정?
		String date = null;
		
		if(request.getParameter("year") == ""
				|| request.getParameter("month") == ""
				|| request.getParameter("day") == "") {
			date = "1899-01-01";
		} else {
			date = request.getParameter("year") + "-" + request.getParameter("month") + "-" + request.getParameter("day");
		}
		
		// 주소, 상세주소 합치기
		String address = request.getParameter("reg_address") + " " + request.getParameter("reg_address_detail");
		
		UserDTO dto = new UserDTO();
		
		dto.setUser_id(request.getParameter("reg_id"));
		dto.setUser_pwd(request.getParameter("reg_pw"));
		dto.setUser_name(request.getParameter("reg_name"));
		dto.setUser_email(request.getParameter("reg_email"));
		dto.setUser_phone(request.getParameter("reg_phone"));
		dto.setUser_addr(address);
		dto.setUser_gender(request.getParameter("reg_gender"));
		dto.setUser_point(1000);												// 가입기념 1000P 지급?
		dto.setUser_birthday(date);
		
		UserDAO dao = UserDAO.getInstance();
		int result = dao.insertUser(dto);
		
		ActionForward forward = new ActionForward();
		
		if(result > 0) {
			forward.setRedirect(true);
			forward.setPath(request.getContextPath() + "/user/user_login.jsp?register=true");
		} else {
			PrintWriter writer = response.getWriter();
			writer.println("<script>");
			writer.println("alert('회원가입 처리 중 오류가 발생했습니다.')");
			writer.println("history.back()");
			writer.println("</script>");
		}
		
		return forward;
	}
	
}
