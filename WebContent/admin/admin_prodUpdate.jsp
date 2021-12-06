<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>

    <%-- import infoModify.css --%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/admin_main.css"/>

    <%-- import header.css --%>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css"/>
	<link rel="icon" href="<%=request.getContextPath() %>/img/favicon/favicon-32x32.ico" type="image/x-icon" sizes="16x16">
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script defer src="<%=request.getContextPath() %>/js/header/header.js"></script>
	<script defer src="<%=request.getContextPath() %>/js/header/location_postcode.js"></script>	
		
	<%-- import footer.css --%>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css"/>
		
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마켓하니 :: 관리자페이지</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/register.css">
    <link rel="icon" href="${pageContext.request.contextPath}/img/favicon/favicon-32x32.ico" type="image/x-icon" sizes="16x16">
    <script defer src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script defer src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script defer src="${pageContext.request.contextPath}/js/admin/pointGenerator.js"></script>


</head>

<body>

	<jsp:include page="../include/header.jsp"/>
	

	<div id="admin_main">
		<div id="pManage_content"> 

				<div class="page_aticle aticle_type2">
				
				    <%-- 마이 하니 좌측 메뉴 --%> 
					<!-- <div id="snb" class="snb_my">
						<h2 class="tit_snb">관리자</h2>
						<div class="inner_snb">
							<ul class="list_menu">
								<li>
									<a href="">회원목록</a>
								</li>
								<li>
									<a href="">상품등록</a>
								</li>
								<li>
									<a href="">상품목록</a>
								</li>
								<li>
									<a href="">후기관리</a>
								</li>
								<li>
									<a href="">문의관리</a>
								</li>
							</ul>
						</div>
					</div> -->
					
					<%-- 관리자메뉴 중 상품등록 파트 부분 --%>
					<div class="page_section section_pmanage">
						<div class="head_aticle">
							<h2 class="tit">상품수정</h2>
						</div>
						<div class="admin_pManage">
					<c:set var="dto" value="${productDTO}"/>
					<form method="post" action="${pageContext.request.contextPath}/admin_prod_updating.do" enctype="multipart/form-data">
							<input type="hidden" name="p_num" value="${dto.getP_num()}">
							<input type="hidden" name="old_p_image" value="${dto.getP_image()}">
							<input type="hidden" name="old_p_contents" value="${dto.getP_contents()}">
							<input type="hidden" name="old_p_contents_spec" value="${dto.getP_contents_spec()}">
							<table class="pManage_table">								
                <tr class="fsd">
                    <th>
                       	 카테고리
                    </th>

                    <td>
                        <input type="text" class="form_input" id="p_category" name="p_category" value="${dto.getP_category()}" placeholder="A1,B1,C1" required>
                    </td>
                </tr>               

                <tr>
                    <th>
                       	 제조사
                    </th>

                    <td>
                        <input type="text" class="form_input" id="p_seller" name="p_seller" value="${dto.getP_seller()}" required>
                    </td>
                </tr>

                <tr>
                    <th>
                       	 상품이름
                    </th>

                    <td>
                        <input type="text" class="form_input" id="p_name" name="p_name" value="${dto.getP_name()}" required>
                    </td>
                </tr> 

                <tr>
                    <th>
                       	 상품이름 상세
                    </th>

                    <td>
                        <input type="text" class="form_input" id="p_name_cont" name="p_name_cont" value="${dto.getP_name_cont()}" placeholder="예)특별한 기회로 만나보는 홍게 간식" required>
                    </td>
                </tr>                 

                <tr>
                    <th>
                       	상품가격
                    </th>

                    <td>
                        <input type="number" class="form_input" id="p_price" name="p_price" value="${dto.getP_price()}" placeholder="숫자만 입력" required>
                    </td>
                </tr> 
 
                 <tr>
                    <th>
                       	 할인율
                    </th>

                    <td>
                        <input type="number" class="form_input" id="p_discount" name="p_discount" value="${dto.getP_discount()}" placeholder="%를 제외한 숫자만 입력" required>
                    </td>
                </tr>

                <tr>
                    <th>
                       	 적립금
                    </th>

                    <td>
                        <input type="number" class="form_input" id="p_point" name="p_point" value="${dto.getP_point()}" placeholder="숫자만 입력" required>
                    </td>
                </tr> 
                                               
                <tr>
                    <th>
                                            판매단위
                    </th>

                    <td>
                        <input type="text" class="form_input" id="p_unit" name="p_unit" value="${dto.getP_unit()}" placeholder="단위명 필수 입력" required>
                    </td>
                </tr>  
                               
                <tr>
                    <th>
                       	 포장타입
                    </th>

                    <td>
                        <input type="text" class="form_input" id="p_wrap" name="p_wrap" value="${dto.getP_wrap()}" required>
                    </td>
                </tr>
                
                <tr>
                    <th>
                       	 포장타입 상세
                    </th>

                    <td>
                        <input type="text" class="form_input" id="p_wrap_cont" name="p_wrap_cont" value="${dto.getP_wrap_cont()}" placeholder="택배배송은 에코포장이 스티로폼으로 대체됩니다." required>
                    </td>
                </tr>                
                               
                <tr>

                <tr>
                    <th>
                       	 재고수량
                    </th>

                    <td>
                        <input type="number" class="form_input" id="p_qty" name="p_qty" value="${dto.getP_qty()}" placeholder="숫자만 입력" required>
                    </td>
                </tr>
                
                <tr>
                    <th>
                       	 판매량
                    </th>

                    <td>
                        <input type="number" class="form_input" id="p_sold" name="p_sold" value="${dto.getP_sold()}" placeholder="숫자만 입력" required>
                    </td>
                </tr> 

                <tr>
                    <th>
                       	 상품이미지
                    </th>

                    <td>
                        <input type="file" class="form_input" id="p_img" name="p_img" value="${dto.getP_image()}">
                    </td>
                </tr>  
 
                 <tr>
                    <th>
                       	 상품설명 이미지
                    </th>

                    <td>
                        <input type="file"  class="form_input" id="p_contents" name="p_contents">
                    </td>
                </tr>
                   
                 <tr>
                    <th>
                       	 상세정보 이미지
                    </th>

                    <td>
                        <input type="file" class="form_input" id="p_contents_spec" name="p_contents_spec">
                    </td>
                </tr> 
              
            </table>
            
            <div class="form_footer">
            	<button class="btn_act" id="submit" >상품수정</button>
            </div>
        </form>
						</div>
					</div> <%-- page_section section_myinfo end --%>
				</div> <%-- page_aticle aticle_type2 end --%>			

		</div> <%-- infoModify_content end --%>	
	</div> <%-- infoModify_main end --%>
	
	
	
		
	<jsp:include page="../include/footer.jsp"/>

</html>