package com.itwillbs.board.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class boardDAO {
	
	public Connection getConnection() throws Exception{
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		Connection con=ds.getConnection();
		return con;
	}
	
	public void insertBoard(boardDTO dto) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			
			int num = 1;
			String sql = "select max(num) from board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				num = rs.getInt(1)+1;
			}
			
			sql="insert into board(num,name,subject,content,date,book_st,book_type,trade_inperson,trade_st,trade_type) values(?,?,?,?,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setInt(1, num);  
			pstmt.setString(2, dto.getName()); 
			pstmt.setString(3, dto.getSubject());
			pstmt.setString(4, dto.getContent());
			pstmt.setTimestamp(5, dto.getDate());
			pstmt.setString(6,dto.getBook_st());
			pstmt.setString(7,dto.getBook_type());
			pstmt.setString(8,dto.getTrade_inperson());
			pstmt.setString(9,dto.getTrade_st());
			pstmt.setString(10,dto.getTrade_type());
			
			pstmt.executeUpdate();
			
	
			sql="insert into filedate(board_num, url) values(?,?)";	
				
			for(int i = 0; i < dto.getImgUrls().length; i++ ) {
				pstmt=con.prepareStatement(sql);
					
				pstmt.setInt(1, num); 
				pstmt.setString(2, dto.getImgUrls()[i]); 
					
				pstmt.executeUpdate();
			} 

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(rs!=null) try { rs.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
	}
	
	public ArrayList<boardDTO> getBoardList(int start, int num) {
		ArrayList<boardDTO> dtolist = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {	
			con = getConnection();
			
			String sql="select * from board order by num desc limit ?, ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, num);
			 
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				boardDTO dto = new boardDTO();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setSubject(rs.getString("subject"));
				dto.setDate(rs.getTimestamp("date"));
				dto.setReadcount(rs.getInt("readcount"));
				dtolist.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
			if(rs!=null) try { rs.close();} catch (Exception e2) {}
		}
		return dtolist;
	}
	
	public boardDTO getBoard(int num) {
		boardDTO dto = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {	
			con = getConnection();
			
			String sql="select * from board where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);  
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new boardDTO();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setDate(rs.getTimestamp("date"));
				dto.setBook_st(rs.getString("book_st"));
				dto.setBook_type(rs.getString("book_type"));
				dto.setTrade_st(rs.getString("trade_st"));
				dto.setTrade_type(rs.getString("trade_type"));
				dto.setTrade_inperson(rs.getString("trade_inperson"));
			}
			
			sql="select * from filedate where board_num=?"; 
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);  
			 
			rs=pstmt.executeQuery();
			
			String[] url = new String[5];
			int i = 0;
			while(rs.next()) {
				url[i] = rs.getString("url");
				if (i <=3) {i++;}
			}
			dto.setImgUrls(url);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
			if(rs!=null) try { rs.close();} catch (Exception e2) {}
		}
		return dto;
	}
	
	public void updateReadCount(boardDTO dto) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {	
			con = getConnection();
			
			String sql="update board set readcount=readcount+1 where num=?";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getNum());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
	}
	
	public void updateBoard(boardDTO dto) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {	
			con = getConnection();
			
			String sql="update board set subject=?, content=?, book_st=?, book_type=?, trade_st=?, trade_type=?, trade_inperson=? where num=?";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, dto.getSubject());  
			pstmt.setString(2, dto.getContent());  
			pstmt.setString(3, dto.getBook_st());
			pstmt.setString(4, dto.getBook_type());
			pstmt.setString(5, dto.getTrade_st());
			pstmt.setString(6, dto.getTrade_type());
			pstmt.setString(7, dto.getTrade_inperson());
			pstmt.setInt(8, dto.getNum());
			
			pstmt.executeUpdate();
			
			// minFileId setting start
			int minFileId = 0;
			sql="select min(file_num) from filedate where board_num=?";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getNum()); 
 
			rs=pstmt.executeQuery();
			
			System.out.println("file_id : "+minFileId);
			
			if(rs.next()) {
				minFileId = rs.getInt("min(file_num)");
			}
			// minFileId setting end
			
			sql="update filedate set url=? where board_num=? and file_num=?";	
			
			for(int i = 0; i < dto.getImgUrls().length; i++ ) {
				pstmt=con.prepareStatement(sql);
					
				pstmt.setString(1, dto.getImgUrls()[i]); 
				pstmt.setInt(2, dto.getNum());
				pstmt.setInt(3, minFileId+i);
					
				pstmt.executeUpdate();
			} 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
			if(rs!=null) try { rs.close();} catch (Exception e2) {}
		}
	}
	
	public void deleteBoard(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {	
			con = getConnection();
			
			String sql="delete from board where num=?";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
	}
	
	public int getBoardPage() {
		int allPage = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {	
			con = getConnection();
			
			String sql="select count(*) from board";
			pstmt=con.prepareStatement(sql);
 
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				allPage = rs.getInt("count(*)");
		}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
			if(rs!=null) try { rs.close();} catch (Exception e2) {}
		}
		return allPage;
	}
		
	
	
}// class
