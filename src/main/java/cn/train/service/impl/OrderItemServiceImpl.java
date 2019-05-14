package cn.train.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.train.dao.OrderItemDao;
import cn.train.entity.OrderItem;
import cn.train.service.OrderItemService;
@Service
public class OrderItemServiceImpl implements OrderItemService{
	@Autowired
	private OrderItemDao orderItmeDao;

	@Override
	public List<OrderItem> selectOrderItemALL() {
		// TODO Auto-generated method stub
		return orderItmeDao.getOderItemAll();
	}

	

	@Override
	public int addOrderItem(OrderItem orderItem) {
		// TODO Auto-generated method stub
		return orderItmeDao.addOderItem(orderItem);
	}


	public int deleteOrderItemByids(String[] selectIds) {
		int num = 0;
		for(int i = 0; i < selectIds.length; i++){
			num +=orderItmeDao.deleteOderItemById(Long.parseLong(selectIds[i]));
		}
		return num;
	}

	@Override
	public Integer updateOrderItemById(OrderItem orderItem) {
		// TODO Auto-generated method stub
		return orderItmeDao.updateOderItemById(orderItem);
	}



	@Override
	public List<OrderItem> selectOrderItemByOrderId(Long orderId) {
		// TODO Auto-generated method stub
		return orderItmeDao.getOderItemByorderId(orderId);
	}



	@Override
	public OrderItem getOrderItemById(Long id) {
		// TODO Auto-generated method stub
		return orderItmeDao.getOrderItemById(id);
	}
}
	