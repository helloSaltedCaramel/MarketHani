
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>    
<%--
 <link rel="stylesheet" type="text/css" href="../css/footer.css"/>
--%>	
        
   <%-- footer --%>
   <div id="footer">
      <div class="top_footer">
         <div class="footer_left">
              <h2 class="tit_cc">고객행복센터</h2>
              <div class="cc_view cc_call">
                    <h3><span class="tit">7777-7777</span></h3>
                     <dl class="list">
	                     <dt>365고객센터</dt>
	                     <dd>오전 7시 - 오후 7시</dd>
                     </dl>
                 </div>
                 <div class="cc_view cc_kakao">
                     <h3><span class="tit" >카카오톡 문의</span></h3>                            
                     <dl class="list">
	                     <dt>365고객센터 </dt>
	                     <dd>카카오톡에서 마켓하니 채널 추가 후 문의</dd>
                     </dl>
                 </div>
                 <div class="cc_view cc_qna">
                      <h3><span class="tit">1:1 문의</span></h3>
                      <dl class="list">
                          <dt>24시간 접수 가능</dt>
                          <dd>고객센터 운영시간에 순차적으로 답변해드리겠습니다.</dd>
                      </dl>
                 </div>        
         </div> <%-- footer_left end --%>


         <div class="footer_right">
              <ul class="list">
                  <li><a class="link" href="#">회사소개</a></li>
                  <li><a class="link" href="#">회사소개영상</a></li>
                  <li><a class="link" href="#">인재채용</a></li>
                  <li><a class="link" href="#">이용약관</a></li>
                  <li><a class="link" href="#">개인정보처리방침</a></li>
                  <li><a class="link" href="#">이용안내</a></li>
              </ul>
                         법인명 (상호) : 주식회사 하니 <span class="bar">I</span> 사업자등록번호 : 777-77-77777 
              <br>
                         통신판매업 : 제 2021-서울00-00000 호 <span class="bar">I</span> 개인정보보호책임자 : 000
              <br>
                         주소 : 서울특별시 마포구 월드컵북로 21, 2층 <span class="bar">I</span> 대표이사 : 000
              <br>
                         입점문의 또는 제휴문의 : <a href="mailto:business@hanicorp.com" class="link">business@hanicorp.com</a>
              <br>
                         채용문의 : <a href="mailto:recruit@hanicorp.com" class="link">recruit@hanicorp.com</a>
              <br>
                         팩스: 070 - 7777 - 7777 <span class="bar">I</span> 이메일 : <a href="mailto:help@hanicorp.com" class="link">help@hanicorp.com</a>
              <br>
              <em class="copy">© HANI CORP. ALL RIGHTS RESERVED</em>
              <br>
              <ul class="right_sns">
                  <li><a href="https://instagram.com/" class="sns_link">
                         <img src="<%=request.getContextPath() %>/img/footer/icon_instagram.png" alt="인스타그램">
                      </a>
                  </li>
                  <li>
                      <a href="https://www.facebook.com/" class="sns_link">
                         <img src="<%=request.getContextPath() %>/img/footer/icon_facebook.png" alt="페이스북">
                      </a>
                  </li>
                  <li>
                      <a href="http://blog.naver.com/" class="sns_link">
                          <img src="<%=request.getContextPath() %>/img/footer/icon_blog.png" alt="블로그">
                      </a>
                  </li>
                   <li>
                       <a href="https://m.post.naver.com/" class="sns_link">
                           <img src="<%=request.getContextPath() %>/img/footer/icon_npost.png" alt="포스트">
                       </a>
                  </li>
                  <li>
                        <a href="https://www.youtube.com/" class="sns_link">
                            <img src="<%=request.getContextPath() %>/img/footer/icon_youtube.png" alt="유튜브">
                        </a>
                  </li>
                </ul> 
           </div> <%--footer_right end --%>
       </div> <%-- top_footer end--%>

       <div class="footer_bottom">
            <div class="authentication">
                  <a href="#" onclick="popup('https://res.kurly.com/pc/img/1909/img_isms.jpg',550,700);return false;"
                   class="mark" target="_blank">
                      <img src="<%=request.getContextPath() %>/img/footer/logo_isms.png" alt="isms 로고" class="logo">
                          <p class="txt">
                             [인증범위] 0000 쇼핑몰 서비스 개발 · 운영<br>
                             [유효기간] 0000.00.00 ~ 0000.00.00
                          </p>
                   </a>
                   <a href="#" onclick="popup('https://www.eprivacy.or.kr/front/certifiedSiteMark/certifiedSiteMarkPopup.do?certCmd=EP&amp;certNum=2021-EP-R003',527,720);return false;"
                    class="mark" target="_blank">
                      <img src="<%=request.getContextPath() %>/img/footer/logo_eprivacyplus.png" alt="eprivacy plus 로고" class="logo">
                          <p class="txt">
                                                     개인정보보호 우수 웹사이트 ·<br>
                                                     개인정보처리시스템 인증 (ePRIVACY PLUS)
                           </p>
                    </a>
                    <a href="#" onclick="popup('http://pgweb.uplus.co.kr/ms/escrow/s_escrowYn.do?mertid=go_thefarmers',460,550);return false;"
                     class="mark lguplus" target="_blank">
                       <img src="<%=request.getContextPath() %>/img/footer/logo_payments.png" alt="payments 로고" class="logo">
                           <p class="txt">
				                           고객님의 안전거래를 위해 현금 등으로 결제 시 저희 쇼핑몰에서 가입한<br>
				                           토스 페이먼츠 구매안전(에스크로) 서비스를 이용하실 수 있습니다.
                           </p>
                     </a>
            </div> <%-- authentication end--%>
       </div> <%-- footer_bottom end--%>
   </div> <%-- footer --%>

  
</body>
</html> 