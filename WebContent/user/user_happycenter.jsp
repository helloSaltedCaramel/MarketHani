<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마켓하니 :: 오늘의 장보기, 마켓하니</title>
</head>
<body>

 <div className="happy_Center">
        <div className="happy">
          <h4 className="tit">고객행복센터</h4>
          <span className="emph">
            궁금하신 점이나 서비스 이용에 불편한 점이 있을까요?
          </span>
          <p>
            문제가 되는 부분을 사진으로 찍어 아래 중 편하신 방법으로 접수해
            주시면 빠르게 도와드리겠습니다.
          </p>
          <ul className="list">
            <li>
              <div className="tit">전화 문의 1644-1107</div>
              <div className="sub">오전 7시 ~ 오후 7시 (연중무휴)</div>
            </li>
            <li>
              <div className="tit">카카오톡 문의</div>
              <div className="sub">오전 7시 ~ 오후 7시 (연중무휴)</div>
              <div className="expend">
                카카오톡에서 '마켓컬리'를 검색 후 대화창에 문의 및 불편사항을
                남겨주세요.
              </div>
            </li>
            <li>
              <div className="tit">홈페이지 문의</div>
              <div className="sub">
                24시간 접수 가능
                <br />
                로그인 > 마이컬리 > 1:1문의
              </div>
              <div className="expend">
                고객센터 운영 시간에 순차적으로 답변해드리겠습니다.
              </div>
            </li>
          </ul>
          <div className="happyUnfold fst">
            <div className="fstLeft">
              <h4 className="tit">교환 및 환불안내</h4>
              <p className="sub">
                교환 및 환불이 필요하신 경우 고객행복센터로 문의해주세요.
              </p>
            </div>
            <div className="fstRight">
              <button className="asked" onClick={this.unfoldBtn}>
                <span className="foldBtnTxt">
                  {this.state.isUnfold ? "닫기" : "자세히 보기"}
                </span>
                <i
                  className={
                    this.state.isUnfold
                      ? "fas fa-chevron-up"
                      : "fas fa-chevron-down"
                  }
                />
              </button>
            </div>
          </div>
          {this.state.isUnfold && (
            <ul className="happyFaqList">
              <li className="happyFaq">
                <span className="item">01. 상품에 문제가 있는 경우</span>
                <div className="refund">
                  <p className="desc">
                    받으신 상품이 표시, 광고 내용 또는 계약 내용과 다른 경우에는
                    상품을 받은 날부터 3개월 이내,
                  </p>
                  <p className="desc">
                    그 사실을 알게 된 날로부터 30일 이내에 교환 및 환불을
                    요청하실 수 있습니다.
                  </p>
                  <p className="desc">
                    상품의 정확한 상태를 확인할 수 있도록 사진을 함께 보내주시면
                    더 빠른 상담이 가능합니다.
                  </p>
                  <br />
                  <p className="desc">
                    ※ 상품에 문제가 있는 것으로 확인되면 배송비는 컬리가
                    부담합니다.
                  </p>
                </div>
              </li>

              <li className="happyFaq">
                <span className="item">02. 단순 변심, 주문 착오의 경우</span>
                <div className="refund">
                  <p className="desc">
                    <span className="tit">신선 / 냉장 / 냉동 식품</span>
                    <br />
                    재판매가 불가한 상품의 특성 상, 단순 변심, 주문 착오 시 교환
                    및 반품이 어려운 점 양해 부탁드립니다. <br />
                    상품에 따라 조금씩 맛이 다를 수 있으며, 개인의 기호에 따라
                    같은 상품도 다르게 느끼실 수 있습니다.
                  </p>
                  <br />
                  <p className="desc">
                    <span className="tit">
                      유통기한 30일 이상 식품(신선 / 냉장 / 냉동 제외) &
                      기타상품
                    </span>
                    <br />
                    상품을 받은 날부터 7일 이내에 고객행복센터로 문의해주세요.
                    <br />
                    <br />
                    ※ 단순 변심으로 인한 교환 또는 환불의 경우 고객님께서 배송비
                    6,000원을 부담하셔야 합니다.
                    <br />
                    (주문 건 배송비를 결제하셨을 경우 3,000원)
                  </p>
                </div>
              </li>

              <li className="happyFaq">
                <span className="item">03. 교환 반품이 불가한 경우</span>
                <div className="refund">
                  <p className="desc">
                    다음에 해당하는 교환•환불 신청은 처리가 어려울 수 있으니
                    양해 부탁드립니다.
                  </p>
                  <p className="desc">
                    • 고객님의 책임 있는 사유로 상품이 멸실되거나 훼손된 경우
                    <br />
                    (단, 상품의 내용을 확인하기 위해 포장 등을 훼손한 경우는
                    제외)
                  </p>
                  <p className="desc">
                    •고객님의 사용 또는 일부 소비로 상품의 가치가 감소한 경우
                  </p>
                  <br />
                  <p className="desc">
                    • 복제가 가능한 삼품의 포장이 훼손된 경우
                  </p>
                  <p className="desc">
                    • 고객님의 주문에 따라 개별적으로 생산되는 삼품의 제작이
                    이미 진행된 경우
                  </p>
                </div>
              </li>
            </ul>
          )}

          <div className="happyUnfold">
            <div className="fstLeft">
              <h4 className="tit">배송관련 안내</h4>
              <p className="sub">
                배송 과정 중 기상 악화 및 도로교통 상황에 따라 부득이하게 지연
                배송이 발생될 수 있습니다.
              </p>
            </div>
          </div>
        </div>
      </div>
    );
  }
}

</body>
</html>