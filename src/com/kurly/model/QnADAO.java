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

public class QnADAO {

	Connection con = null;            // DB 연결하는 객체 
	PreparedStatement pstmt = null;   // DB에 SQL문을 전송하는 객체
	ResultSet rs = null;       		  // SQL문을 실행 후 결과 값을 가지고 있는 객체 
	String sql = null;    			  // SQL문을 저장할 객체
	
	// QnADAO 객체를 싱글톤 방식으로 만들어 보자.
		// 1단계 : 싱글톤 방식으로 객체를 만들기 위해서는 우선적으로
		//        기본 생성자의 접근 제어자를 private 으로 선언해야 함.
		// 2단계 : QnADAO 객체를 정적 멤버로 선언해야 함. - static으로 선언해야 함.
		private static QnADAO instance = null;
		
		private QnADAO() {   }  // 기본생성자.
			
		// 3단계 : 기본 생성자 대신에 싱글턴 객체를 return 해 주는 getInstance() 라는
		//        메서드를 만들어서 여기에 접근하게 해야 함.
		public static QnADAO getInstance() {
			
			if(instance == null) {
				instance = new QnADAO();
			}
			return instance;
			
		}  // getInstance() 메서드 end
		
		
		// DB를 연동하는 작업을 진행하는 메서드
		public void openConn() {
			
			try {
				// 1단계 : JNDI 서버 객체 생성
				Context ctx = new InitialContext();
				
				// 2단계 : lookup() 메서드를 이용하여 매칭되는 커넥션을 찾는다.
				DataSource ds =
						(DataSource)ctx.lookup("java:comp/env/jdbc/myoracle");
				
				// 3단계 : DataSource 객체를 이용하여 커넥션 객체를 하나 가져온다.
				con = ds.getConnection();
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				
		}  // openConn() 메서드 end
		
		
		// DB에 연결된 객체를 종료하는 메서드.
		public void closeConn(ResultSet rs, 
				PreparedStatement pstmt, Connection con) {
			
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
				if(con != null) {
					con.close();
				}
			} catch(SQLException e) {
				e.printStackTrace();
			}
			
		}  // closeConn() 메서드 end
		
		//kurly_qna 테이블에서 전체 리스트를 조회하는 메서드
		public String getQnAList(int page, int rowsize, int p_num) {
			
			String result = "";
			
			int startNo = (page * rowsize) - (rowsize - 1);
			int endNo = (page * rowsize);				
			
			try {

				openConn();
				
				sql = "select * from "
						+ "(select row_number() over(order by qna_num desc) rnum, q.* from kurly_qna q where p_num = ?)"
						+ "where rnum >= ? and rnum <= ?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, p_num);
				pstmt.setInt(2, startNo);
				pstmt.setInt(3, endNo);				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					result += "<qna>";
					result += "<qna_num>" + rs.getInt("qna_num") + "</qna_num>";
					result += "<user_id>" + rs.getString("user_id") + "</user_id>";
					result += "<qna_title>" + rs.getString("qna_title") + "</qna_title>";
					result += "<qna_content>" + rs.getString("qna_content") + "</qna_content>";
					result += "<qna_date>" + rs.getString("qna_date").substring(0, 10) + "</qna_date>";
					result += "<qna_answer>" + rs.getString("qna_answer") + "</qna_answer>";
					result += "<qna_answer_date>" + rs.getString("qna_answer_date") + "</qna_answer_date>";
					result += "<qna_status>" + rs.getInt("qna_status") + "</qna_status>";
					result += "<qna_secret>" + rs.getInt("qna_secret") + "</qna_secret>";
					result += "<p_num>" + rs.getInt("p_num") + "</p_num>";
					result += "</qna>";
				}
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeConn(rs, pstmt, con);
			}
			
