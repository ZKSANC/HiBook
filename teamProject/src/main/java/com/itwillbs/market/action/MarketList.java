package com.itwillbs.market.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.market.db.MarketDAO;
import com.itwillbs.market.db.MarketDTO;

public class MarketList implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MarketList excute()");
		
		MarketDAO dao = new MarketDAO();
		//한 페이지에 불러올 market_id 열 수
		int pageSize = 20;
		String pageNum = request.getParameter("pageNum");
		
		if(pageNum==null) {
			pageNum="1";
		}
		
		//DB에서 가져올 페이지 번호
		//현재 지정된 페이지 번호
		int currentPage=Integer.parseInt(pageNum);
		
		//시작 페이지 번호
		int startRow = pageSize*(currentPage-1)+1;
		
		//끝 페이지 번호
		int endRow = startRow+pageSize-1;
		
		//mysql limit 함수 변수
		int start = startRow-1; //시작행
		int num = pageSize; //시작행으로부터 가져올 갯수
		ArrayList<MarketDTO> dtolist = dao.getBoardList(start, num);
		
		//하단에 보여지는 페이지 번호
		int pageBlock = 10;
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage+pageBlock-1;
		
		//총 게시글 수
		int allPage = dao.getBoardPage();
		
		// 나타낼 페이지 수
		int pageCount = allPage/pageSize+(allPage%pageSize==0?0:1);
		
		// endPage 재설정
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		//request에 담아서 list.jsp로 가져가지
		request.setAttribute("dtolist", dtolist);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("endPage", endPage);
		request.setAttribute("allPage", allPage);

		//이동
		ActionForward forward = new ActionForward();
		forward.setPath("market/MarketList.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
	
}// 클래스
