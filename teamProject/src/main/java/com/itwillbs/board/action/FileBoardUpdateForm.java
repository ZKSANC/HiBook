package com.itwillbs.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.board.db.boardDAO;
import com.itwillbs.board.db.boardDTO;

public class FileBoardUpdateForm implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("FileBoardUpdateForm execut()");
		
		int market_id = Integer.parseInt(request.getParameter("boardNum"));
		
		boardDAO dao = new boardDAO();
		boardDTO dto = dao.getBoard(market_id);
		
		request.setAttribute("dto", dto);
		
		ActionForward forward = new ActionForward();
		forward.setPath("board/fupdateForm.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
	
}
