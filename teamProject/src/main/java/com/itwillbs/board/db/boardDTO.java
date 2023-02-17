package com.itwillbs.board.db;

import java.sql.Timestamp;

public class boardDTO {
	private int num;
	private String name;
	private String subject;
	private String content;
	private int readcount;
	private Timestamp date;
	private String[] imgUrls;
	
	private String book_st;
	private String book_type;
	private String trade_type;
	private String trade_st;
	private String trade_inperson;
	
	public String getBook_st() {
		return book_st;
	}
	public void setBook_st(String book_st) {
		this.book_st = book_st;
	}
	public String getBook_type() {
		return book_type;
	}
	public void setBook_type(String book_type) {
		this.book_type = book_type;
	}
	public String getTrade_type() {
		return trade_type;
	}
	public void setTrade_type(String trade_type) {
		this.trade_type = trade_type;
	}
	public String getTrade_st() {
		return trade_st;
	}
	public void setTrade_st(String trade_st) {
		this.trade_st = trade_st;
	}
	public String getTrade_inperson() {
		return trade_inperson;
	}
	public void setTrade_inperson(String trade_inperson) {
		this.trade_inperson = trade_inperson;
	}
	
	public String[] getImgUrls() {
		if(imgUrls!=null){
			String[] tempimgUrls= new String[imgUrls.length];
			System.arraycopy(imgUrls, 0, tempimgUrls, 0, imgUrls.length);
			return tempimgUrls;
		}else{
			return null;
		}
	}
	public void setImgUrls(String[] imgUrls) {
		if(imgUrls!=null){
			this.imgUrls = new String[imgUrls.length];
			System.arraycopy(imgUrls, 0, this.imgUrls, 0, imgUrls.length);
		}else{
			this.imgUrls = null;
		}
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
}
