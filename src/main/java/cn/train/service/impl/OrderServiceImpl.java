package cn.train.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.train.dao.OrderDao;
import cn.train.dao.OrderItemDao;
import cn.train.entity.Menu;
import cn.train.entity.Order;
import cn.train.entity.OrderItem;
import cn.train.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrderDao orderDao;
	@Autowired
	private OrderItemDao orderItemDao;

	@Override
	public List<Order> selectOrderALL() {
		// TODO Auto-generated method stub
		return orderDao.getOrderList();
	}




	@Override
	public Integer addOrde(Order order, List<OrderItem> listOrderItem) {
		// TODO Auto-generated method stub
		//保存订单头信息
		Integer number = orderDao.addOrder(order);
		//保存订单明细信息
		for (OrderItem orderItem : listOrderItem) {
			//绑定订单关系
			orderItem.setOrderId(order.getId());
			orderItemDao.addOderItem(orderItem);
		}
		return number;
	}

	@Override
	public Integer updateOrdeById(Order order) {
		// TODO Auto-generated method stub
		return orderDao.updateOrderById(order);
	}

	@Override
	public int deleteOrderByids(String[] selectIds) {
		int num = 0;
		for (int i = 0; i < selectIds.length; i++) {
			num += orderDao.deleteOrderById(Long.parseLong(selectIds[i]));
		}
		return num;

	}


	@Override
	public Order selectOrdeById(Long id) {
		
			
		return orderDao.getOrder(id);
	}

}
