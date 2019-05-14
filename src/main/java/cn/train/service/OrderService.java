package cn.train.service;

import java.util.List;

import cn.train.entity.Order;
import cn.train.entity.OrderItem;


public interface OrderService {
	//查询所有角色信息
		public List<Order> selectOrderALL();
		//根据ID查询一条角色信息
		public Order  selectOrdeById(Long id);
		//添加角色信息
		public Integer addOrde(Order order,List<OrderItem> listOrderItem);
		//删除角色信息
		public int deleteOrderByids(String[] selectIds) ;
		
		
		public Integer updateOrdeById(Order order);
}
