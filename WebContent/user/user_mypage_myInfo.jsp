<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>

    <%-- import infoModify.css --%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/my_infoModify.css"/>

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
    <title>마켓하니 :: 내일의 장보기 마켓하니</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/register.css">
    <link rel="icon" href="${pageContext.request.contextPath}/img/favicon/favicon-32x32.ico" type="image/x-icon" sizes="16x16">
    <script defer src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script defer src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script defer src="${pageContext.request.contextPath}/js/register/register_postcode.js"></script>
    <script defer src="${pageContext.request.contextPath}/js/register/register_regex.js"></script>


</head>

<body>

	<jsp:include page="../include/header.jsp"/>
	

	<div id="infoModify_main">
	<c:set var="dto" value="${userData}"/>
		<div id="infoModify_content"> 

				<div class="page_aticle aticle_type2">
				
				    <%-- 마이 할리 좌측 메뉴 --%> 
					<div id="snb" class="snb_my">
						<h2 class="tit_snb">마이할리</h2>
						<div class="inner_snb">
							<ul class="list_menu">
								<li>
									<a href="${pageContext.request.contextPath}/user_mypage_orderHistory.do">주문 내역</a>
								</li>
								<li>
									<a href="">적립금</a>
								</li>
								<li>
									<a href="">상품 후기</a>
								</li>
								<li>
									<a href="">상품 문의</a>
								</li>
								<li>
									<a href="#">개인 정보 수정</a>
								</li>
							</ul>
						</div>
					</div>
					
					<%-- 마이 할리 중 개인 정보 수정 파트 부분 --%>
					<div class="page_section section_myinfo">
						<div class="head_aticle">
							<h2 class="tit">개인 정보 수정</h2>
						</div>
						<div class="type_form member_join member_mod">
							<form id="registForm" action="${pageContext.request.contextPath}/user_modify.do" method="post">
								
								<table class="tbl_comm">
									<tbody>
										<tr class="fst">
											<th>아이디</th>
											<td>
											<input type="text" value="${user_id }" class="inp_read" readonly>
											</td>
										</tr>
										<tr>
											<th>현재 비밀번호</th>
											<td>
											<input type="password" name="originalPassword" id="originalPassword" ">
											<input type="hidden" name="originalPasswordCheck" >
											</td>
										</tr>
										<tr class="member_pwd">
											<th>새 비밀번호</th>
											<td>
												<input type="password" name="newPassword" id="newPassword" label="새 비밀번호" maxlength="16" class="reg_pw">
												<input type="hidden" name="newPasswordCheck" >				
											</td>
										</tr>
										<tr class="member_pwd">
											<th>새 비밀번호 확인</th>
											<td>
												<input type="password" name="confirmPassword" id="confirmPassword" label="새 비밀번호 확인" maxlength="16" class="confirm_pw">
												<input type="hidden" name="newPasswordCheck" >				
											</td>
										</tr>
										<tr>
											<th>이메일</th>
											<td>
												<input type="text" name="email" value="${dto.getUser_email()}" size="80" label="이메일" placeholder="예: marketkurly@kurly.com">
												<button id="btn_cert" class="btn default" type="button">중복확인</button>
											</td>
										</tr>
										<tr class="field_phone">
											<th>휴대폰</th>
											<td>
											<div class="phone_num">
												<input type="text" value="${dto.getUser_phone()}"  name="mobileInp" placeholder="숫자만 입력해주세요" class="inp">											
												<button id="btn_cert" class="btn default" type="button">다른번호 인증</button>
											</div>
											</td>
										</tr>
										<tr class="select_sex">
											<th>성별</th>
											<td>
												<label class="">
													<input type="radio" name="sex" value="m">
													<span class="ico"></span>남자
												</label>
												<label class="checked">
													<input type="radio" name="sex" value="w" checked="checked">
													<span class="ico"></span>여자
												</label>
												<label class="">
													<input type="radio" name="sex" value="n">
													<span class="ico"></span>선택안함
												</label>
											</td>
										</tr>
										<tr class="birth field_birth">
											<th>생년월일</th>
											<td>
											<div class="birth_day">
												<input class="birth_input"  type="text" name="year" id="birth_year" maxlength="4" placeholder="YYYY">
												<span class="bar"></span>
												<input class="birth_input"  type="text" name="month" id="birth_month"  maxlength="2" placeholder="MM">
												<span class="bar"></span>
												<input class="birth_input"  type="text" name="day" id="birth_day"  maxlength="2" placeholder="DD">
											</div>
											</td>
										</tr>
										<tr>
											<th>선택약관 동의 </th>
											<td class="reg_agree">
											<div class="check_view">
												<input type="hidden" id="consentHidden" name="consent[1]" value="">
												<label class="label_block check_agree ">
													<input type="checkbox" name="hiddenCheck">
													<span class="ico"></span>개인정보 수집·이용 동의 <span class="sub">(선택)</span>
												</label>
												<a href="#none" class="link btn_link btn_choice">약관보기 </a>
											</div>
																			
											</td>
										</tr>
										<tr class="reg_agree">
											<th>이용약관동의</th>
											<td>
												<div class="bg_dim"></div>
												<div class="check_view">
													<label class="label_block check_agree checked">
														<input type="checkbox" name="marketing" value="y" checked="checked">
														<span class="ico"></span>무료배송, 할인쿠폰 등 혜택/정보 수신 동의 <span class="sub">(선택)</span>
													</label>
												<div class="check_event email_sms">
													<label class="label_block check_agree checked">
														<input type="checkbox" name="sms" value="y" checked="checked">
														<span class="ico"></span>SMS
													</label>
													<label class="label_block check_agree checked">
														<input type="checkbox" name="mailling" value="y" checked="checked">
														<span class="ico"></span>이메일
													</label>
												</div>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							
								<div id="formSubmit" class="form_footer">
									<button type="button" class="btn default"onclick="">탈퇴하기</button>
									<button type="button" class="btn active" onclick="">회원정보수정</button>								
								</div>
							</form>	
						</div>
					</div> <%-- page_section section_myinfo end --%>
				</div> <%-- page_aticle aticle_type2 end --%>			

		</div> <%-- infoModify_content end --%>	
	</div> <%-- infoModify_main end --%>
	
	
	
		
	<jsp:include page="../include/footer.jsp"/>

</html>