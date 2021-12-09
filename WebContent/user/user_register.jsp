<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
    <title>마켓하니 :: 오늘의 장보기, 마켓하니</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/register.css">
    <link rel="icon" href="${pageContext.request.contextPath}/img/favicon/favicon-32x32.ico" type="image/x-icon" sizes="16x16">
    <script defer src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script defer src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script defer src="${pageContext.request.contextPath}/js/register/register_postcode.js"></script>
    <script defer src="${pageContext.request.contextPath}/js/register/register_regex.js"></script>

</head>
<body>
		<jsp:include page="/include/header.jsp"/>
	
    <div class="container">
        <div class="title">
            <h1 class="title">회원가입</h1>
        </div>
        <p class="remark">
            <span class="essential">*</span>
            	필수입력사항
        </p>
        <form id="registForm" action="${pageContext.request.contextPath}/user_register.do" method="post">
            <table class="reg_table">
                <tr>
                    <th>
                        	아이디
                        <span class="essential">*</span>
                    </th>

                    <td>
                        <input class="form_input" id="form_id" type="text" name="reg_id" maxlength="15" placeholder="6자 이상의 영문, 숫자를 입력">
                    </td>

                    <td>
                        <button class="distinct_btn" type="button" onclick="id_check()">중복확인</button>
                    </td>
                </tr> <!-- 아이디 end -->

                <tr>
                    <th>
                       	 비밀번호
                        <span class="essential">*</span>
                    </th>

                    <td>
                        <input class="form_input" id="pw" type="password" name="reg_pw" placeholder="비밀번호를 입력해주세요 (10자 이상, 영문숫자혼합)">
                    </td>
                </tr> <!-- 비밀번호 end -->

                <tr>
                    <th>
                       	 비밀번호확인
                        <span class="essential">*</span>
                    </th>

                    <td>
                        <input class="form_input" id="pw_check" type="password" name="reg_pwCheck" placeholder="비밀번호를 한번 더 입력해주세요">
                        <p class="guide" id="pw_guide">text</p>
                    </td>
                </tr> <!-- 비밀번호확인 end -->

                <tr>
                    <th>
                       	 이름
                        <span class="essential">*</span>
                    </th>

                    <td>
                        <input class="form_input" id="name" type="text" name="reg_name" maxlength="7" placeholder="이름을 입력해주세요">
                        <p class="guide" id="name_guide">text</p>
                    </td>
                </tr> <!-- 이름 end -->

                <tr>
                    <th>
                        	이메일
                        <span class="essential">*</span>
                    </th>

                    <td>
                        <input class="form_input" id="email" type="email" name="reg_email" placeholder="예:marketkurly@kurly.com">
                        <p class="guide" id="email_guide">text</p>
                    </td>
                </tr> <!-- 이메일 end -->

                <tr>
                    <th>
                        	휴대폰
                        <span class="essential">*</span>
                    </th>

                    <td>
                        <input class="form_input" id="phone" type="text" name="reg_phone" maxlength="11" placeholder="숫자만 입력해주세요">
                        <p class="guide" id="phone_guide">text</p>
                    </td>
                </tr> <!-- 휴대폰 end -->

                <tr>
                    <th>
                        	주소
                        <span class="essential">*</span>
                    </th>

                    <td>
                        <input class="form_input" id="zipcode" type="hidden">
                        <input class="form_input" id="address" type="text" name="reg_address" placeholder="주소입력" readonly>
                        <input class="form_input" id="address_detail" type="text" name="reg_address_detail" placeholder="상세주소입력">
                    </td>

                    <td>
                        <button class="find_address" type="button"  onclick="getPostcode()">
                            <span>주소 검색</span>
                        </button>
                    </td>
                </tr> <!-- 주소 end -->

                <tr>
                    <th id="gender">
                        	성별
                    </th>

                    <td>
                        <div class="gender_block" style="display: block;">
                            <label>
                                <input class="radio_input" type="radio" name="reg_gender" value="male">
                                <span>남자</span>
                            </label>

                            <label>
                                <input class="radio_input" type="radio" name="reg_gender" value="female">
                                <span>여자</span>
                            </label>
                            
                            <label>
                                <input class="radio_input" type="radio" name="reg_gender" value="none" checked>
                                <span>선택안함</span>
                            </label>
                        </div>
                    </td>
                </tr> <!-- 성별 end -->

                <tr>
                    <th class="birth_row">
                        	생년월일
                    </th>

                    <td>
                        <div class="birth_block">
                            <input class="birth_input" id="birth_year" type="text" name="year" placeholder="YYYY" maxlength="4">
                            <span>/</span>
                            <input class="birth_input" id="birth_month" type="text" name="month" placeholder="MM" maxlength="2">
                            <span>/</span>
                            <input class="birth_input" id="birth_day" type="text" name="day" placeholder="DD" maxlength="2">
                        </div>
                        <p class="guide" id="birth_guide">text</p>
                    </td>
                </tr> <!-- 생년월일 end -->

                <tr class="terms_row">
                    <th>
                        	이용약관 동의
                        <span class="essential">*</span>
                    </th>

                    <td colspan="2">
                        <div class="check_all">
                            <label class="all_label">
                                <input id="all_checkbox" type="checkbox" name="all_check" onclick="allCheck()">
                                	전체 동의합니다.
                            </label>
                            <p class="sub">필수 약관에 동의하지않으면 서비스를 이용하실 수 없습니다.</p>
                        </div>

                        <div class="check">
                            <label class="required_label">
                                <input id="use_checkbox" type="checkbox" name="use_term">
                                	이용약관 동의
                            </label>
                            <span class="required">(필수)</span>
                        </div>

                        <div class="check">
                            <label class="required_label">
                                <input id="info_use_checkbox" type="checkbox" name="info_use_term">
                               	 개인정보 수집 · 이용 동의
                            </label>
                            <span class="required">(필수)</span>
                        </div>

                        <div class="check" id="last">
                            <label class="required_label">
                                <input id="age_checkbox" type="checkbox" name="age_term">
                                	본인은 만 14세 이상입니다.
                            </label>
                            <span class="required">(필수)</span>
                        </div>
                    </td>
                </tr>
            </table>
            <button type="button" id="submit_btn" onclick="regist()">가입하기</button>
        </form>
    </div>
    
    <jsp:include page="/include/footer.jsp"/>
<%--
</body>
</html> 
--%>