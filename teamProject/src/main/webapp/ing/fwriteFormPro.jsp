<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="board.boardDAO"%>
<%@page import="board.boardDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
</script>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
fwriteFormPro페이지
<%
System.out.print(request);
request.setCharacterEncoding("utf-8");

String name = request.getParameter("name");
String subject = request.getParameter("subject");
String content = request.getParameter("content");
String[] imgUrls = request.getParameterValues("imgUrls");
int readcount = 0; 

boardDTO dto = new boardDTO();
dto.setName(name);
dto.setSubject(subject);
dto.setContent(content);
dto.setDate(new Timestamp(System.currentTimeMillis()));
dto.setReadcount(readcount);
dto.setImgUrls(imgUrls);

boardDAO dao = new boardDAO();
dao.insertBoard(dto);
%> 
<%=name %><br>
<%=subject %><br>
<%=content %><br>
<%=imgUrls[0] %><br>
<%=imgUrls[1] %><br>
<%=imgUrls[2] %><br>
<%=imgUrls[3] %><br>
<%=imgUrls[4] %><br>
</body>
</html>