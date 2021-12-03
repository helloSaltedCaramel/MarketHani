package com.kurly.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kurly.controller.Action;
import com.kurly.controller.ActionForward;
import com.kurly.model.ProductDAO;
import com.kurly.model.ProductDTO;

public class UserCategoryAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		//카테고리 및 정렬방식 가져오기
		String category = request.getParameter("cat");
		String sortby = request.getParameter("sort");
		
		if(sortby == null) {	//첫 호출인 경우 정렬방식 new로 변경
			sortby = "new";
		}
		
		//페이징 작업
		int rowsize = 9;	//한 페이지에 보여질 게시물 수
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
			
		//해당 카테고리 전체 게시물 수를 확인하는 메서드
		ProductDAO dao = ProductDAO.getInstance();
		totalRecord = dao.getCategoryCount(category);
		
		// 전체 게시물 수를 한 페이지당 보여질 게시물의 수로 나누어주어야 함
		// 전체 페이지 수를 산출한 후 나머지가 있을 경우 무조건 페이지수 + 1
		allPage = (int)Math.ceil(totalRecord / (double)rowsize);
		
		//게시글이 적을 경우 endBlock을 필요한 만큼만 설정		
		if(endBlock > allPage) {
			endBlock = allPage;
		} 
		
		//제품리스트 가져오기
		List<ProductDTO> list = dao.getCategoryList(page, rowsize, category, sortby);
		
		//제품 리스트 및 수량 전달
		request.setAttribute("productList", list);
		request.setAttribute("listCount", list.size());
		
		//제품 카테고리 및 정렬방식 전달
		request.setAttribute("category", category);
		request.setAttribute("sortBy", sortby);
		
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
		
		forward.setRedirect(false);
		forward.setPath("/user/user_category.jsp");
		
		return forward;
	}

}
