package cn.train.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.train.entity.Menu;
import cn.train.entity.Role;
import cn.train.service.MenuService;

/*
 * @ Copyright (c) Create by JASON  Date:2018-04-17  All rights reserved.
 *
 * @ class description：火车信息控制
 *
 */
@Controller
@RequestMapping("/menu")
public class MenuController {
	private Logger logger = Logger.getLogger(MenuController.class);

	@Autowired
	private MenuService menuService;

	// 菜单信息列表的请求处理
	@RequestMapping("backend/menuList.html")
	public String totrainListPage(Model model, HttpSession session) {

		Object userObj = session.getAttribute("user");
		if (userObj != null) {
			List<Menu> menuList;
			try {
				menuList = menuService.getMenuList();
				 Map<Long, Menu> menuMap = new HashMap<Long,Menu>();
				 for (Menu menu : menuList) {
				 menuMap.put(menu.getId(), menu);
				 }
				 for (Menu menu : menuList) {
				 if(!menu.getParentId().equals("0")){
				 menu.setParentIdStr(menuMap.get(Long.valueOf(menu.getParentId())).getName());
				 String[] p = menu.getParentIds().split(",");
				 String parentIdsStr ="";
				 for (String string : p) {
				 if(!string.equals("0")){
					if(!parentIdsStr.equals("")){
				 parentIdsStr+="/";
				}
				 parentIdsStr +=
				 menuMap.get(Long.valueOf(string)).getName();
				 }
				 }
				 menu.setParentIdsStr(parentIdsStr);
				 }
			 }
//				
//				Map<Long, Menu> menuMap = new HashMap<Long, Menu>();
//				for (Menu menu : menuList) {
//					menuMap.put(menu.getId(), menu);
//				}
//				for (Menu menu : menuList) {
//					if (!menu.getParentId().equals("0")) {
//						menu.setParentIdStr(menuMap.get(
//								Long.valueOf(menu.getParentId())).getName());
//						String[] p = menu.getParentIds().split(",");
//						String parentIdsStr = "";
//						for (String string : p) {
//							if (!string.equals("0")) {
//								if (!parentIdsStr.equals("")) {
//									parentIdsStr += "/";
//								}
//								parentIdsStr += menuMap.get(
//										Long.valueOf(string)).getName();
//							}
//						}
//
//						menu.setParentIdsStr(parentIdsStr);
//					}
//				}
				model.addAttribute("menuList", menuList);
			} catch (Exception e) {
				e.printStackTrace();
			}

			return "backend/menuList";
		} else {
			return "redirect:/";
		}
	}

	// 菜单信息详情的请求处理
	@RequestMapping(value = "backend/getMenu.html", produces = { "text/html;charset=UTF-8" })
	@ResponseBody
	public Object getTrain(
			@RequestParam(value = "id", required = false) String id) {
		logger.info("getMenu id=" + id);
		String cjson = "";
		if (null == id || "".equals(id)) {
			return "nodata";
		} else {
			try {
				Menu train = new Menu();
				train = menuService.getMenuById(Integer.parseInt(id));
				JSONObject jo = JSONObject.fromObject(train);
				cjson = jo.toString();
			} catch (Exception e) {
				e.printStackTrace();
				return "failed";
			}
		}
		return cjson;
	}

	// 删除火车信息的请求处理
	@RequestMapping("delete1.html")
	@ResponseBody
	public String doDeleteTraininfo(Model model, @RequestParam String ids) {

		int flag = 0;
		if (null != ids && !"".equals(ids)) {
			String[] selectTrainNos = ids.split(" ");
			try {
				flag = menuService.deletemenuByids(selectTrainNos);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		if (flag > 0) {
			return "success";
		} else {
			return "failed";
		}
	}

	// 添加菜单信息的请求处理
	@RequestMapping(value = "backend/addMenu.html", method = RequestMethod.POST)
	@ResponseBody
	public String addMenuPage(HttpSession session, Menu menu) {
		String code = "0000";
		try {
			menuService.addMenu(menu);

		} catch (Exception e) {
			e.printStackTrace();
			code = "9999";
		}
		return code;
	}

	//修改菜单列表信息的请求处理
	@RequestMapping(value="backend/updateMenu.html",method=RequestMethod.POST)
	@ResponseBody
	public String updateUserPage(HttpSession session,Menu menu){
		
		try {
			menuService.updateById(menu);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
}
