 package cn.train.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.train.entity.Menu;
import cn.train.entity.Traininfo;
import cn.train.entity.User;
import cn.train.service.MenuService;
import cn.train.service.TrainService;
import net.sf.json.JSONObject;

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
	
	//火车信息列表的请求处理
	@RequestMapping("backend/menuList.html")
	public String totrainListPage(Model model,HttpSession session){
		
		Object userObj = session.getAttribute("user");
		if(userObj != null){
			List<Menu> menuList;
			try {
				menuList =  menuService.getMenuList();
				model.addAttribute("menuList", menuList);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return "backend/menuList";
		}else{
			return "redirect:/";
		}
	}
	

	
	//菜单信息详情的请求处理
	@RequestMapping(value="backend/getMenu.html", produces = {"text/html;charset=UTF-8"})
	@ResponseBody
	public Object getTrain(@RequestParam(value="id",required=false) String id){
		logger.info("getMenu id=" +id);
		String cjson = "";
		if(null == id || "".equals(id)){
			return "nodata";
		}else{
			try {
				Menu train = new Menu();
				train = menuService.getMenuById(Integer.parseInt(id));
				JSONObject jo = JSONObject.fromObject(train);
				cjson = jo.toString();
			}  catch (Exception e) {
				e.printStackTrace();
				return "failed";
			}
		}
		return cjson;
	}
	
	//删除火车信息的请求处理
	@RequestMapping("delete1.html")
	@ResponseBody
	public String doDeleteTraininfo(Model model,@RequestParam String ids){
		
		int flag = 0;
		if(null != ids && !"".equals(ids)){
			String[] selectTrainNos = ids.split(" ");
			try {
				flag = menuService.deletemenuByids(selectTrainNos);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if(flag > 0){
			return "success";
		}else{
			return "failed";
		}
	}
	
	//添加菜单信息的请求处理
		@RequestMapping(value="backend/addMenu.html",method=RequestMethod.POST)
		public String addTrainPage(HttpSession session,Menu menu){
			
			Object userObj = session.getAttribute("user");
			if(userObj != null){
				try {
					menuService.addMenu(menu);
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				return "redirect:/menu/backend/menuList.html";
			}else{
				return "redirect:/";
			}
		}

}


