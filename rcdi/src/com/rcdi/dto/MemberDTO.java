package com.rcdi.dto;

import java.util.Date;

public class MemberDTO {

	private String id;
	private String pw;
	private String name;
	private int birth_year;
	private int birth_month;
	private int birth_day;
	private String phone;
	private String preceiveyn;
	private String email;
	private String ereceiveyn;
	private String zipcode;
	private String addr1;
	private String addr2;
	private Date regdate;
	
	
	
	public MemberDTO() {
		super();
	}
	
	



	




	public MemberDTO(String id, String pw, String name, int birth_year, int birth_month, int birth_day, String phone,
			String preceiveyn, String email, String ereceiveyn, String zipcode, String addr1, String addr2) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.birth_year = birth_year;
		this.birth_month = birth_month;
		this.birth_day = birth_day;
		this.phone = phone;
		this.preceiveyn = preceiveyn;
		this.email = email;
		this.ereceiveyn = ereceiveyn;
		this.zipcode = zipcode;
		this.addr1 = addr1;
		this.addr2 = addr2;
	}










	public MemberDTO(String id, String pw, String name, int birth_year, int birth_month, int birth_day, String phone,
			String preceiveyn, String email, String ereceiveyn, String zipcode, String addr1, String addr2,
			Date regdate) {
		
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.birth_year = birth_year;
		this.birth_month = birth_month;
		this.birth_day = birth_day;
		this.phone = phone;
		this.preceiveyn = preceiveyn;
		this.email = email;
		this.ereceiveyn = ereceiveyn;
		this.zipcode = zipcode;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.regdate = regdate;
		
	}













	





	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public String getPw() {
		return pw;
	}



	public void setPw(String pw) {
		this.pw = pw;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public int getBirth_year() {
		return birth_year;
	}



	public void setBirth_year(int birth_year) {
		this.birth_year = birth_year;
	}



	public int getBirth_month() {
		return birth_month;
	}



	public void setBirth_month(int birth_month) {
		this.birth_month = birth_month;
	}



	public int getBirth_day() {
		return birth_day;
	}



	public void setBirth_day(int birth_day) {
		this.birth_day = birth_day;
	}



	public String getPhone() {
		return phone;
	}



	public void setPhone(String phone) {
		this.phone = phone;
	}



	public String getPreceiveyn() {
		return preceiveyn;
	}



	public void setPreceiveyn(String preceiveyn) {
		this.preceiveyn = preceiveyn;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getEreceiveyn() {
		return ereceiveyn;
	}



	public void setEreceiveyn(String ereceiveyn) {
		this.ereceiveyn = ereceiveyn;
	}



	public String getZipcode() {
		return zipcode;
	}



	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}



	public String getAddr1() {
		return addr1;
	}



	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}



	public String getAddr2() {
		return addr2;
	}



	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}



	public Date getRegdate() {
		return regdate;
	}



	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}



	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", pw=" + pw + ", name=" + name + ", birth_year=" + birth_year + ", birth_month="
				+ birth_month + ", birth_day=" + birth_day + ", phone=" + phone + ", preceiveyn=" + preceiveyn
				+ ", email=" + email + ", ereceiveyn=" + ereceiveyn + ", zipcode=" + zipcode + ", addr1=" + addr1
				+ ", addr2=" + addr2 + ", regdate=" + regdate + "]";
	}
	
	
	
	
	
	
	
	
	
}




