
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%--
<head>

    <meta charset="UTF-8">
    <title>마켓하니 :: 내일의 장보기 마켓하니</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css"/>
    <link rel="icon" href="../img/favicon/favicon-32x32.ico" type="image/x-icon" sizes="16x16">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script defer src="../js/header/header.js"></script>
    <script defer src="../js/header/location_postcode.js"></script>

</head>
--%>
<body>
    <div id="header"> 
        <div id="header1">
        <ul class="header1_menu">
            <li class="menu join"><a href="<%=request.getContextPath() %>/user/user_register.jsp" class="link_menu">회원가입</a></li>
            <li class="menu login"><a href="<%=request.getContextPath() %>/user/user_login.jsp" class="link_menu">로그인</a></li> 
            <li class="menu csCenter"><a href="#" class="link_menu">고객센터</a>
                <ul class="cs_sub">
                    <li><a href="#">공지사항</a></li>
                    <li><a href="#">자주하는 질문</a></li>
                    <li><a href="#">1:1 문의</a></li>
                    <li><a href="#">대량주문 문의</a></li>
                    <li><a href="#">상품 제안</a></li>
                    <li><a href="#">에코포장 피드백</a></li>
                </ul>
            </li>
        </ul>
        <div class="claerfix"></div>
        </div> <!-- header1 끝 -->
        <!-- header2 시작  -->               
        <div id="header2" class="layout-wrapper">
            <h1 class="logo">
                <a href="${pageContext.request.contextPath}/main.jsp" class="link_main">
                    <img src="<%=request.getContextPath() %>/img/header/logo_hani_header.png" alt="마켓컬리 로고">
                </a>
            </h1>
        </div> <!--header2 끝-->
        <!-- header3 시작-->
        <div id="header3">
            <div class="gnb_kurly">
                <div class="inner_gnbkurly">
                    <div class="gnb_main">
                        <ul class="gnb">
                            <li class="menu1">
                                <a href="#">
                                    <span id="icon" class="ico"></span>
                                    <span class="total_txt" id="total_category">전체 카테고리</span>
                                </a>
                            </li>
                            <li class="menu2">
                                <a href="<%=request.getContextPath() %>/user_new.do" class="link new "><span class="txt">신상품</span></a>
                            </li>
                            <li class="menu3">
                                <a href="<%=request.getContextPath() %>/user_best.do" class="link best "><span class="txt">베스트</span></a>
                            </li>
                            <li class="menu4">
                                <a href="<%=request.getContextPath() %>/user_onsale.do" class="link sale "><span class="txt">알뜰쇼핑</span></a>
                            </li>
                            <li class="menu5">
                                <a href="#" class="link event "><span class="txt">특가/혜택</span></a>
                            </li>
                        </ul> <!-- gnb end -->
                        
                        <!-- 검색창 -->
                        <div id="side_search" class="gnb_search">
                            <form action="/">
                                    <input type="text" placeholder="검색어를 입력해주세요." class="inp_search"> 
                                    <input type="image" src="<%=request.getContextPath() %>/img/header/icon_search.png" class="search_icon">
                            </form>          
                        </div> <!-- 검색창 end -->
                        
                        <!-- 주소 검색 -->
                        <div class="gnb_location">
                            <div class="location_zone">
                                <input type="image" src="<%=request.getContextPath() %>/img/header/icon_map.png" class="location_icon">
                            </div>
                            <div class="location_layer">
                                <div class="address_block">
                                    <div class="address_text">
                                        <span class="emphasis">배송지를 등록</span>
                                        	하고
                                        <br>
                                        	구매가능한 상품을 확인하세요!
                                    </div>
                                    <div class="address_btns">
                                        <button type="button" class="double address_login">로그인</button>
                                        <button type="button" class="double address_search" onclick="getPostcode()">주소검색</button>
                                    </div>
                                </div>
                            </div>
                        </div> <!-- 주소 검색 end -->   
                        <!-- 장바구니 -->                                  
                        <div class="gnb_cart">
                            <div class="inner_cart">
                                <a href="<%=request.getContextPath() %>/user/user_cart.jsp" class="cart_btn">
                                    <img src="<%=request.getContextPath() %>/img/header/icon_cart.png" class="cart_icon">
                                </a>
                            </div>
                        </div> <!-- 장바구니 end -->   
                    </div> <!-- gnb_main end -->
                    <!-- 카테고리 div -->
                    <div class="gnb_sub">
                    <div class="inner_sub">
                        <ul class="gnb_menu">
                            <li>
                                <a href="user_category.do?category=A" class="menu">
                                    <span class="ico">
                                        <img src="${pageContext.request.contextPath}/img/header/category_icon/icon_veggies_inactive_pc@2x.1586324570.png">
                                    </span>
                                    <span class="tit">
                                        <span class="text">채소</span>
                                    </span>
                                </a>
                                <ul class="sub_menu">
                                    <li>
                                        <a class="sub" href="user_category.do?category=A1">
                                            <span class="name">친환경</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="sub" href="user_category.do?category=A2">
                                            <span class="name">고구마, 감자, 당근</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="sub">
                                            <span class="name">시금치, 쌈채소, 나물</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="sub">
                                            <span class="name">오이, 호박, 고추</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="sub">
                                            <span class="name">콩나물, 버섯</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>

                            <li>
                                <a href="#" class="menu">
                                    <span class="ico">
                                        <img src="${pageContext.request.contextPath}/img/header/category_icon/icon_fruit_inactive_pc@2x.1568684150.png">
                                    </span>
                                    <span class="tit">
                                        <span class="text">과일, 견과, 쌀</span>
                                    </span>
                                </a>
                                <ul class="sub_menu">
                                    <li>
                                        <a class="sub">
                                            <span class="name">제철과일</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="sub">
                                            <span class="name">국산과일</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="sub">
                                            <span class="name">수입과일</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="sub">
                                            <span class="name">간편과일</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="sub">
                                            <span class="name">견과류</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>

                            <li>
                                <a href="#" class="menu">
                                    <span class="ico">
                                        <img src="${pageContext.request.contextPath}/img/header/category_icon/icon_snacks_inactive_pc@2x.1572243615.png">
                                    </span>
                                    <span class="tit">
                                        <span class="text">생수, 음료, 우유, 커피</span>
                                    </span>
                                </a>
                                <ul class="sub_menu">
                                    <li>
                                        <a class="sub">
                                            <span class="name">생수, 탄산수</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="sub">
                                            <span class="name">음료, 주스</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="sub">
                                            <span class="name">우유, 두유, 요거트</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="sub">
                                            <span class="name">커피</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="sub">
                                            <span class="name">차</span>
                                        </a>
                                    </li>
                                </ul>                            
                            </li>

                            <li>
                                <a href="#" class="menu">
                                    <span class="ico">
                                        <img src="${pageContext.request.contextPath}/img/header/category_icon/icon_convenient_inactive_pc@2x.1572243542.png">
                                    </span>
                                    <span class="tit">
                                        <span class="text">샐러드, 간편식</span>
                                    </span>
                                </a>
                                <ul class="sub_menu">
                                    <li>
                                        <a class="sub">
                                            <span class="name">샐러드, 닭가슴살</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="sub">
                                            <span class="name">도시락, 밥류</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="sub">
                                            <span class="name">파스타, 면류</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="sub">
                                            <span class="name">떡볶이, 튀김, 순대</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="sub">
                                            <span class="name">피자, 핫도그, 만두</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="sub">
                                            <span class="name">폭립, 떡갈비, 안주</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="sub">
                                            <span class="name">선식, 시리얼</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="sub">
                                            <span class="name">기타 간편식</span>
                                        </a>
                                    </li>
                                </ul>                            
                            </li>

                            <li>
                                <a href="#" class="menu">
                                    <span class="ico">
                                        <img src="${pageContext.request.contextPath}/img/header/category_icon/icon_deli_inactive_pc@2x.1568687352.png">
                                    </span>
                                    <span class="tit">
                                        <span class="text">베이커리, 치즈, 델리</span>
                                    </span>
                                </a>
                                <ul class="sub_menu">
                                    <li>
                                        <a class="sub">
                                            <span class="name">식빵, 빵류</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="sub">
                                            <span class="name">잼, 버터, 스프레드</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="sub">
                                            <span class="name">케이크, 파이, 디저트</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="sub">
                                            <span class="name">치즈</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="sub">
                                            <span class="name">델리</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="sub">
                                            <span class="name">올리브, 피클</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>

                            <li>
                                <a href="#" class="menu">
                                    <span class="ico">
                                        <img src="${pageContext.request.contextPath}/img/header/category_icon/icon_seafood_inactive_pc@2x.1568684352.png">
                                    </span>
                                    <span class="tit">
                                        <span class="text">수산, 해산, 건어물</span>
                                    </span>
                                </a>

                                <ul class="sub_menu">
                                    <li>
                                        <a class="sub">
                                            <span class="name">
                                                <img src="http://pixelartmaker-data-78746291193.nyc3.digitaloceanspaces.com/image/2fd666dddb91de1.png">
                                            </span>
                                        </a>
                                    </li>
                                </ul>
                            </li>

                            <li>
                                <a href="#" class="menu">
                                    <span class="ico">
                                        <img src="${pageContext.request.contextPath}/img/header/category_icon/icon_meat_inactive_pc@2x.1568684452.png">
                                    </span>
                                    <span class="tit">
                                        <span class="text">정육, 계란</span>
                                    </span>
                                </a>

                                <ul class="sub_menu">
                                    <li>
                                        <a class="sub">
                                            <span class="name">
                                                <img src="http://pixelartmaker-data-78746291193.nyc3.digitaloceanspaces.com/image/2fd666dddb91de1.png">
                                            </span>
                                        </a>
                                    </li>
                                </ul>
                            </li>

                            <li>
                                <a href="#" class="menu">
                                    <span class="ico">
                                        <img src="${pageContext.request.contextPath}/img/header/category_icon/icon_side_inactive_pc@2x.1572243579.png">
                                    </span>
                                    <span class="tit">
                                        <span class="text">국, 반찬, 메인요리</span>
                                    </span>
                                </a>

                                <ul class="sub_menu">
                                    <li>
                                        <a class="sub">
                                            <span class="name">
                                                <img src="http://pixelartmaker-data-78746291193.nyc3.digitaloceanspaces.com/image/2fd666dddb91de1.png">
                                            </span>
                                        </a>
                                    </li>
                                </ul>
                            </li>

                            <li>
                                <a href="#" class="menu">
                                    <span class="ico">
                                        <img src="${pageContext.request.contextPath}/img/header/category_icon/icon_sauce_inactive_pc@2x.1572243594.png">
                                    </span>
                                    <span class="tit">
                                        <span class="text">면, 양념, 오일</span>
                                    </span>
                                </a>

                                <ul class="sub_menu">
                                    <li>
                                        <a class="sub">
                                            <span class="name">
                                                <img src="http://pixelartmaker-data-78746291193.nyc3.digitaloceanspaces.com/image/2fd666dddb91de1.png">
                                            </span>
                                        </a>
                                    </li>
                                </ul>
                            </li>

                            <li>
                                <a href="#" class="menu">
                                    <span class="ico">
                                        <img src="${pageContext.request.contextPath}/img/header/category_icon/icon_cookie_inactive_pc.1610074008.png">
                                    </span>
                                    <span class="tit">
                                        <span class="text">간식, 과자, 떡</span>
                                    </span>
                                </a>

                                <ul class="sub_menu">
                                    <li>
                                        <a class="sub">
                                            <span class="name">
                                                <img src="http://pixelartmaker-data-78746291193.nyc3.digitaloceanspaces.com/image/2fd666dddb91de1.png">
                                            </span>
                                        </a>
                                    </li>
                                </ul>
                            </li>

                            <li>
                                <a href="#" class="menu">
                                    <span class="ico">
                                        <img src="${pageContext.request.contextPath}/img/header/category_icon/icon_health_inactive_pc@2x.1574645922.png">
                                    </span>
                                    <span class="tit">
                                        <span class="text">건강식품</span>
                                    </span>
                                </a>

                                <ul class="sub_menu">
                                    <li>
                                        <a class="sub">
                                            <span class="name">
                                                <img src="http://pixelartmaker-data-78746291193.nyc3.digitaloceanspaces.com/image/2fd666dddb91de1.png">
                                            </span>
                                        </a>
                                    </li>
                                </ul>
                            </li>

                            <li>
                                <a href="#" class="menu">
                                    <span class="ico">
                                        <img src="${pageContext.request.contextPath}/img/header/category_icon/icon_seafood_inactive_pc@2x.1568684352.png">
                                    </span>
                                    <span class="tit">
                                        <span class="text">스킨케어, 메이크업</span>
                                    </span>
                                </a>

                                <ul class="sub_menu">
                                    <li>
                                        <a class="sub">
                                            <span class="name">
                                                <img src="http://pixelartmaker-data-78746291193.nyc3.digitaloceanspaces.com/image/2fd666dddb91de1.png">
                                            </span>
                                        </a>
                                    </li>
                                </ul>
                            </li>

                            <li>
                                <a href="#" class="menu">
                                    <span class="ico">
                                        <img src="${pageContext.request.contextPath}/img/header/category_icon/icon_beauty_inactive_pc.1618488987.png">
                                    </span>
                                    <span class="tit">
                                        <span class="text">헤어, 바디, 구강</span>
                                    </span>
                                </a>

                                <ul class="sub_menu">
                                    <li>
                                        <a class="sub">
                                            <span class="name">
                                                <img src="http://pixelartmaker-data-78746291193.nyc3.digitaloceanspaces.com/image/2fd666dddb91de1.png">
                                            </span>
                                        </a>
                                    </li>
                                </ul>
                            </li>

                            <li>
                                <a href="#" class="menu">
                                    <span class="ico">
                                        <img src="${pageContext.request.contextPath}/img/header/category_icon/icon_kitchen_inactive_pc@2x.1574646457.png">
                                    </span>
                                    <span class="tit">
                                        <span class="text">주방용품</span>
                                    </span>
                                </a>

                                <ul class="sub_menu">
                                    <li>
                                        <a class="sub">
                                            <span class="name">
                                                <img src="http://pixelartmaker-data-78746291193.nyc3.digitaloceanspaces.com/image/2fd666dddb91de1.png">
                                            </span>
                                        </a>
                                    </li>
                                </ul>
                            </li>

                            <li>
                                <a href="#" class="menu">
                                    <span class="ico">
                                        <img src="${pageContext.request.contextPath}/img/header/category_icon/icon_kids_inactive_pc@2x.1568687537.png">
                                    </span>
                                    <span class="tit">
                                        <span class="text">베이비, 키즈, 완구</span>
                                    </span>
                                </a>

                                <ul class="sub_menu">
                                    <li>
                                        <a class="sub">
                                            <span class="name">
                                                <img src="http://pixelartmaker-data-78746291193.nyc3.digitaloceanspaces.com/image/2fd666dddb91de1.png">
                                            </span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div> <!-- 카테고리 end -->
                </div> <!-- inner_gnbkurly end -->
            </div> <!-- gnb_kurly end -->  
        </div> <!-- header3 end -->
    </div> <!-- 전체 헤더 end -->
<%--
</body>
</html>
 --%>