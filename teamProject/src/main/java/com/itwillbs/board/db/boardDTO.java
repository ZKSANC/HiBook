package com.itwillbs.board.db;

import java.sql.Timestamp;

public class boardDTO {
	private int num;
	private String name;
	private String subject;
	private String content;
	private int readcount;
	private Timestamp date;
	private String file;
	private String[] imgUrls;
	
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
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
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
