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

import com.kurly.model.ProductDAO;

public class ProductDAO {
	Connection con = null;             // DB 연결하는 객체.
	PreparedStatement pstmt = null;    // DB에 SQL문을 전송하는 객체.
	ResultSet rs = null;               // SQL문을 실행 후 결과 값을 가지고 있는 객체.
	
	String sql = null;                 // SQL문을 저장할 객체.
	
	
	// ProductDAO 객체를 싱글톤 방식으로 만들어 보자.
	// 1단계 : 싱글톤 방식으로 객체를 만들기 위해서는 우선적으로
	//        기본 생성자의 접근 제어자를 private 으로 선언해야 함.
	// 2단계 : ProductDAO 객체를 정적 멤버로 선언해야 함. - static으로 선언해야 함.
	private static ProductDAO instance = null;
	
	
	private ProductDAO() {   }  // 기본생성자.
		
	// 3단계 : 기본 생성자 대신에 싱글턴 객체를 return 해 주는 getInstance() 라는
	//        메서드를 만들어서 여기에 접근하게 해야 함.
	public static ProductDAO getInstance() {
		
		if(instance == null) {
			instance = new ProductDAO();
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

	public List<ProductDTO> getProductList() {
		
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		
		try {
			openConn();
			sql = "select * from kurly_product order by p_num desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				ProductDTO dto = new ProductDTO();
				
				dto.setP_num(rs.getInt("p_num"));
				dto.setP_image(rs.getString("p_image"));
				dto.setP_price(rs.getInt("p_price"));
				dto.setP_name(rs.getString("p_name"));
				dto.setP_name_cont(rs.getString("p_name_cont"));
				dto.setP_unit(rs.getString("p_unit"));
				dto.setP_wrap(rs.getString("p_wrap"));
				dto.setP_wrap_cont(rs.getString("p_wrap_cont"));
				dto.setP_delivery(rs.getString("p_delivery"));
				dto.setP_qty(rs.getInt("p_qty"));
				dto.setP_point(rs.getInt("p_point"));
				dto.setP_category(rs.getString("p_category"));
				dto.setP_sold(rs.getInt("p_sold"));
				dto.setP_seller(rs.getString("p_seller"));
				dto.setP_discount(rs.getInt("p_discount"));
				dto.setP_contents(rs.getString("p_contents"));
				dto.setP_date(rs.getString("p_date"));
				dto.setP_contents_spec(rs.getString("p_contents_spec"));
				
				list.add(dto);
			}
			
			return list;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
	
		return null;
	} //getProductList() end

	public List<ProductDTO> getNewProductList(int page, int rowsize, String sortby) {

		List<ProductDTO> list = new ArrayList<ProductDTO>();
		
		int startNo = (page * rowsize) - (rowsize - 1);
		int endNo = (page * rowsize);
		
		String order = null;
		
		try {
			openConn();
			
			//전달된 정렬방식에 따라 쿼리문 작성
			if(sortby.equals("new"))
				order = "p_date desc";
			else if(sortby.equals("low"))
				order = "p_price";
			else if(sortby.equals("high"))
				order = "p_price desc";
			else if(sortby.equals("recommend"))
				order = "p_date desc, p_discount desc, p_price desc";
			
			//페이지네이션 적용 쿼리문
			sql = "select * from (select row_number() over(order by " + order 
					+ ") rnum, p.* from kurly_product p where not p_qty = -1) where rnum >= ? and rnum <= ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startNo);
			pstmt.setInt(2, endNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				ProductDTO dto = new ProductDTO();
				
				dto.setP_num(rs.getInt("p_num"));
				dto.setP_image(rs.getString("p_image"));
				dto.setP_price(rs.getInt("p_price"));
				dto.setP_name(rs.getString("p_name"));
				dto.setP_name_cont(rs.getString("p_name_cont"));
				dto.setP_unit(rs.getString("p_unit"));
				dto.setP_wrap(rs.getString("p_wrap"));
				dto.setP_wrap_cont(rs.getString("p_wrap_cont"));
				dto.setP_delivery(rs.getString("p_delivery"));
				dto.setP_qty(rs.getInt("p_qty"));
				dto.setP_point(rs.getInt("p_point"));
				dto.setP_category(rs.getString("p_category"));
				dto.setP_sold(rs.getInt("p_sold"));
				dto.setP_seller(rs.getString("p_seller"));
				dto.setP_discount(rs.getInt("p_discount"));
				dto.setP_contents(rs.getString("p_contents"));
				dto.setP_date(rs.getString("p_date"));
				dto.setP_contents_spec(rs.getString("p_contents_spec"));
				
				list.add(dto);
			}	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
	
		return list;
		
	} //getNewProductList() end

	public List<ProductDTO> getCategoryList(int page, int rowsize, String category, String sortby) {
		
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		
		int startNo = (page * rowsize) - (rowsize - 1);
		int endNo = (page * rowsize);
		
		String order = null;
		
		try {
			openConn();
			
			//전달된 정렬방식에 따라 쿼리문 작성
			if(sortby.equals("new"))
				order = "p_date desc";
			else if(sortby.equals("low"))
				order = "p_price";
			else if(sortby.equals("high"))
				order = "p_price desc";
			
			sql = "select * from (select row_number() over(order by " + order 
					+ ") rnum, p.* from kurly_product p where p_category like '" + category + "%' and not p_qty = -1) where rnum >= ? and rnum <= ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startNo);
			pstmt.setInt(2, endNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				ProductDTO dto = new ProductDTO();
				
				dto.setP_num(rs.getInt("p_num"));
				dto.setP_image(rs.getString("p_image"));
				dto.setP_price(rs.getInt("p_price"));
				dto.setP_name(rs.getString("p_name"));
				dto.setP_name_cont(rs.getString("p_name_cont"));
				dto.setP_unit(rs.getString("p_unit"));
				dto.setP_wrap(rs.getString("p_wrap"));
				dto.setP_wrap_cont(rs.getString("p_wrap_cont"));
				dto.setP_delivery(rs.getString("p_delivery"));
				dto.setP_qty(rs.getInt("p_qty"));
				dto.setP_point(rs.getInt("p_point"));
				dto.setP_category(rs.getString("p_category"));
				dto.setP_sold(rs.getInt("p_sold"));
				dto.setP_seller(rs.getString("p_seller"));
				dto.setP_discount(rs.getInt("p_discount"));
				dto.setP_contents(rs.getString("p_contents"));
				dto.setP_date(rs.getString("p_date"));
				dto.setP_contents_spec(rs.getString("p_contents_spec"));
				
				list.add(dto);
			}	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
	
		return list;
	} //getCategoryList() end

	public List<ProductDTO> getOnsaleProductList(int page, int rowsize, String sortby) {

		List<ProductDTO> list = new ArrayList<ProductDTO>();
		
		int startNo = (page * rowsize) - (rowsize - 1);
		int endNo = (page * rowsize);
		
		String order = null;
		
		try {
			openConn();
			
			//전달된 정렬방식에 따라 쿼리문 작성
			if(sortby.equals("new"))
				order = "p_date desc";
			else if(sortby.equals("low"))
				order = "p_price";
			else if(sortby.equals("high"))
				order = "p_price desc";
			else if(sortby.equals("recommend"))
				order = "p_date desc, p_discount desc, p_price desc";
			
			//페이지네이션 적용 쿼리문
			sql = "select * from (select row_number() over(order by " + order 
					+ ") rnum, p.* from kurly_product p where p_discount > 0 and not p_qty = -1) where rnum >= ? and rnum <= ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startNo);
			pstmt.setInt(2, endNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				ProductDTO dto = new ProductDTO();
				
				dto.setP_num(rs.getInt("p_num"));
				dto.setP_image(rs.getString("p_image"));
				dto.setP_price(rs.getInt("p_price"));
				dto.setP_name(rs.getString("p_name"));
				dto.setP_name_cont(rs.getString("p_name_cont"));
				dto.setP_unit(rs.getString("p_unit"));
				dto.setP_wrap(rs.getString("p_wrap"));
				dto.setP_wrap_cont(rs.getString("p_wrap_cont"));
				dto.setP_delivery(rs.getString("p_delivery"));
				dto.setP_qty(rs.getInt("p_qty"));
				dto.setP_point(rs.getInt("p_point"));
				dto.setP_category(rs.getString("p_category"));
				dto.setP_sold(rs.getInt("p_sold"));
				dto.setP_seller(rs.getString("p_seller"));
				dto.setP_discount(rs.getInt("p_discount"));
				dto.setP_contents(rs.getString("p_contents"));
				dto.setP_date(rs.getString("p_date"));
				dto.setP_contents_spec(rs.getString("p_contents_spec"));
				
				list.add(dto);
			}	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
	
		return list;
		
	}//getOnsaleProductList() end
	

	public ProductDTO productCont(int p_num) {
		
		ProductDTO dto = new ProductDTO(); 
		
		try {
			openConn();
			
			sql="select * from kurly_product where p_num = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, p_num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setP_num(rs.getInt("p_num"));
				dto.setP_name(rs.getString("p_name"));
				dto.setP_price(rs.getInt("p_price"));
				dto.setP_image(rs.getString("p_image"));
				dto.setP_unit(rs.getString("p_unit"));
				dto.setP_wrap(rs.getString("p_wrap"));
				dto.setP_wrap_cont(rs.getString("p_wrap_cont"));
				dto.setP_delivery(rs.getString("p_delivery"));
				dto.setP_qty(rs.getInt("p_qty"));
				dto.setP_point(rs.getInt("p_point"));
				dto.setP_category(rs.getString("p_category"));
				dto.setP_sold(rs.getInt("p_sold"));
				dto.setP_seller(rs.getString("p_seller"));
				dto.setP_discount(rs.getInt("p_discount"));
				dto.setP_contents(rs.getString("p_contents"));
				dto.setP_date(rs.getString("p_date"));
				dto.setP_name_cont(rs.getString("p_name_cont"));
				dto.setP_contents_spec(rs.getString("p_contents_spec"));
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return dto;
	
	} // productCont() end

	public int getBoardCount() {
		
		int count = 0;
		
		try {
			openConn();
			
			sql = "select count(*) from kurly_product where not p_qty = -1";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
			rs.close(); pstmt.close(); con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return count;
	} // getBoardCount() end

	public int getCategoryCount(String category) {
	
		int count = 0;
		
		try {
			openConn();
			
			sql = "select count(*) from kurly_product where p_category like '" + category + "%' and not p_qty = -1";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
			rs.close(); pstmt.close(); con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
        return count;
	} // getCategoryCount()
	
	
	public int insertProduct(ProductDTO dto) {
		int result = 0;
		
		// 0: 서브카테고리, 사용안하므로 0으로 설정
		// p_date : 상품 등록일, sysdate
		final String sql = "insert into kurly_product values(?, ?, ?, ?, ?, ?, ?, '', ?, ?, ?, 0, ?, ?, ?, SYSDATE, ?, ?)";
		
		openConn();
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getP_num());
			pstmt.setString(2, dto.getP_image());
			pstmt.setInt(3, dto.getP_price());
			pstmt.setString(4, dto.getP_name());
			pstmt.setString(5, dto.getP_unit());
			pstmt.setString(6, dto.getP_wrap());
			pstmt.setString(7, dto.getP_wrap_cont());
			pstmt.setInt(8, dto.getP_qty());
			pstmt.setInt(9,  dto.getP_point());
			pstmt.setString(10, dto.getP_category());
			pstmt.setString(11, dto.getP_seller());
			pstmt.setInt(12, dto.getP_discount());
			pstmt.setString(13, dto.getP_contents());
			pstmt.setString(14, dto.getP_name_cont());
			pstmt.setString(15, dto.getP_contents_spec());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("[ProductDAO] insertProduct 오류 발생");
			e.printStackTrace();
			result = -1;
			return result;
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	}//insertProduct() end
	
	public int getInsertPnum() {
		int p_num = -1;
		
		final String sql = "select max(p_num) p_num from kurly_product";
		
		openConn();
		
		try {
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				p_num = rs.getInt("p_num") + 1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return p_num;
	}//getInsertPnum() end

	public int getOnsaleCount() {
		
		int count = 0;
		
		try {
			openConn();
			
			sql = "select count(*) from kurly_product where p_discount > 0 and not p_qty = -1";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
			rs.close(); pstmt.close(); con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return count;
	}//getOnsaleCount() end

	public List<ProductDTO> getSearchProductList(int page, String search, int rowsize, String sortby) {

		List<ProductDTO> list = new ArrayList<ProductDTO>();
		
		int startNo = (page * rowsize) - (rowsize - 1);
		int endNo = (page * rowsize);
		
		String order = null;
		
		try {
			openConn();
			
			//전달된 정렬방식에 따라 쿼리문 작성
			if(sortby.equals("new"))
				order = "p_date desc";
			else if(sortby.equals("low"))
				order = "p_price";
			else if(sortby.equals("high"))
				order = "p_price desc";
			else if(sortby.equals("recommend"))
				order = "p_date desc, p_discount desc, p_price desc";
			
			//페이지네이션 적용 쿼리문
			sql = "select * from (select row_number() over(order by " + order 
					+ ") rnum, p.* from kurly_product p where p_name like '%" + search + "%' or p_seller like '%" + search + "%' and not p_qty = -1) where rnum >= ? and rnum <= ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startNo);
			pstmt.setInt(2, endNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				ProductDTO dto = new ProductDTO();
				
				dto.setP_num(rs.getInt("p_num"));
				dto.setP_image(rs.getString("p_image"));
				dto.setP_price(rs.getInt("p_price"));
				dto.setP_name(rs.getString("p_name"));
				dto.setP_name_cont(rs.getString("p_name_cont"));
				dto.setP_unit(rs.getString("p_unit"));
				dto.setP_wrap(rs.getString("p_wrap"));
				dto.setP_wrap_cont(rs.getString("p_wrap_cont"));
				dto.setP_delivery(rs.getString("p_delivery"));
				dto.setP_qty(rs.getInt("p_qty"));
				dto.setP_point(rs.getInt("p_point"));
				dto.setP_category(rs.getString("p_category"));
				dto.setP_sold(rs.getInt("p_sold"));
				dto.setP_seller(rs.getString("p_seller"));
				dto.setP_discount(rs.getInt("p_discount"));
				dto.setP_contents(rs.getString("p_contents"));
				dto.setP_date(rs.getString("p_date"));
				dto.setP_contents_spec(rs.getString("p_contents_spec"));
				
				list.add(dto);
			}	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
	
		return list;	
	}

	public int getSearchCount(String search) {
	
		int count = 0;
		
		try {
			openConn();
			
			sql = "select count(*) from kurly_product where p_name like '%" + search + "%' or p_seller like '%" + search + "%' and not p_qty = -1";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
			rs.close(); pstmt.close(); con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return count;
	}
	
	public int updateQtySold(List<CartDataDTO> cartList) {
		int result = -1;
		
		final String sql = "update kurly_product set p_qty = p_qty - ?, p_sold = p_sold + ? where p_num = ?";
				
		openConn();
		
		try {
			
			for(CartDataDTO dto : cartList) {
				int qty = dto.getCart_qty();
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, qty);
				pstmt.setInt(2, qty);
				pstmt.setString(3, dto.getCart_pnum());
				
				result = pstmt.executeUpdate();
				
				pstmt.close();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return result;
	}
	
	public int updateProduct(ProductDTO dto) {
		int result = 0;
		
		final String sql = "update kurly_product set " + 
				"p_price = ?, p_name = ?, p_unit = ?," + 
				"p_wrap = ?, p_wrap_cont = ?, p_delivery = ?," + 
				"p_qty = ?, p_category = ?, p_sold = ?," + 
				"p_seller = ?, p_discount = ?, p_name_cont = ?," + 
				"p_image = ?, p_contents = ?, p_contents_spec = ? " + 
				"where p_num = ?";
		
		openConn();
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getP_price());
			pstmt.setString(2, dto.getP_name());
			pstmt.setString(3, dto.getP_unit());
			pstmt.setString(4, dto.getP_wrap());
			pstmt.setString(5, dto.getP_wrap_cont());
			pstmt.setString(6, dto.getP_delivery());
			pstmt.setInt(7, dto.getP_qty());
			pstmt.setString(8, dto.getP_category());
			pstmt.setInt(9, dto.getP_sold());
			pstmt.setString(10, dto.getP_seller());
			pstmt.setInt(11, dto.getP_discount());
			pstmt.setString(12, dto.getP_name_cont());
			pstmt.setString(13, dto.getP_image());
			pstmt.setString(14, dto.getP_contents());
			pstmt.setString(15, dto.getP_contents_spec());
			pstmt.setInt(16, dto.getP_num());			
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
			System.out.println("result = " + result);
		}
		
		return result;
	}
	
	public int disableProduct(int p_num) {
		int result = -1;
				
		final String sql = "update kurly_product set p_qty = -1 where p_num = ?";
		
		openConn();
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, p_num);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return result;
	}
}
