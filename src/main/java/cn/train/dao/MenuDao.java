package cn.train.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.train.entity.Menu;
import cn.train.entity.Role;

public interface MenuDao {

	// 获取所有菜单
	public List<Menu> getMenuList();

	// 根据id获取菜单
	public Menu getMenuById(int id);

	// 删除菜单
	public int deleteMenuById(int id);

	// 添加菜单
	public int addMenu(Menu menu);

	/**
	 * 删除自下级菜单
	 * 
	 * @param parentIds
	 *            父级点
	 * @param id
	 *            删除的ID
	 * @return
	 */

	public int deleteMenuByParentIds(@Param("parentIds") String parentIds,
			@Param("id") Long id);

	public List<Menu> getMenuByIds(@Param("ids") String[] ids);

	// 修改菜单信息
	public Integer updateById(Menu menu);

}
