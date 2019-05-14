<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/common/head.jsp"%>

<div id="content" class="span10">

	<div>
		<ul class="breadcrumb">
			<li><a href="javascript:void();">后台管理</a> <span class="divider">/</span></li>
			<li><a href="javascript:void();">订单信息管理</a></li>
		</ul>
	</div>

	<div class="row-fluid sortable">

		<div class="box span12">
			<div class="box-header well" data-original-title>
				<h2>
					<i class="icon-th"></i> 订单信息
				</h2>
				<div class="box-icon">
					<span class="btn btn-small btn-primary addOrder"> <i
						class="icon-plus icon-white"></i> 添加
					</span>
				</div>

			</div>
			<div class="box-content">
				<table
					class="table table-striped table-bordered bootstrap-datatable datatable">
					<thead>
						<tr>
							<th><input type="button" value="删除" id="myDelOrderBtn"></th>
							<th>用户编号</th>
							<th>支付类型</th>
							<th>邮费</th>
							<th>状态</th>
							<th>订单创建时间时间（小时）</th>
							<th>订单更新时间</th>
							<th>付款时间</th>
							<th>发货时间</th>
							<th>交易完成时间</th>
							<th>交易关闭时间</th>
							<th>物流名称</th>
							<th>物流单号</th>
							<th>实付金额</th>
							<th>买家留言</th>
							<th>买家昵称</th>
							<th>买家是否已经评价</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${orderList }" var="order">
							<tr>
								<td><input type="checkbox" class="checkbox" name="delOrder"
									value="${order.id }"></td>
								<td><a class="vieworder" id="${order.id }">${order.userId
										}</a></td>
								<td>${order.paymentType}</td>
								<td>${order.postFee}</td>
								<td>${order.status}</td>
								<td>${order.createTimeStr }</td>
								<td>${order.updateTimeStr}</td>
								<td>${order.paymentTimeStr}</td>
								<td>${order.consignTimeStr}</td>
								<td>${order.endTimeStr }</td>
								<td>${order.closeTimeStr }</td>
								<td>${order.shippingName}</td>
								<td>${order.shippingCode}</td>
								<td>${order.payment }</td>
								<td>${order.buyerMessage }</td>
								<td>${order.buyerNick}</td>
								<td>${order.buyerRate}</td>
								<td><input type="button" value="x"
									onclick="updateOrderFun(${order.id})"></td>

							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

		</div>
	</div>
</div>


<!-- 查看订单详信息 -->
<div class="modal hide fade" id="viewOrderModal">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal">×</button>
		<h3>订单详情</h3>
	</div>
	<div class="modal-body">

		<table class="table table-bordered bootstrap-datatable ">
			<tbody>
				<tr>
					<td>实付金额</td>
					<td id="payment"></td>
				</tr>
				<tr>
					<td>支付类型</td>
					<td><span id="paymentType"></span></td>
				</tr>
				<tr>
					<td>邮费</td>
					<td><span id="postFee"></span></td>
				</tr>
				<tr>
					<td>状态</td>
					<td id="status"></td>
				</tr>
				<tr>
					<td>物流名称</td>
					<td id="shippingName"></td>
				</tr>
				<tr>
					<td>物流单号</td>
					<td id="shippingCode"></td>
				</tr>
			</tbody>
		</table>
		<table  class="table table-striped table-bordered bootstrap-datatable datatable">
			<thead>
				<tr>
				<td>商品标题</td>
				<td>商品购买数量</td>
				<td>商品单价</td>
				<td>商品总金额</td>
				<td>商品图片地址</td>
				</tr>
			</thead>
		<tbody class="viewOrderItemTr"></tbody>
		</table>
	</div>
	<div class="modal-footer">
		<a href="#" class="btn btn-primary" data-dismiss="modal">关闭</a>
	</div>
</div>





