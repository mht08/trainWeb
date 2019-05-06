package cn.train.controller;

import java.util.List;

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
import cn.train.entity.Traininfo;
import cn.train.service.RoleService;


@Controller
@RequestMapping("/role")
public class RoleController {
		private Logger logger = Logger.getLogger(RoleController.class);
		@Autowired
		private RoleService roleService;
		
		//角色信息列表的请求处理
		@RequestMapping("backend/roleList.html")
		public String toRoleListPage(Model model , HttpSession session){
			Object attribute = session.getAttribute("user");
			if(attribute!= null){
				List<Role> roleList;
				try {
					
					roleList = roleService.selectRoleALL(); 
					model.addAttribute("roleList",roleList);
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
				return "backend/roleList";
			}else{
				return "redirect:/";
			}
		}
		//添加角色信息的请求处理
		@RequestMapping(value="backend/addRole.html",method=RequestMethod.POST)
		public String addTrainPage(HttpSession session,Role role){
			
			Object userObj = session.getAttribute("user");
			if(userObj != null){
				try {
					roleService.addRole(role);
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				return "redirect:/role/backend/roleList.html";
			}else{
				return "redirect:/";
			}
		}
		
		//角色信息详情的请求处理
		@RequestMapping(value="backend/getRole.html", produces = {"text/html;charset=UTF-8"})
		@ResponseBody
		public Object getRole(@RequestParam(value="id",required=false) String id){
			logger.info("getRole id=" +id);
			String cjson = "";
			if(null == id || "".equals(id)){
				return "nodata";
			}else{
				try {
					Role train = new Role();
					train =roleService.selectRoleById(Integer.parseInt(id));
					JSONObject jo = JSONObject.fromObject(train);
					cjson = jo.toString();
				}  catch (Exception e) {
					e.printStackTrace();
					return "failed";
				}
			}
			return cjson;
		}
		

		//删除角色信息的请求处理
		@RequestMapping("delete.html")
		@ResponseBody
		public String doDeleteRole(Model model,@RequestParam String ids){
			
			int flag = 0;
			if(null != ids && !"".equals(ids)){
				String[] selectTrainNos = ids.split(" ");
				try {
					flag = roleService.delRoleByIds(selectTrainNos);
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
		
		
}
