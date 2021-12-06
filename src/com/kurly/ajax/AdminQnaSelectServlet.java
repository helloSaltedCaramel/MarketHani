package com.kurly.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kurly.model.QnADAO;

/**
 * Servlet implementation class AdminQnaSelectServlet
 */

@WebServlet("/admin_qna_select.do")
public class AdminQnaSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminQnaSelectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			//해당 페이지의 QnA 게시글을 찾아 넘겨주는 비지니스 로직 

			//페이징 작업
			int rowsize = 12;	//한 페이지에 보여질 게시물 수
			int block = 5;		//아래에 보여질 페이지의 최대 수 [1][2][3][4]...
			int totalRecord = 0;//DB상의 게시물 전체 수
			int allPage = 0;	//현재 페이지 수

			int page = 0; 	//현재 페이지 변수

			if(request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			}else {	//page값 없이 호출되었을 때 1에서 시작 
				page = 1;
			}
			
			//해당 페이지에서 시작 번호
			int startNo = (page * rowsize) - (rowsize - 1);
			
			//해당 페이지에서 끝 번호
			int endNo = (page * rowsize);
			
			//해당 페이지의 시작 블럭
			int startBlock = ((page - 1) / block) * block + 1;
			
			//해당 페이지의 끝 블럭
			int endBlock = ((page - 1) / block) * block + block;
			
			//DB상의 전체 게시물 수를 확인하는 메서드 호출
			QnADAO q_dao = QnADAO.getInstance();
			totalRecord = q_dao.getAdminQnaCount();
			
			// 전체 게시물 수를 한 페이지당 보여질 게시물의 수로 나누어주어야 함
			// 전체 페이지 수를 산출한 후 나머지가 있을 경우 무조건 페이지수 + 1
			allPage = (int)Math.ceil(totalRecord / (double)rowsize);

			//번호에 해당하는 List<QnADTO> 받아오기
			String qna = q_dao.getAdminQnAList(page, rowsize);
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
				
			//페이징 처리값 전달
			
			String pagination = ""; 
			pagination += "<pagination>";
			pagination += "<page>" + page + "</page>";
			pagination += "<rowsize>" + rowsize + "</rowsize>";		
			pagination += "<block>" + block + "</block>";
			pagination += "<totalRecord>" + totalRecord + "</totalRecord>";
			pagination += "<allPage>" + allPage + "</allPage>";		
			pagination += "<startNo>" + startNo + "</startNo>";
			pagination += "<endNo>" + endNo + "</endNo>";
			pagination += "<startBlock>" + startBlock + "</startBlock>";		
			pagination += "<endBlock>" + endBlock + "</endBlock>";
			pagination += "</pagination>";
			
			String str = "";
			
			str += "<qnalist>";
			
			str += pagination;
			str += qna;
			
			str += "</qnalist>";
			
			out.println(str);
	}

}
