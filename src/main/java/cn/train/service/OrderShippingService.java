package cn.train.service;

import java.util.List;

import cn.train.entity.OrderShipping;
import cn.train.entity.Role;

public interface OrderShippingService {
	//查询所有角色信息
		public List<OrderShipping> selectOrderShippingALL();
		//根据ID查询一条角色信息
		public OrderShipping  selectOrderShippingById(Long id);
		//添加角色信息
		public int addOrderShipping(OrderShipping oderShipping);
		//删除角色信息
		public int deleteOrderShippingByids(String[] selectIds) ;
		
		
		public Integer updateOrderShippingById(OrderShipping orderShipping);
}
