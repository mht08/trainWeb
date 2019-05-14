package cn.train.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.train.entity.Order;
import cn.train.entity.OrderShipping;

public interface OrderShippingDao {
	/**
	 * 查询数据
	 * @return
	 */
	public List<OrderShipping> getOrderShipping();
	
	
	/**
	 * 通过ID查询一条数据
	 * @param id
	 * @return
	 */
	public OrderShipping getOrderShippingById(Long id);
	/**
	 * 通过ID删除一条数据
	 * @param id
	 * @return
	 */
	public Integer deleteOrderShippingById(Long id);
	/**
	 * 添加数据
	 * @param OrderShipping
	 * @return
	 */
	public Integer addOrderShipping(OrderShipping orderShipping); 
	
	/**
	 * 修改数据
	 * @param OrderShipping
	 * @return
	 */
	public Integer  updateOrderShippingById(@Param("OrderShipping")OrderShipping orderShipping);
}
