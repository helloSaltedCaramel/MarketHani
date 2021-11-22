package com.kurly.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;
import java.util.StringTokenizer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FrontController extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 한글 인코딩
		request.setCharacterEncoding("UTF-8");
		response.setContentType("htxt/html; charset=UTF-8");
		
		// getRequestURI() : "/프로젝트명/파일명(*.do)" 문자열 반환
		String uri = request.getRequestURI();
		
		// getContextPath() : 현재 프로젝트명 문자열 반환
		String path = request.getContextPath();
		
		String command = uri.substring(path.length() + 1);
		
		System.out.println("uri >>> " + uri);
		System.out.println("path >>> " + path);
		System.out.println("command >>> " + command);
		
		Action action = null;
		ActionForward forward = null;
		
		/*
		java.util.Properties 클래스
		- HashTable의 하위 클래스로, 환경변수 및 속성 값을 Properties 파일을 통해 쉽게 접근하게 해주는 장점이 있음 	
		- key-value의 한 쌍으로 이루어져 있음
		- *.properties 확장자 사용
		- InputStream에 Properties 파일을 인자로 넣어 읽는 방식을 사용 (load() 메서드 사용)
		*/
		
		Properties prop = new Properties();
		FileInputStream fis =
				new FileInputStream("C:\\Users\\amorf\\git\\MarketHani\\src\\com\\kurly\\controller\\mapping.properties");

		
		prop.load(fis);
		
		String value = prop.getProperty(command);
		
		System.out.println("value >>> " + value);
		
		System.out.println();

		/*
		동적 객체 생성 : newInstance()
		- Class 객체를 이용하여 new 키워드의 사용 없이 동적으로 객체 생성
		- 코드 작성 시 클래스의 이름을 결정할 수 없고 런타임(실행)시에 클래스의 이름이 결정되는 경우에 사용
		- newInstance() 메서드를 기본생성자를 호출하여 객체를 생성하기 때문에,
		    반드시 클래스에 기본생성자가 존재하여야 함. 
		- 예외발생 : 1)해당 클래스가 추상클래스이거나 인터페이스일 경우 
		          2)접근제한자 사용으로 클래스의 생성자에 접근할 수 없는 경우
		- 반환타입을 알 수 없으므로 인터페이스를 사용함
		- Class.forName()은 파라미터에 해당하는 클래스 인스턴스를 리턴
		
		e.g. (Action)Class.forName(클래스이름).newInstance(); 
		*/		

		if(value.substring(0, 7).equals("execute")) {
			StringTokenizer st = new StringTokenizer(value, "|");
			String url_1 = st.nextToken();	//"execute"
			String url_2 = st.nextToken(); //"com....Action"
			
			try {
				Class url = Class.forName(url_2);
				
				//동적으로 객체 생성
				action = (Action)url.newInstance();
				forward = action.execute(request, response);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath(value);
		}
		
		if(forward != null) {
			
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			}else {
				RequestDispatcher rd = request.getRequestDispatcher(forward.getPath());
				rd.forward(request, response);
			}
				
		}
		
		
	}
}
