package com.itwillbs.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.member.db.MemberDAO;
import com.itwillbs.member.db.MemberDTO;

public class MemberUpdatePro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberUpdatePro execute()");
		
		String memId = request.getParameter("mem_id");
		String memPass = request.getParameter("mem_pass");
		String memName = request.getParameter("mem_nm");
		
		MemberDTO updateDto=new MemberDTO();
		updateDto.setMemId(memId);
		updateDto.setMemPass(memPass);
		updateDto.setMemNm(memName);
		
		MemberDAO dao=new MemberDAO();
		MemberDTO dto = dao.userCheck(memId, memPass);
		
		ActionForward forward = null;
		
		if(dto!=null){
			dao.updateMember(updateDto);
			forward = new ActionForward();
			forward.setPath("MemberMain.me");
			forward.setRedirect(true);
			
		}else{
			response.setContentType("text/html; charset=UTF-8");
			
			// 자바에서 html(자바스크립트) 동작 코드 생성
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>"); // PrintWrite 자바 출력클래스, response(HttServlet 클래스 내장객체)
			out.println("alert('아이디 비밀번호 틀림');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			
			forward = null;
		}
		
		return forward;
	}
	
}
