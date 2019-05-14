package cn.train.service;

import java.util.List;

import cn.train.entity.OrderItem;


public interface OrderItemService {
	//查询所有角色信息
		public List<OrderItem> selectOrderItemALL();
		//根据ID查询一条角色信息
		public List<OrderItem>  selectOrderItemByOrderId(Long OrderId);
		
		public OrderItem getOrderItemById(Long id);
		
		
		//添加角色信息
		public int addOrderItem( OrderItem orderItem);
		//删除角色信息
		public int deleteOrderItemByids(String[] selectIds);
		
		public Integer updateOrderItemById(OrderItem orderItem);
}
