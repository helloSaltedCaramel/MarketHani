package com.kurly.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kurly.controller.Action;
import com.kurly.controller.ActionForward;
import com.kurly.model.*;

public class UserProductReviewListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
				// kurly_review 테이블에 있는 전체 레코드를 조회하여 
				// 해당 데이터를 View Page로 이동시키는 비지니스 로직.
				
		
				/*
				 * ReviewDAO dao = ReviewDAO.getInstance();
				 * 
				 * List<ReviewDTO> list = dao.getReviewList();
				 * 
				 * request.setAttribute("List", list);
				 * 
				 * 
				ActionForward forward = new ActionForward();
				
				forward.setRedirect(false);
				
				forward.setPath("user/user_product_review_list.jsp");
				
				return forward;
				 */
				
		
				// 페이징 작업
		
				int rowsize = 5;       // 한페이지당 보여질 게시물의 수
				int block = 10;        // 아래에 보여질 페이지의 최대 수
				int totalRecord = 0;   // DB 상의 게시물 전체 수
				int allPage = 0;       // 전체 페이지 수
				
				int page = 0;          // 현재 페이지 변수
				
				if(request.getParameter("page") != null ) {
					page = Integer.parseInt(request.getParameter("page"));
				}else { // 처음으로 "전체 게시물 목록" a 클릭했을 경우
					page = 1;
				}
				
				// 해당 페이지에서 시작 번호
				int startNo = (page * rowsize) - (rowsize - 1);
				
				// 해당 페이지에서 끝 번호 
				int endNo = (page * rowsize);
				
				// 해당 페이지의 시작 블럭
				int startBlock = (((page-1)/block)*block)+1;
				
				// 해당 페이지의 끝 블럭
				int endBlock = (((page-1)/block)*block)+block;
				
				ReviewDAO dao = ReviewDAO.getInstance();
				
				// DB 상의 전체 게시물의 수를 확인하는 메서드 호출
				totalRecord = dao.getReviewCount();
				
				// 전체 게시물의 수를 한페이지당 보여질 게시물의 수로 나누어주어야 함.
				// 이 과정을 거치면 전체 페이지 수가 나오게 됨.
				// 전체 페이지 수가 나올 때 나머지가 있으면 무조건 페이지 수를 하나 올려 주어야함.
				
				allPage = (int)Math.ceil(totalRecord / (double)rowsize);  //나머지가 생기면 무조건 올려주는 함수 , 형변환이 필요 
				
				System.out.println("page >>>" + Math.ceil(totalRecord / rowsize));
				
				if(endBlock > allPage) {
					endBlock = allPage;  // 필요없는 블럭 제거
				}
				
				// 현재 페이지에 해당하는 게시물을 가져오는 메서드 호출
				List<ReviewDTO> pageList = dao.getReviewList(page,rowsize);
				
				// 지금까지 페이징 처리 시 작업했더 모든 값들을 키로 저장하자.
				request.setAttribute("page", page);
				request.setAttribute("rowsize", rowsize);
				request.setAttribute("block", block);
				request.setAttribute("totalRecord", totalRecord);
				request.setAttribute("allPage", allPage);
				request.setAttribute("startNo", startNo);
				request.setAttribute("endNo", endNo);
				request.setAttribute("startBlock", startBlock);
				request.setAttribute("endBlock", endBlock);
				request.setAttribute("List", pageList);
				
				
				
				//아래 추가 되야지 화면에 보임 return null아니고
				 ActionForward forward = new ActionForward();
				 
				forward.setRedirect(false);
				
				forward.setPath("user/user_product_review_list.jsp");
				
				return forward;
				
				
			}
			
		}
