package com.kmii.member;

public class BoardDto {
	
	
	private String btitle;
	private String bcontent;
	private String memberid;
	private String bdate;
	
	public BoardDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BoardDto(String btitle, String bcontent, String memberid, String bdate) {
		super();
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.memberid = memberid;
		this.bdate = bdate;
	}

	public String getBtitle() {
		return btitle;
	}

	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}

	public String getBcontent() {
		return bcontent;
	}

	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}

	public String getMemberid() {
		return memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	public String getBdate() {
		return bdate;
	}

	public void setBdate(String bdate) {
		this.bdate = bdate;
	}
	
	
	

}
