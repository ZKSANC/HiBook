<img width="13%" src="https://github.com/ZKSANC/HiBook/assets/114744493/594c439c-5e0a-428e-835e-96c4ed2c804b"/>


# HiBook
중고책 거래 및 커뮤니티 사이트
- Website : http://itwillbs7.cafe24.com/teamProject/main.do 
- 개발 기간 : 2023.01.30~2023.02.24 
- 팀 구성 : 7명 (기획, 프론트엔드, 백엔드 공동참여) 

## 서비스 내용
회원 간 커뮤니티가 가능한 '중고도서 거래 사이트'입니다. 

사용하지 않는 책들이 폐기되는 것을 방지하고, 지속 가능한 소비와 자원 재활용을 장려하고자 서비스 기획을 시작하게 되었습니다. 
- 중고책 구매, 판매글 작성 및 조회 
- 커뮤니티 글 댓글 작성 및 조회 
- 채팅 및 거래후기(별점) 기능 

## 담당 역할
- 사이트 기획 및 프로젝트 전체 진행 주도, 팀 PPT 제작 
- 담당 페이지 백엔드, 프론트엔드 개발
- 상품 페이지 - 찜 기능, 글쓴이 작성글 조회
- 마이 페이지 - 회원정보 수정, 작성 글/댓글, 찜 목록, 회원 탈퇴 
- 관리자 페이지 - 회원목록 조회, 게시글/댓글 관리, 1:1 신고 접수

## 개발 환경
- 언어 : Java (JDK 1.8), JavaScript ES6, HTML5/CSS3
- 서버 : Apache Tomcat 9.0
- 웹 애플리케이션 도구 : JSP(MVC model2)
- DB : MySQL(8.0.31)
- 개발 도구 : Eclipse, Github
- API, 라이브러리 : KAKAO Address API, jQuery(3.6.3)

## 서비스 기획 
- 간트차트, erd

## 개발 코드  
#### 상품 페이지 찜 기능 
- Model [MarketWishPro](https://github.com/ZKSANC/HiBook/blob/cafe24/teamProject/src/main/java/com/itwillbs/market/action/MarketWishPro.java), [DAO DTO](https://github.com/ZKSANC/HiBook/tree/cafe24/teamProject/src/main/java/com/itwillbs/wish)
- View [MarketContent](https://github.com/ZKSANC/HiBook/blob/cafe24/teamProject/src/main/webapp/market/MarketContent.jsp)
#### 마이 페이지 
- Model, Controller [Mypage](https://github.com/ZKSANC/HiBook/tree/cafe24/teamProject/src/main/java/mypage)
- View [Mypage](https://github.com/ZKSANC/HiBook/tree/cafe24/teamProject/src/main/webapp/mypage)
#### 관리자 페이지
- Model, Controller [Adminpage](https://github.com/ZKSANC/HiBook/tree/cafe24/teamProject/src/main/java/adminpage/action)
- View [Adminpage](https://github.com/ZKSANC/HiBook/tree/cafe24/teamProject/src/main/webapp/adminpage)

![image](https://user-images.githubusercontent.com/59406944/172750733-a0a3ff5e-7810-4923-8ff4-990130e7a192.png)
