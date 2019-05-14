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

import com.fasterxml.jackson.core.type.TypeReference;

import cn.train.entity.Order;
import cn.train.entity.OrderItem;
import cn.train.service.OrderItemService;
import cn.train.service.OrderService;
import cn.train.utils.JsonUtils;

@Controller
@RequestMapping("/order")
public class OrderController {
	private Logger logger = Logger.getLogger(OrderController.class);
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private OrderItemService orderItemService;

	/**
	 * 订单基本信息表
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("orderList.html")
	public String orderList(Model model, HttpSession session) {

		Object userObj = session.getAttribute("user");
		if (userObj != null) {
			List<Order> orderList;
			try {
				orderList = orderService.selectOrderALL();
				model.addAttribute("orderList", orderList);
			} catch (Exception e) {
				e.printStackTrace();
			}

			return "backend/orderList";
		} else {
			return "redirect:/";
		}
	}
	
	/**
	 *添加订单信息
	 * @param id
	 * @return
	 */
		@RequestMapping(value="addOrder.html",method=RequestMethod.POST)
		@ResponseBody
		public String addOrder(HttpSession session,Order addOrder,String orderItem){
			int flag = 0;
				try {
					List<OrderItem> listOrderItem =	JsonUtils.jsonToList(orderItem, new TypeReference<List<OrderItem>>() {});
					flag = orderService.addOrde(addOrder,listOrderItem);
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				if(flag > 0){
					return "success";
				}else{
					return "failed";
				}
		}
			
		/**
		 * 通过ID查一条数据
		 * @param id
		 * @return
		 */
		@RequestMapping(value="getOrder.html", produces = {"text/html;charset=UTF-8"})
		@ResponseBody
		public Object getOrder(@RequestParam(value="id",required=false) String id){
			logger.info("getTrain id=" +id);
			String cjson = "";
			if(null == id || "".equals(id)){
				return "nodata";
			}else{
				try {
					Order order = new Order();
					order =orderService.selectOrdeById(Long.parseLong(id));
					
					List<OrderItem> itemList = orderItemService.selectOrderItemByOrderId(Long.parseLong(id));
					
					Map<String,Object> returnMap = new HashMap<String,Object>();
					returnMap.put("order",order);
					returnMap.put("itemList",itemList);
					
					JSONObject jo = JSONObject.fromObject(returnMap);
					cjson = jo.toString();
				}  catch (Exception e) {
					e.printStackTrace();
					return "failed";
				}
			}
			return cjson;
		}
		
		//删除订单信息的请求处理
		@RequestMapping("deleteOrder.html")
		@ResponseBody
		public String deleteOrder(Model model,@RequestParam String ids){
			
			int flag = 0;
			if(null != ids && !"".equals(ids)){
				String[] selectTrainNos = ids.split(" ");
				try {
					flag = orderService.deleteOrderByids(selectTrainNos);
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
				@RequestMapping(value="updateOrder.html",method=RequestMethod.POST)
				@ResponseBody
				public String updateOrder(HttpSession session,Order order){
					
					try {
						orderService.updateOrdeById(order);
						
					} catch (Exception e) {
						e.printStackTrace();
					}
					return "";
				}

}