			return result;
			
		} //getQnAList() 메서드 end

		public int writeQnA(QnADTO dto) {
			
			int res = 0, count = 0;
			
			try {
				openConn();
				
				//QnA 글 번호 최대값 받아오기
				sql = "select max(qna_num) from kurly_qna";	
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					
					count = rs.getInt(1) + 1;
				}
				
				//QnA 글쓰기
				sql = "insert into kurly_qna values(?, ?, ?, ?, sysdate, NULL, NULL, NULL, ?, ?)";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, count);
				pstmt.setString(2, dto.getUser_id());
				pstmt.setString(3, dto.getQna_title());
				pstmt.setString(4, dto.getQna_content());
				pstmt.setInt(5, dto.getQna_secret());
				pstmt.setInt(6, dto.getP_num());
				
				res = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
			
			return res;
		}//writeQnA() end

		public int deleteQnA(int qna_num) {
			
			int res = 0;
			
			try {
				//글 삭제
				openConn();
				sql = "delete from kurly_qna where qna_num = " + qna_num;
				pstmt = con.prepareStatement(sql);
				res = pstmt.executeUpdate();
				
				//글 번호 업데이트
				sql= "update kurly_qna set qna_num = qna_num - 1 where qna_num > " + qna_num;
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
			
			return res;
		}//deleteQnA() end

		public int reviseQnA(QnADTO dto) {

			int res = 0;
			
			try {
				openConn();
				
				sql = "update kurly_qna set qna_title = ?, qna_content = ?, qna_secret = ?, qna_date = sysdate where qna_num = ?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, dto.getQna_title());
				pstmt.setString(2, dto.getQna_content());
				pstmt.setInt(3, dto.getQna_secret());
				pstmt.setInt(4, dto.getQna_num());
			
				
				res = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
			
			return res;
		}//reviseQnA() end

		public int getQnaCount(int p_num) {
			
			int count = 0;
			
			try {
				openConn();
				sql = "select count(*) from kurly_qna where p_num = " + p_num;
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
		} //getQnaCount() end

		public int getAdminQnaCount() {
			
			int count = 0;
			
			try {
				openConn();
				sql = "select count(*) from kurly_qna";
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
		} //getAdminQnaCount() end

		public List<QnADTO> getAdminQnAList(int page, int rowsize) {
			
			List<QnADTO> list = new ArrayList<QnADTO>();
			
			int startNo = (page * rowsize) - (rowsize - 1);
			int endNo = (page * rowsize);				
			
			try {

				openConn();
				
				sql = "select * from "
						+ "(select row_number() over(order by qna_num desc) rnum, q.* from kurly_qna q)"
						+ "where rnum >= ? and rnum <= ?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, startNo);
				pstmt.setInt(2, endNo);				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					QnADTO dto = new QnADTO();
	
					dto.setQna_num(rs.getInt("qna_num"));
					dto.setUser_id(rs.getString("user_id"));
					dto.setQna_title(rs.getString("qna_title"));
					dto.setQna_content(rs.getString("qna_content")); 
					dto.setQna_date(rs.getString("qna_date").substring(0, 10)); 
					dto.setQna_answer(rs.getString("qna_answer")); 
					dto.setQna_answer_date(rs.getString("qna_answer_date")); 
					dto.setQna_status(rs.getInt("qna_status")); 
					dto.setQna_secret(rs.getInt("qna_secret"));
					dto.setP_num(rs.getInt("p_num")); 
					
					list.add(dto);
				}
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeConn(rs, pstmt, con);
			}
			
			return list;
		} //getAdminQnAList() end

		public int getUserQnaCount(String user_id) {
			
			int count = 0;
			
			try {
				openConn();
				sql = "select count(*) from kurly_qna where user_id = '" + user_id+ "'";
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
		} //getUserQnaCount() end

		public List<QnADTO> getUserQnAList(int page, int rowsize, String user_id) {
			
			List<QnADTO> list = new ArrayList<QnADTO>();
			
			int startNo = (page * rowsize) - (rowsize - 1);
			int endNo = (page * rowsize);				
			
			try {

				openConn();
				
				sql = "select * from "
						+ "(select row_number() over(order by qna_num desc) rnum, q.* from kurly_qna q where user_id = ?)"
						+ "where rnum >= ? and rnum <= ?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, user_id);
				pstmt.setInt(2, startNo);
				pstmt.setInt(3, endNo);				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					
					QnADTO dto = new QnADTO();
					
					dto.setQna_num(rs.getInt("qna_num"));
					dto.setUser_id(rs.getString("user_id"));
					dto.setQna_title(rs.getString("qna_title"));
					dto.setQna_content(rs.getString("qna_content")); 
					dto.setQna_date(rs.getString("qna_date").substring(0, 10)); 
					dto.setQna_answer(rs.getString("qna_answer")); 
					dto.setQna_answer_date(rs.getString("qna_answer_date")); 
					dto.setQna_status(rs.getInt("qna_status")); 
					dto.setQna_secret(rs.getInt("qna_secret"));
					dto.setP_num(rs.getInt("p_num")); 
					
					list.add(dto);
					 
				}
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeConn(rs, pstmt, con);
			}
			
			return list;
		} //getUserQnAList() end
}

	

