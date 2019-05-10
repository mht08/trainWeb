package cn.train.entity;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import cn.train.utils.DateUtil;

/*
 * @ Copyright (c) Create by JASON  Date:2018-04-14  All rights reserved.
 *
 * @ class description：用户信息实体
 *
 */
public class User implements Serializable{

	private static final long serialVersionUID = -7272678063004737126L;
	
	private String username;
	private String password;
	private Long id;
	private String realname;
	private String address;
	private String telphone;
	//@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String birthday;
	private String createUser;
	private Date createTime;
	private String updateUser;
	private Date updateTime;
	private String version;
	private String delFalg;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTelphone() {
		return telphone;
	}
	public void setTelphone(String telphone) {
		this.telphone = telphone;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getCreateUser() {
		return createUser;
	}
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getUpdateUser() {
		return updateUser;
	}
	public void setUpdateUser(String updateUser) {
		this.updateUser = updateUser;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	public String getDelFalg() {
		return delFalg;
	}
	public void setDelFalg(String delFalg) {
		this.delFalg = delFalg;
	}
	
	//@SuppressWarnings("unused")
	//private String birthdayStr;
	
	
	
//	public String getBirthdayStr() {
//		return DateUtil.formatDate(getBirthday(), DateUtil.FMT_YYY_MM_DD);
//	}
}


