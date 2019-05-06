package cn.train.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.train.dao.RoleDao;
import cn.train.entity.Role;
import cn.train.service.RoleService;
@Service
public class RoleServiceImpl  implements RoleService{
	@Autowired
	private RoleDao roleDao;
	@Override
	public List<Role> selectRoleALL() {
		// TODO Auto-generated method stub
		return roleDao.selectRoleALL();
	}

	@Override
	public Role selectRoleById(int id) {
		// TODO Auto-generated method stub
		return roleDao.selectRoleById(id);
	}

	@Override
	public int addRole(Role role) {
		// TODO Auto-generated method stub
		return roleDao.addRole(role);
	}

	@Override
	public int delRoleById(int id) {
		// TODO Auto-generated method stub
		return roleDao.delRoleById(id);
	}

	@Override
	public int delRoleByIds(String[] ids) {
		// TODO Auto-generated method stub
		int num = 0;
		for(int i=0;i<ids.length;i++){
			num+=roleDao.delRoleById(Integer.parseInt(ids[i]));
		}
		return num;
	}
	
	

}
