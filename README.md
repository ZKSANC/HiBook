<img width="14%" src="https://github.com/ZKSANC/wsb/assets/114744493/a7af44f2-e94e-4162-a43a-ffa2b16a6d76"/>

# HiBook
중고책 거래 및 커뮤니티 사이트
- Website : http://itwillbs7.cafe24.com/teamProject/main.do 
- 개발 기간 : 2023.01.30~2023.02.24 
- 팀 구성 : 7명 (기획, 프론트엔드, 백엔드 공동참여) 

## 서비스 내용
회원 간 커뮤니티가 가능한 중고도서 거래 사이트입니다. 

사용하지 않는 책들이 폐기되는 것을 방지하고, 지속 가능한 소비와 자원 재활용을 장려하고자 서비스 기획을 시작하게 되었습니다. 
- 중고책 구매, 판매글 작성 및 조회 
- 커뮤니티 글 댓글 작성 및 조회 
- 채팅 및 거래후기(별점) 기능 

## 담당 역할
- 사이트 기획 및 프로젝트 전체 진행 주도
- 담당 페이지 백엔드, 프론트엔드 개발
- 상품 페이지 - 찜 기능(백엔드), 글쓴이 작성글 조회
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
- 간트 차트
![1차 간트차트](https://github.com/ZKSANC/wsb/assets/114744493/83b6e7fd-b62e-4ff6-bc4e-f27550d67a88)
- ERD
![1차 erd](https://github.com/ZKSANC/wsb/assets/114744493/4c343165-d8a7-49fc-a113-68336af83ea3)

## 개발 코드  
#### 상품 페이지 찜 기능 
<img width="75%" src="https://github.com/ZKSANC/wsb/assets/114744493/8b04a8a9-2963-4594-897b-826bdc8da115"/>

- Model [MarketWishPro](https://github.com/ZKSANC/HiBook/blob/cafe24/teamProject/src/main/java/com/itwillbs/market/action/MarketWishPro.java), [DAO DTO](https://github.com/ZKSANC/HiBook/tree/cafe24/teamProject/src/main/java/com/itwillbs/wish)
- View [MarketContent](https://github.com/ZKSANC/HiBook/blob/cafe24/teamProject/src/main/webapp/market/MarketContent.jsp)
#### 마이 페이지 
<img width="35%" src="https://github.com/ZKSANC/wsb/assets/114744493/edd9c739-ccd9-451f-937a-bf3f23812617"/>

- Model, Controller [Mypage](https://github.com/ZKSANC/HiBook/tree/cafe24/teamProject/src/main/java/mypage)
- View [Mypage](https://github.com/ZKSANC/HiBook/tree/cafe24/teamProject/src/main/webapp/mypage)
#### 관리자 페이지
<img width="27%" src="https://github.com/ZKSANC/wsb/assets/114744493/0eb843da-5e64-4f11-b023-c43cdfe36db7"/>

- Model, Controller [Adminpage](https://github.com/ZKSANC/HiBook/tree/cafe24/teamProject/src/main/java/adminpage/action)
- View [Adminpage](https://github.com/ZKSANC/HiBook/tree/cafe24/teamProject/src/main/webapp/adminpage)
