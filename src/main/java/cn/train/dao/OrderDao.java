package cn.train.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.train.entity.Order;


public interface OrderDao {
	/**
	 * 查询数据
	 * @return
	 */
	public List<Order> getOrderList();
	/**
	 * 通过ID查询一条数据
	 * @param id
	 * @return
	 */
	public Order getOrder(Long id);
	/**
	 * 通过ID删除一条数据
	 * @param id
	 * @return
	 */
	public Integer deleteOrderById(Long id);
	/**
	 * 添加数据
	 * @param order
	 * @return
	 */
	public Integer addOrder(Order order); 
	
	/**
	 * 修改数据
	 * @param Order
	 * @return
	 */
	public Integer  updateOrderById(Order order);

	
}
