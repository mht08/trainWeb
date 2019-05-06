package cn.train.entity;

public class UserRole {
	private Integer userId;//'用户编号'
	private Integer roleId  ;//'菜单编号'
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
}
