package com.kurly.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ReviewDAO {

	Connection con = null; // DB 연결하는 객체
	PreparedStatement pstmt = null; // DB에 SQL문을 전송하는 객체
	ResultSet rs = null; // SQL문을 실행 후 결과 값을 가지고 있는 객체
	String sql = null; // SQL문을 저장할 객체

	// ReviewDAO 객체를 싱글톤 방식으로 만들어 보자.
	// 1단계 : 싱글톤 방식으로 객체를 만들기 위해서는 우선적으로
	// 기본 생성자의 접근 제어자를 private 으로 선언해야 함.
	// 2단계 : ReviewDAO 객체를 정적 멤버로 선언해야 함. - static으로 선언해야 함.
	private static ReviewDAO instance = null;

	private ReviewDAO() {
	} // 기본생성자.

	// 3단계 : 기본 생성자 대신에 싱글턴 객체를 return 해 주는 getInstance() 라는
	// 메서드를 만들어서 여기에 접근하게 해야 함.
	public static ReviewDAO getInstance() {

		if (instance == null) {
			instance = new ReviewDAO();
		}
		return instance;

	} // getInstance() 메서드 end

	// DB를 연동하는 작업을 진행하는 메서드
	public void openConn() {

		try {
			// 1단계 : JNDI 서버 객체 생성
			Context ctx = new InitialContext();

			// 2단계 : lookup() 메서드를 이용하여 매칭되는 커넥션을 찾는다.
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/myoracle");

			// 3단계 : DataSource 객체를 이용하여 커넥션 객체를 하나 가져온다.
			con = ds.getConnection();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	} // openConn() 메서드 end

	// DB에 연결된 객체를 종료하는 메서드.
	public void closeConn(ResultSet rs, PreparedStatement pstmt, Connection con) {

		try {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (con != null) {
				con.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	} // closeConn() 메서드 end

	  // 관리자 페이지에서 클릭했을 때 나타나는 리스트를 조회하는  메서드
	  //kurly_review 테이블에서 전체 리스트를 조회하는 메서드
	   public List<ReviewDTO> getReviewOnList() { 
	   List<ReviewDTO> list = new ArrayList<ReviewDTO>();
	  
	  try {
	  
	  openConn();
	  
	  sql = "select * from kurly_review order by r_num desc";
	  
	  pstmt = con.prepareStatement(sql);
	  
	  rs = pstmt.executeQuery();
	  
	  while(rs.next()) { ReviewDTO dto = new ReviewDTO();
	  
	  dto.setR_num(rs.getInt("r_num")); dto.setUser_id(rs.getString("user_id"));
	  dto.setP_num(rs.getInt("p_num")); dto.setR_title(rs.getString("r_title"));
	  dto.setR_content(rs.getString("r_content"));
	  dto.setR_image(rs.getString("r_image"));
	  dto.setR_date(rs.getString("r_date").substring(0,10)); //뒤에 시분초 자르는 방법
	  dto.setR_hit(rs.getInt("r_hit"));
	  
	  list.add(dto); }
	  
	  } catch (SQLException e) { // TODO Auto-generated catch block
	  e.printStackTrace(); }finally { closeConn(rs, pstmt, con); }
	  
	  
	  return list;
	  
	  } //getReviewOnList() 메서드 end
	

	// kurly_review 테이블의 전체 게시물 수를 조회하는 메서드
	public int getReviewCount(int p_num) {
		
		int count = 0;
		
		try {
			openConn();
			sql = "select count (*) from kurly_review where p_num = " + p_num;
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return count;
		
	} //getReviewCount() 메서드 end
	
	
	
	
	
	// kurly_review 테이블에서 현재 페이지에 해당하는 게시물을 조회하는 메서드.
			public List<ReviewDTO> getReviewList(int page, int rowsize , int p_num) { 
				//public List<ReviewDTO> getReviewList(int page, int rowsize , int p_num) {
				
				List<ReviewDTO> list = new ArrayList<ReviewDTO>(); 
				
				// 해당 페이지에서 시작 번호
				int startNo = (page * rowsize) - (rowsize - 1);
				
				// 해당 페이지에서 끝 번호 
				int endNo = (page * rowsize);
				
				String order = null;
				
				try {
					openConn();
				
					
					//서브쿼리
					sql = "select * from (select row_number() over(order by r_num desc) bnum, b.* from kurly_review b where p_num = ?) where bnum >=? and bnum <= ?";
					
					pstmt = con.prepareStatement(sql);
					
					pstmt.setInt(1, p_num); 
					
					pstmt.setInt(2, startNo);
					
					pstmt.setInt(3, endNo);
					
					
					
					rs = pstmt.executeQuery();
					
					while(rs.next()) {
						ReviewDTO dto = new ReviewDTO();
						
						dto.setR_num(rs.getInt("r_num"));
						dto.setUser_id(rs.getString("user_id"));
						dto.setP_num(rs.getInt("p_num"));
						dto.setR_title(rs.getString("r_title"));
						dto.setR_content(rs.getString("r_content"));
						dto.setR_image(rs.getString("r_image"));
						dto.setR_date(rs.getString("r_date").substring(0,10));
						dto.setR_hit(rs.getInt("r_hit"));
						
						list.add(dto);
						
					}

				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					closeConn(rs, pstmt, con);
				}
				
				return list;
			
				
			}//getReviewList() 메서드 end
			
	
	// kurly_review 테이블에서 현재 페이지에 해당하는 게시물을 조회하는 메서드.
		public List<ReviewDTO> getReviewList(int page, int rowsize , int p_num, String reviewsort) { 
			//public List<ReviewDTO> getReviewList(int page, int rowsize , int p_num) {
			
			List<ReviewDTO> list = new ArrayList<ReviewDTO>(); 
			
			// 해당 페이지에서 시작 번호
			int startNo = (page * rowsize) - (rowsize - 1);
			
			// 해당 페이지에서 끝 번호 
			int endNo = (page * rowsize);
			
			String order = null;
			
			try {
				openConn();
				
				// 전달되는 정렬방식에 따라 쿼리문 작성
				if(reviewsort.equals("new"))
						order="r_date desc";
				else if(reviewsort.equals("hit"))
						order = "r_hit desc";
				
				//서브쿼리
				sql = "select * from (select row_number() over(order by "+ order + " ) bnum, b.* from kurly_review b where p_num = ?) where bnum >=? and bnum <= ?";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, p_num); 
				
				pstmt.setInt(2, startNo);
				
				pstmt.setInt(3, endNo);
				
				
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					ReviewDTO dto = new ReviewDTO();
					
					dto.setR_num(rs.getInt("r_num"));
					dto.setUser_id(rs.getString("user_id"));
					dto.setP_num(rs.getInt("p_num"));
					dto.setR_title(rs.getString("r_title"));
					dto.setR_content(rs.getString("r_content"));
					dto.setR_image(rs.getString("r_image"));
					dto.setR_date(rs.getString("r_date").substring(0,10));
					dto.setR_hit(rs.getInt("r_hit"));
					
					list.add(dto);
					
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
			
			return list;
		
			
		}//getReviewList() 메서드 end
		

	
	// kurly_review 테이블에서 현재 페이지에 해당하는 게시물을 조회하는 메서드.
	public List<ReviewDTO> getNewReviewList(int page, int rowsize , int p_num, String reviewsort) { 
		//public List<ReviewDTO> getReviewList(int page, int rowsize , int p_num) {
		
		List<ReviewDTO> list = new ArrayList<ReviewDTO>(); 
		
		// 해당 페이지에서 시작 번호
		int startNo = (page * rowsize) - (rowsize - 1);
		
		// 해당 페이지에서 끝 번호 
		int endNo = (page * rowsize);
		
		String order = null;
		
		try {
			openConn();
			
			// 전달되는 정렬방식에 따라 쿼리문 작성
			if(reviewsort.equals("new"))
					order="r_date desc";
			else if(reviewsort.equals("hit"))
					order = "r_hit desc";
			
			//서브쿼리
			sql = "select * from (select row_number() over(order by "+ order + " ) bnum, b.* from kurly_review b where p_num = ?) where bnum >=? and bnum <= ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, p_num); 
			
			pstmt.setInt(2, startNo);
			
			pstmt.setInt(3, endNo);
			
			
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReviewDTO dto = new ReviewDTO();
				
				dto.setR_num(rs.getInt("r_num"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setP_num(rs.getInt("p_num"));
				dto.setR_title(rs.getString("r_title"));
				dto.setR_content(rs.getString("r_content"));
				dto.setR_image(rs.getString("r_image"));
				dto.setR_date(rs.getString("r_date").substring(0,10));
				dto.setR_hit(rs.getInt("r_hit"));
				
				list.add(dto);
				
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return list;
	
		
	}//getReviewList() 메서드 end
	

	// kurly_review 테이블의 게시물 번호에 해당하는 조회수를 증가시키는 메서드.
	public void r_hit(int no) { //반환형이 필요없음(void)

		try {
			openConn();

			sql = "update kurly_review set r_hit = r_hit + 1 where r_num = ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, no);

			pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);

		}

	} // r_hit() 메서드 end

	// kurly_review 테이블 게시물 번호에 해당하는 게시물의 상세내역을 조회하는 메서드
	public ReviewDTO getReviewCont(int no) {
		ReviewDTO dto = new ReviewDTO();

		try {
			openConn();

			sql = "select * from kurly_review where r_num = ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, no);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto.setR_num(rs.getInt("r_num"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setP_num(rs.getInt("p_num"));
				dto.setR_title(rs.getString("r_title"));
				dto.setR_content(rs.getString("r_content"));
				dto.setR_image(rs.getString("r_image"));
				dto.setR_date(rs.getString("r_date").substring(0,10));
				dto.setR_hit(rs.getInt("r_hit"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return dto;
	}// getReviewCont()메서드 end
	
	
	


	// kurly_reivew 테이블에 게시글을 추가하는 메서드.

	public int insertReviewUpload(ReviewDTO dto) {
		int result = 0, count = 0;

		try {
			openConn();

			sql = "select max(r_num) from kurly_review ";

			pstmt = con.prepareStatement(sql);
			
			/* pstmt.setInt(1, p_num); */

			rs = pstmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1) + 1;
			}

			sql = "insert into kurly_review values(?,?,?,?,?,?, sysdate, default)";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, count);

			pstmt.setString(2, dto.getUser_id());

			pstmt.setInt(3, dto.getP_num());

			pstmt.setString(4, dto.getR_title());

			pstmt.setString(5, dto.getR_content());

			pstmt.setString(6, dto.getR_image());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return result;
	} // insertReviewUpload() 메서드 end

	
	// kurly_review 테이블의 게시물 번호에 해당하는 게시물을 수정하는 메서드
	public int reviewUpdate(ReviewDTO rdto) {
		
		int result = 0;
		
		
		try {
			openConn();
			
			sql = "select * from kurly_review where r_num = ?";
			
			pstmt = con.prepareStatement(sql);
			 
			pstmt.setInt(1, rdto.getR_num());
				
			rs = pstmt.executeQuery();
			
			if(rdto.getR_image() == null) {
				sql = "update kurly_review set r_title = ?, r_content = ? where r_num = ?";
				pstmt = con.prepareStatement(sql);
			
				pstmt.setString(1, rdto.getR_title());
				pstmt.setString(2, rdto.getR_content());
				pstmt.setInt(3, rdto.getR_num());
			}else {
				sql = "update kurly_review set r_title = ?, r_content = ?, r_image = ? where r_num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, rdto.getR_title());
				pstmt.setString(2, rdto.getR_content());
				pstmt.setString(3, rdto.getR_image());
				pstmt.setInt(4, rdto.getR_num());
			}	
						
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return result;
	}// reviewUpdate()메서드 end
	
	
	// kurly_review 테이블의 게시글 번호에 해당하는 게시글을 삭제하는 메서드.
	
	public int deleteReveiwUpload(int r_num) {
		
		int result = 0;
		
		try { 
			openConn();
			
			sql = "delete from kurly_review where r_num = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, r_num);
			
			result = pstmt.executeUpdate();
					
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return result;
		
	}//deleteReveiwUpload()메서드 end

	
	/*
	public ReviewDTO reviewUpdate(int r_num, int p_num) {
	
		
		ReviewDTO dto = new ReviewDTO();
		
		try {
			openConn();
			
			sql="select * from kurly_review where r_num = ? and p_num = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, r_num);
			
			pstmt.setInt(2, p_num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setP_num(rs.getInt("p_num"));
				dto.setP_name(rs.getString("p_name"));			
				dto.setP_image(rs.getString("p_image"));
				dto.setP_seller(rs.getString("p_seller"));
				
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return dto;

		
	} //reviewUpdate() 메서드 end
	
*/
	
	// kurly_review 테이블에서 중간 게시글이 삭제 되었을 때 글번호 다시 재작업 하는 메서드
	public void sequenceUpdate(int no) {
		
		try {
			openConn();
			
			sql = "update kurly_review set "
					+ " r_num = r_num - 1 "
					+ " where r_num > ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, no);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
	}  // sequenceUpdate() 메서드 end

}