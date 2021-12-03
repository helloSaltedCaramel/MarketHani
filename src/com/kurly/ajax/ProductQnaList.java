package com.kurly.ajax;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServlet;

import com.kurly.controller.ActionForward;
import com.kurly.model.QnADAO;
import com.kurly.model.QnADTO;

public class ProductQnaList extends HttpServlet {

	
	//해당 페이지의 QnA 게시글을 찾아 넘겨주는 비지니스 로직 
	
	//페이징 작업
	int rowsize = 3;	//한 페이지에 보여질 게시물 수
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
	
	//p_num 받아오기
	int p_num = Integer.parseInt(request.getParameter("p_num").trim());
	
	//DB상의 전체 게시물 수를 확인하는 메서드 호출
	QnADAO q_dao = QnADAO.getInstance();
	totalRecord = q_dao.getQnaCount(p_num);
	
	// 전체 게시물 수를 한 페이지당 보여질 게시물의 수로 나누어주어야 함
	// 전체 페이지 수를 산출한 후 나머지가 있을 경우 무조건 페이지수 + 1
	allPage = (int)Math.ceil(totalRecord / (double)rowsize);

	//번호에 해당하는 List<QnADTO> 받아오기
	List<QnADTO> QnAlist = q_dao.getQnAList(page, rowsize, p_num);
	
	//attribute 설정
	request.setAttribute("List", QnAlist);
	
	//페이징 처리값 전달
	request.setAttribute("page", page);
	request.setAttribute("rowsize", rowsize);
	request.setAttribute("block", block);
	request.setAttribute("totalRecord", totalRecord);
	request.setAttribute("allPage", allPage);
	request.setAttribute("startNo", startNo);
	request.setAttribute("endNo", endNo);
	request.setAttribute("startBlock", startBlock);
	request.setAttribute("endBlock", endBlock);

	//포워드
	ActionForward forward = new ActionForward();
	
	//페이지 넘어감 방지
	response.setContentType("text/html; charset=UTF-8");
	PrintWriter out = response.getWriter();
	out.println("<script>");
	out.println("history.back()");
	out.println("</script>");	
	
	return forward;


}
