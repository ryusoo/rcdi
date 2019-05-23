package com.rcdi.dto;

public class GoodDTO {

	private int gno;
	private int bno;
	private String id;
	
	public GoodDTO() {
		super();
	}

	public GoodDTO(int gno, int bno, String id) {
		super();
		this.gno = gno;
		this.bno = bno;
		this.id = id;
	}

	public int getGno() {
		return gno;
	}

	public void setGno(int gno) {
		this.gno = gno;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "GoodDTO [gno=" + gno + ", bno=" + bno + ", id=" + id + "]";
	}
	
	
	
	
	
	
	
	

}
