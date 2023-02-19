package com.itwillbs.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.board.db.boardDAO;

public class BoardDeletePro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardDeletePro execute()");
		
		int market_id = Integer.parseInt(request.getParameter("boardNum"));
		
		boardDAO dao = new boardDAO();
		dao.deleteBoard(market_id);
		
		ActionForward forward = new ActionForward();
		forward.setPath("BoardList.bo");
		forward.setRedirect(true);
		return forward;
	}
	
}
