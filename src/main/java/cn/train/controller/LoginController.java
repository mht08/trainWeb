package cn.train.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.train.common.MessageCode;
import cn.train.common.ResultObject;
import cn.train.entity.User;
import cn.train.redis.RedisUtil;
import cn.train.service.UserService;
import cn.train.utils.JsonUtils;
import net.sf.json.JSONObject;

/*
 * @ Copyright (c) Create by JASON  Date:2018-04-14  All rights reserved.
 *
 * @ class description：登录控制
 *
 */
@Controller
public class LoginController {
	private Logger logger = Logger.getLogger(LoginController.class);
	
	@Resource
	@Qualifier("userService")
	private UserService userService;
	
	@Autowired
	private RedisUtil redisUtil;
	
	//登录请求的处理
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "login")
	@ResponseBody
	public ResultObject login(@RequestParam String user){
		logger.debug("login.html请求执行了*******************"+user.toString());
		MessageCode code = MessageCode.CODE_SUCCESS;
		String token = UUID.randomUUID().toString().replaceAll("-", "");
		if(user == null || "".equals(user)){
			code = MessageCode.CODE_LOGIN_ERROR;
		}else{
			try {
				JSONObject userObject = JSONObject.fromObject(user);
				
				@SuppressWarnings("static-access")
				User userObj = (User) userObject.toBean(userObject, User.class);
				/*if(userService.getLoginUser(userObj) == null){
					return "noUsername";
				}else{*/
				User _user = userService.getLoginUser(userObj);
				if(_user != null){
					System.out.println(token);
				    redisUtil.set(token, JsonUtils.objectToJson(_user));
//					session.setAttribute("user", _user);
				}else{
					code = MessageCode.CODE_LOGIN_ERROR;
				}
//				}
			} catch (Exception e) {
				e.printStackTrace();
				code = MessageCode.CODE_LOGIN_ERROR;
			}
		}
		ResultObject ro = new ResultObject(code);
		ro.setData(token);
		return ro;
		
	}
	
	//登陆页面的处理
	@RequestMapping("index.html")
	public ModelAndView index(){
		return new ModelAndView("index");
	}
	
	//退出请求的处理
	@RequestMapping("logout.html")
	public String logout(HttpSession session){
		logger.debug("loginout.html请求执行了*******************");
		
		session.removeAttribute("user");
		session.invalidate();
		
		return "redirect:/";
	}
	
	//主页面请求的处理
	@RequestMapping("main.html")
	public ModelAndView toMainPage(Model model,HttpSession session){
		
		Object userObj = session.getAttribute("user");
		if(userObj != null){
			return new ModelAndView("main");
		}else{
			return new ModelAndView("redirect:/");
		}
	}
	
	



}


