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


import cn.train.entity.OrderItem;
import cn.train.service.OrderItemService;

@Controller
@RequestMapping("/orderItem")
public class OrderItemController {
	private Logger logger = Logger.getLogger(OrderController.class);
	@Autowired
	private OrderItemService orderItemService;

	/**
	 * 订单基本信息表
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("orderItemList.html")
	public String orderItemList(Model model, HttpSession session) {

		Object userObj = session.getAttribute("user");
		if (userObj != null) {
			List<OrderItem> orderItemList;
			try {
				orderItemList = orderItemService.selectOrderItemALL();
				model.addAttribute("orderItemList", orderItemList);
			} catch (Exception e) {
				e.printStackTrace();
			}

			return "/orderItemList";
		} else {
			return "redirect:/";
		}
	}
	
	/**
	 *添加订单信息
	 * @param id
	 * @return
	 */
		@RequestMapping(value="addOrderItem.html",method=RequestMethod.POST)
		public String addOrderItem(HttpSession session,OrderItem orderItem){
			
			Object userObj = session.getAttribute("user");
			if(userObj != null){
				try {
					orderItemService.addOrderItem(orderItem);
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				return "redirect:/orderItem/orderItemList.html";
			}else{
				return "redirect:/";
			}
		}
			
		/**
		 * 通过ID查一条数据
		 * @param id
		 * @return
		 */
		@RequestMapping(value="getOrderItem.html", produces = {"text/html;charset=UTF-8"})
		@ResponseBody
		public Object getOrderItem(@RequestParam(value="id",required=false) String id){
			logger.info("getTrain id=" +id);
			String cjson = "";
			if(null == id || "".equals(id)){
				return "nodata";
			}else{
				try {
					OrderItem order = new OrderItem();
					order =orderItemService.getOrderItemById(Long.parseLong(id));
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
		@RequestMapping("deleteOrderItem.html")
		@ResponseBody
		public String deleteOrderItem(Model model,@RequestParam String ids){
			
			int flag = 0;
			if(null != ids && !"".equals(ids)){
				String[] selectTrainNos = ids.split(" ");
				try {
					flag = orderItemService.deleteOrderItemByids(selectTrainNos);
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
				@RequestMapping(value="updateOrderItem.html",method=RequestMethod.POST)
				@ResponseBody
				public String updateOrderItem(HttpSession session,OrderItem order){
					
					try {
						orderItemService.updateOrderItemById(order);
						
					} catch (Exception e) {
						e.printStackTrace();
					}
					return "";
				}

}
