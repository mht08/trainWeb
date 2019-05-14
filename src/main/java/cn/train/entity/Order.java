package cn.train.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import cn.train.utils.DateUtil;

public class Order {
	private Long id; // '订单id',
	private String payment; // '实付金额。精确到2位小数;单位:元。如:200.07，表示:200元7分',
	private String paymentType; // '支付类型，1、在线支付，2、货到付款',
	private String postFee; // '邮费。精确到2位小数;单位:元。如:200.07，表示:200元7分',
	private String status; // '状态：1、未付款，2、已付款，3、未发货，4、已发货，5、交易成功，6、交易关闭',
	// @DateTimeFormat(pattern = "yyyy-MM-dd ")
	private Date createTime; // '订单创建时间',
	// @DateTimeFormat(pattern = "yyyy-MM-dd ")
	private Date updateTime; // '订单更新时间',
	// @DateTimeFormat(pattern = "yyyy-MM-dd ")
	private Date paymentTime; // '付款时间',
	// @DateTimeFormat(pattern = "yyyy-MM-dd ")
	private Date consignTime; // '发货时间',
	// @DateTimeFormat(pattern = "yyyy-MM-dd ")
	private Date endTime; // '交易完成时间',
	// @DateTimeFormat(pattern = "yyyy-MM-dd ")
	private Date closeTime; // '交易关闭时间',
	private String shippingName; // '物流名称',
	private String shippingCode; // '物流单号',
	private Long userId; // '用户id',
	private String buyerMessage; // '买家留言',
	private String buyerNick; // '买家昵称',
	private Integer buyerRate; // '买家是否已经评价',
	private String createTimeStr;
	private String updateTimeStr;
	private String paymentTimeStr;
	private String consignTimeStr;
	private String endTimeStr;
	private String closeTimeStr;

	public String getCreateTimeStr() {
		return DateUtil.formatDate(getCreateTime(), DateUtil.FMT);
	}

	public String getUpdateTimeStr() {
		return DateUtil.formatDate(getUpdateTime(), DateUtil.FMT);
	}

	public String getPaymentTimeStr() {
		return DateUtil.formatDate(getPaymentTime(), DateUtil.FMT);
	}

	public String getConsignTimeStr() {
		return DateUtil.formatDate(getConsignTime(), DateUtil.FMT);
	}

	public String getEndTimeStr() {
		return DateUtil.formatDate(getEndTime(), DateUtil.FMT);
	}

	public String getCloseTimeStr() {
		return DateUtil.formatDate(getCloseTime(), DateUtil.FMT);
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	public String getPostFee() {
		return postFee;
	}

	public void setPostFee(String postFee) {
		this.postFee = postFee;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public Date getPaymentTime() {
		return paymentTime;
	}

	public void setPaymentTime(Date paymentTime) {
		this.paymentTime = paymentTime;
	}

	public Date getConsignTime() {
		return consignTime;
	}

	public void setConsignTime(Date consignTime) {
		this.consignTime = consignTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public Date getCloseTime() {
		return closeTime;
	}

	public void setCloseTime(Date closeTime) {
		this.closeTime = closeTime;
	}

	public String getShippingName() {
		return shippingName;
	}

	public void setShippingName(String shippingName) {
		this.shippingName = shippingName;
	}

	public String getShippingCode() {
		return shippingCode;
	}

	public void setShippingCode(String shippingCode) {
		this.shippingCode = shippingCode;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getBuyerMessage() {
		return buyerMessage;
	}

	public void setBuyerMessage(String buyerMessage) {
		this.buyerMessage = buyerMessage;
	}

	public String getBuyerNick() {
		return buyerNick;
	}

	public void setBuyerNick(String buyerNick) {
		this.buyerNick = buyerNick;
	}

	public Integer getBuyerRate() {
		return buyerRate;
	}

	public void setBuyerRate(Integer buyerRate) {
		this.buyerRate = buyerRate;
	}

}
