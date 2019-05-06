package cn.train.service;

import java.util.List;

import cn.train.entity.Role;

public interface RoleService {
	//查询所有角色信息
	public List<Role> selectRoleALL();
	//根据ID查询一条角色信息
	public Role  selectRoleById(int id);
	//添加角色信息
	public int addRole(Role role);
	//删除角色信息
	public int delRoleById(int id) ;
	//删除被选信息
	public int delRoleByIds(String[] ids);
}
