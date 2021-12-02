package com.kurly.action;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kurly.controller.Action;
import com.kurly.controller.ActionForward;
import com.kurly.model.LoginDTO;
import com.kurly.model.UserDAO;
import com.kurly.utils.KurlySecure;

public class UserLoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		String salt = saltCheck(id);
		
		// salt가 null일 경우에는 아이디가 일치하지 않으므로 redirect
		if(salt == null) {
			ActionForward forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath(request.getContextPath() + "/user/user_login.jsp?notFound=true");
			return forward;
		}
		
		// 입력받은 비밀번호를 hashing하기
		String hashedPw = "";
		try {
			hashedPw = KurlySecure.hashing(pw.getBytes(), salt);
			System.out.println("입력받은 ID = " + request.getParameter("id"));
			System.out.println("가져온 salt = " + salt);
			System.out.println("hashedPw = " + hashedPw);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		LoginDTO dto = new LoginDTO(id, hashedPw);
		
		// 아이디, salt를 받아오는 DTO 객체
		String username = UserDAO.getInstance().loginCheck(dto);		

		ActionForward forward = new ActionForward();
		if(username != null) {
			HttpSession session = request.getSession();
			
			session.setAttribute("user_id", request.getParameter("id"));
			session.setAttribute("user_name", username);
			
			forward.setRedirect(true);
			forward.setPath(request.getContextPath() + "/main.jsp");
		} else {
			forward.setRedirect(true);
			forward.setPath(request.getContextPath() + "/user/user_login.jsp?notFound=true");
		}
		
		
		return forward;
	}
	
	private String saltCheck(String id) {
		return UserDAO.getInstance().getUserSalt(id);
	}
}
