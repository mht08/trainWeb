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

import cn.train.entity.OrderShipping;
import cn.train.service.OrderShippingService;
@Controller
@RequestMapping("/orderShipping")
public class OrderShippingController {
	private Logger logger = Logger.getLogger(OrderController.class);
	@Autowired
	private  OrderShippingService orderShippingService;

	/**
	 * 订单基本信息表
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("orderShippingList.html")
	public String orderShippingList(Model model, HttpSession session) {

		Object userObj = session.getAttribute("user");
		if (userObj != null) {
			List<OrderShipping> orderShippingList;
			try {
				orderShippingList = orderShippingService.selectOrderShippingALL();
				model.addAttribute("orderShippingList", orderShippingList);
			} catch (Exception e) {
				e.printStackTrace();
			}

			return "/orderShippingList";
		} else {
			return "redirect:/";
		}
	}
	
	/**
	 *添加订单信息
	 * @param id
	 * @return
	 */
		@RequestMapping(value="addOrderShipping.html",method=RequestMethod.POST)
		public String addOrderShipping(HttpSession session,OrderShipping orderShipping){
			
			Object userObj = session.getAttribute("user");
			if(userObj != null){
				try {
					orderShippingService.addOrderShipping(orderShipping);
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				return "redirect:/orderShipping/orderShippingList.html";
			}else{
				return "redirect:/";
			}
		}
			
		/**
		 * 通过ID查一条数据
		 * @param id
		 * @return
		 */
		@RequestMapping(value="getOrderShipping.html", produces = {"text/html;charset=UTF-8"})
		@ResponseBody
		public Object getOrderShipping(@RequestParam(value="id",required=false) String id){
			logger.info("getTrain id=" +id);
			String cjson = "";
			if(null == id || "".equals(id)){
				return "nodata";
			}else{
				try {
					OrderShipping order = new OrderShipping();
					order =orderShippingService.selectOrderShippingById(Long.parseLong(id));
					JSONObject jo = JSONObject.fromObject(order);
					cjson = jo.toString();
				}  catch (Exception e) {
					e.printStackTrace();
					return "failed";
				}
			}
			return cjson;
		}
		
		//删除订单信息的请求处理
		@RequestMapping("deleteOrderShipping.html")
		@ResponseBody
		public String deleteOrderShipping(Model model,@RequestParam String ids){
			
			int flag = 0;
			if(null != ids && !"".equals(ids)){
				String[] selectTrainNos = ids.split(" ");
				try {
					flag = orderShippingService.deleteOrderShippingByids(selectTrainNos);
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
		
		//修改订单信息的请求处理
				@RequestMapping(value="updateOrderShipping.html",method=RequestMethod.POST)
				@ResponseBody
				public String updateOrderShipping(HttpSession session,OrderShipping orderShipping){
					
					try {
						orderShippingService.updateOrderShippingById(orderShipping);
						
					} catch (Exception e) {
						e.printStackTrace();
					}
					return "";
				}
}
