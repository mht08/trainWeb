package cn.train.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.train.dao.OrderShippingDao;
import cn.train.entity.OrderShipping;
import cn.train.service.OrderShippingService;
@Service
public class OrderShippingServiceImpl implements  OrderShippingService{
@Autowired
		private OrderShippingDao orderShippingDao;
	@Override
	public List<OrderShipping> selectOrderShippingALL() {
		// TODO Auto-generated method stub
		return orderShippingDao.getOrderShipping();
	}

	@Override
	public OrderShipping selectOrderShippingById(Long id) {
		// TODO Auto-generated method stub
		return orderShippingDao.getOrderShippingById(id);
	}

	@Override
	public int addOrderShipping(OrderShipping orderShipping) {
		// TODO Auto-generated method stub
		return orderShippingDao.addOrderShipping(orderShipping);
	}

	

	@Override
	public Integer updateOrderShippingById(OrderShipping orderShipping) {
		// TODO Auto-generated method stub
		return orderShippingDao.updateOrderShippingById(orderShipping);
	}


	public int deleteOrderShippingByids(String[] selectIds) {
		int num = 0;
		for(int i = 0; i < selectIds.length; i++){
			num +=orderShippingDao.deleteOrderShippingById(Long.parseLong(selectIds[i]));
		}
		return num;
	}

	

}
