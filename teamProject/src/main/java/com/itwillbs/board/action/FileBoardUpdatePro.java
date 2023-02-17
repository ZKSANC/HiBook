package com.itwillbs.board.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.board.db.boardDAO;
import com.itwillbs.board.db.boardDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class FileBoardUpdatePro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("FileBoardUpdatePro execute()");
		
		request.setCharacterEncoding("utf-8");
		
		int num = Integer.parseInt(request.getParameter("num"));
		String name = request.getParameter("name");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String[] imgUrls = request.getParameterValues("imgUrls");
		String book_st = request.getParameter("book_st");
		String book_type = request.getParameter("book_type");
		String trade_type = request.getParameter("trade_type");
		String trade_st = request.getParameter("trade_st");
		String trade_inperson = request.getParameter("trade_inperson");
		
		System.out.println(imgUrls[0]);
		System.out.println(imgUrls[1]);
		
		boardDTO dto = new boardDTO();
		dto.setNum(num);
		dto.setName(name);
		dto.setSubject(subject);
		dto.setContent(content);
		dto.setImgUrls(imgUrls);
		dto.setBook_st(book_st);
		dto.setBook_type(book_type);
		dto.setTrade_inperson(trade_inperson);
		dto.setTrade_type(trade_type);
		dto.setTrade_st(trade_st);
		
		boardDAO dao = new boardDAO();
		dao.updateBoard(dto);
		
		ActionForward forward=new ActionForward();
		forward.setPath("BoardList.bo");
		forward.setRedirect(true);
		
		return forward;
	}
	
}
