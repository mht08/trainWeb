package cn.train.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.train.dao.MenuDao;
import cn.train.entity.Menu;
import cn.train.entity.Traininfo;
import cn.train.service.MenuService;

@Service("menuService")
public class MenuServiceImpl implements MenuService {
	@Autowired
	private MenuDao menuDao;

	@Override
	public List<Menu> getMenuList() {
		// TODO Auto-generated method stub
		return menuDao.getMenuList();
	}

	@Override
	public Menu getMenuById(int id) {
		// TODO Auto-generated method stub
		return menuDao.getMenuById(id);
	}

	public int deletemenuByids(String[] selectIds) {
		int num = 0;
		List<Menu> menu = menuDao.getMenuByIds(selectIds);
		for (Menu menu2 : menu) {
			String parentIds = menu2.getParentIds() + menu2.getId() + ",";
			num += menuDao.deleteMenuByParentIds(parentIds, menu2.getId());
		}

		return num;
		
		}

	@Override
	public int addMenu(Menu menu) {
		// TODO Auto-generated method stub
		return menuDao.addMenu(menu);
	}

	@Override
	public Integer updateById(Menu menu) {
		// TODO Auto-generated method stub
		return menuDao.updateById(menu);
	}

}
