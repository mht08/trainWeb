package cn.train.service;

import java.util.List;

import cn.train.entity.Menu;
import cn.train.entity.Traininfo;

public interface MenuService {
	// 获取所有菜单
	public List<Menu> getMenuList();

	// 根据id获取菜单
	public Menu getMenuById(int id);

	// 删除菜单
	public int deletemenuByids(String[] selectIds);

	// 添加菜单
	public int addMenu(Menu menu);
	
	//修改菜单信息
		public Integer updateById(Menu menu);
	

}
