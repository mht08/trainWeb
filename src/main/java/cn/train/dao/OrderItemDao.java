package cn.train.dao;

import java.util.List;

import cn.train.entity.OrderItem;
import cn.train.entity.Order;
import cn.train.entity.OrderShipping;


public interface OrderItemDao {
	/**
	 * 查询数据
	 * @return
	 */
	public List<OrderItem> getOderItemAll();
	/**
	 * 通过order-ID查询一条数据
	 * @param id
	 * @return
	 */
	
	public OrderItem getOrderItemById(Long id);
	
	public List<OrderItem> getOderItemByorderId(Long orderId);
	/**
	 * 通过ID删除一条数据
	 * @param id
	 * @return
	 */
	public Integer deleteOderItemById(Long id);
	/**
	 * 添加数据
	 * @param OrderItem
	 * @return
	 */
	public Integer addOderItem(OrderItem oderItem); 
	
	/**
	 * 修改数据
	 * @param OrderItem
	 * @return
	 */
	public Integer  updateOderItemById(OrderItem oderItem);
}
