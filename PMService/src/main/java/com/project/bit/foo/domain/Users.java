package com.project.bit.foo.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class Users {
	
	private String userId;
	private String userPw;
	private String userName;
	private int positionCode;
	private String positionName;
	private int teamCode;
	private String teamName;
	private String userEmail;
	private String userPhone;
	private Date userRregitdate;
	private String dutyCode;
	private String dutyName;
	
	private String userPhoto;
	private String userWebsite;
	private String userInfo;
	
	public Users() {
		// TODO Auto-generated constructor stub
	}
	
	
}