<!-- 添加订单的表单 -->
<div class="modal hide fade" id="addOrderDiv">
	<!-- <form action="backend/addTrain.html"  method="post" onsubmit="return addOrderFunction();" > -->
	<div class="modal-header">
		<button type="button" class="close  addordercancel"
			data-dismiss="modal">×</button>
		<h3>添加订单信息</h3>
	</div>
	<div class="modal-body">
		<ul id="add_formtip"></ul>
		<ul class="topul">
			<li><label>用户编号：</label><input type="text" id="orderuserId"
				value="" /> <span style="color: red; font-weight: bold;">*</span></li>
			<li><label>实付金额<：</label><input type="text" id="orderpayment"
				value=""></li>
			<li><label>支付类型：</label><input type="text" id="orderpaymentType"
				value=""> <span style="color: red; font-weight: bold;">*</span></li>
			<li><label>邮费：</label><input type="text" id="orderpostFee"
				value=""> <span style="color: red; font-weight: bold;">*</span></li>
			<li><label>状态：</label><input type="text" id="orderstatus"
				value=""> <span style="color: red; font-weight: bold;">*</span></li>
			<li><label>物流名称：</label><input type="text"
				id="ordershippingName" value=""> <span
				style="color: red; font-weight: bold;">*</span></li>
			<li><label>物流单号：</label><input type="text"
				id="ordershippingCode" value=""> <span
				style="color: red; font-weight: bold;">*</span></li>
			<li><label>买家是否已经评价：</label><input type="text"
				id="orderbuyerRate" value=""></li>
		</ul>
		<div>
			<input type="button" id="addorderItemBtn" class="btn btn-primary" value="添加订单明细">
		</div>
		<table  class="table table-striped table-bordered bootstrap-datatable datatable">
			<thead>
				<tr>
				<td>商品标题</td>
				<td>商品购买数量</td>
				<td>商品单价</td>
				<td>商品总金额</td>
				<td>商品图片地址</td>
				</tr>
			</thead>
		<tbody class="orderItemTr"></tbody>
		</table>
	</div>
	<div class="modal-footer">
		<a href="#" class="btn addordercancel" data-dismiss="modal">关闭</a> <input
			type="button" id="addorderBtn" class="btn btn-primary" value="保存" />
	</div>
	<!-- </form> -->
</div>



<!-- 修改订单 -->
<div class="modal hide fade" id="updateOrderDiv">
	<!-- <form action="backend/addTrain.html"  method="post" onsubmit="return addTrainFunction();" > -->


	<div class="modal-header">
		<button type="button" class="close  updateordercancel"
			data-dismiss="modal">×</button>
		<h3>修改订单信息</h3>
	</div>
	<div class="modal-body">
		<input id="updateId" type="hidden" />
		<ul id="update_formtip"></ul>
		<ul class="topul">
			<li><label>用户编号：</label><input type="text" id="updateuserId"
				value="" /> <span style="color: red; font-weight: bold;">*</span></li>
			<li><label>实付金额：</label><input type="text" id="updatepayment"
				value=""></li>
			<li><label>支付类型：</label><input type="text"
				id="updatepaymentType" value=""> <span
				style="color: red; font-weight: bold;">*</span></li>
			<li><label>邮费：</label><input type="text" id="updatepostFee"
				value=""> <span style="color: red; font-weight: bold;">*</span></li>
			<li><label>状态：</label><input type="text" id="updatestatus"
				value=""> <span style="color: red; font-weight: bold;">*</span></li>
			<li><label>物流单号：</label><input type="text"
				id="updateshippingCode" value=""> <span
				style="color: red; font-weight: bold;">*</span></li>

		</ul>
	</div>
	<div class="modal-footer">
		<a href="#" class="btn updateordercancel" data-dismiss="modal">关闭</a>
		<input type="button" id="updateOrderBtn" class="btn btn-primary"
			value="修改" />
	</div>
	<!-- </form> -->
</div>

<%@include file="/WEB-INF/pages/common/foot.jsp"%>
<script src="statics/localjs/order.js?3"></script>

