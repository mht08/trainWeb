var itemNumber = 1;

$("#myDelOrderBtn").click(function() {
	var trs = $("table").find("tr"); // 获取表格每一行
	var selectIds = "";
	trs.each(function() { // 遍历
		var isChecked = $(this).find(".checkbox").prop("checked"); // 获取当前行checkbox选择状态；
		if (isChecked == true || isChecked == "true") { // 如果选中
			selectIds += $(this).find(".checkbox").val() + " "; // checkbox的value
		}
	})

	if (selectIds != "" && selectIds != null) {

		$.ajax({
			type : "POST",
			url : "order/deleteOrder.html",
			data : {
				"ids" : selectIds
			},
			dataType : "html",
			timeout : 1000,
			error : function() {
				alert("删除失败error");
				window.location.href = "order/orderList.html";
			},
			success : function(result) {
				if (result == "success") {
					window.location.href = "order/orderList.html";
					alert("车次" + selectIds + "删除成功了");
				} else if (result == "failed") {
					window.location.href = "order/orderList.html";
					alert("删除失败");
				}
			},
		});

	} else {
		alert("请选择车次");
	}

});

$('.vieworder').click(function(e) {
	var m_id = $(this).attr('id');
	$.ajax({
		url : 'order/getOrder.html',
		type : 'POST',
		data : {
			id : m_id,
			fs : m_id
		},
		dataType : 'html',
		timeout : 1000,
		error : function() {
			alert("error");
		},
		success : function(result) {
			if ("failed" == result) {
				alert("操作超时！");
			} else if ("nodata" == result) {
				alert("没有数据！");
			} else {
				m = eval('(' + result + ')');
				$("#payment").html(m.order.payment);
				$("#paymentType").html(m.order.paymentType);
				$("#postFee").html(m.order.postFee);
				$("#status").html(m.status);
				$("#shippingName").html(m.order.shippingName);
				$("#shippingCode").html(m.order.shippingCode);

				jQuery.each(m.itemList, function(i, val) {

					var str = "<tr>";
					str += "<td>" + val.title + "</td>";
					str += "<td>" + val.num + "</td>";
					str += "<td>" + val.price + "</td>";
					str += "<td>" + val.totalFee + "</td>";
					str += "<td>" + val.picPath + "</td>";
					str += "</tr>";
					$('.viewOrderItemTr').append(str);
				});

			}
		}
	});

	e.preventDefault();
	$('#viewOrderModal').modal('show');
});

// Date日期类型以json形式显示到前台时，显示为[object Object]问题
// 解决方法二：在js中转换
// function toDate(v,r,i) {
// var date = new Date();
// date.setTime(v.time);
// var y = date.getFullYear();
// var m = date.getMonth()+1;
// m = m<10?'0'+m:m;
// var d = date.getDate();
// d = d<10?("0"+d):d;
// var h = date.getHours();
// h = h<10?("0"+h):h;
// var M = date.getMinutes();
// M = M<10?("0"+M):M;
// // var str = y+"-"+m+"-"+d+" "+h+":"+M;
// var str = y+" 年 "+m+" 月 "+d+" 日";
// return str;
//
// }

$('.addOrder').click(function(e) {
	$("#add_formtip").html('');
	e.preventDefault();
	$('#addOrderDiv').modal('show');
});

$('#addorderBtn').click(function(e) {
	var listItem = new Array();
	$(".orderItemTr").find("tr").each(function() {
		var tdArr = $(this).children();
		var title = tdArr.eq(0).find('input').val();
		var num = tdArr.eq(1).find('input').val();
		var price = tdArr.eq(2).find('input').val();
		var totalFee = tdArr.eq(3).find('input').val();
		var picPath = tdArr.eq(4).find('input').val();
		var itemMap = {};
		itemMap['title'] = title;
		itemMap['num'] = num;
		itemMap['price'] = price;
		itemMap['totalFee'] = totalFee;
		itemMap['picPath'] = picPath;
		listItem.push(itemMap);
	});
	$.ajax({
		type : "POST",
		url : "order/addOrder.html",
		data : {
			userId : $.trim($("#orderuserId").val()),
			payment : $.trim($("#orderpayment").val()),
			paymentType : $.trim($("#orderpaymentType").val()),
			postFee : $.trim($("#orderpostFee").val()),
			status : $.trim($("#orderstatus").val()),
			shippingName : $.trim($("#ordershippingName").val()),
			shippingCode : $.trim($("#ordershippingCode").val()),
			buyerRate : $.trim($("#orderbuyerRate").val()),
			orderItem : JSON.stringify(listItem)
		},
		dataType : "html",
		timeout : 1000,
		error : function() {
		},
		success : function(result) {
			$('#addOrderDiv').modal('hide');
			window.location.href = "order/orderList.html";
		},
	});
});

function addOrderFunction() {
	$("#add_formtip").html("");
	var result = true;
	if ($("#train_no").val() == "") {
		$("#add_formtip").css("color", "red");
		$("#add_formtip").append("<li>对不起，车次不能为空。</li>");
		result = false;
	}
	if ($("#start_station").val() == "") {
		$("#add_formtip").css("color", "red");
		$("#add_formtip").append("<li>对不起，发车不能为空。</li>");
		result = false;
	}
	if ($("#arrival_station").val() == "") {
		$("#add_formtip").css("color", "red");
		$("#add_formtip").append("<li>对不起，到达不能为空。</li>");
		result = false;
	}
	if ($("#start_time").val() == "") {
		$("#add_formtip").css("color", "red");
		$("#add_formtip").append("<li>对不起，发时不能为空。</li>");
		result = false;
	}
	if ($("#arrival_time").val() == "") {
		$("#add_formtip").css("color", "red");
		$("#add_formtip").append("<li>对不起，到时不能为空。</li>");
		result = false;
	}
	if ($("#type").val() == "") {
		$("#add_formtip").css("color", "red");
		$("#add_formtip").append("<li>对不起，车型不能为空。</li>");
		result = false;
	}
	// if(result == true) alert("添加成功 ^_^");
	return result;
}

$('.addordercancel').click(function(e) {
	$('#orderuserId').val('');
	$('#orderpayment').val('');
	$('#orderpaymentType').val('');
	$('#orderpostFee').val('');
	$('#orderstatus').val('');
	$('#ordershippingName').val('');
	$('#ordershippingCode').val('');
	$('#orderbuyerRate').val('');
});

function updateOrderFun(id) {
	$.ajax({
		type : "POST",
		url : "order/getOrder.html",
		data : {
			id : id
		},
		dataType : "html",
		timeout : 1000,
		error : function() {
			alert("error");
		},
		success : function(result) {
			if ("failed" == result) {
				alert("操作超时！");
			} else if ("nodata" == result) {
				alert("没有数据！");
			} else {
				m = eval('(' + result + ')');
				$("#updateuserId").val(m.userId);
				$("#updatepayment").val(m.payment);
				$("#updatepaymentType").val(m.paymentType);
				$("#updatepostFee").val(m.postFee);
				$("#updatestatus").val(m.status);
				$("#updateshippingCode").val(m.shippingCode);

			}
		}
	});
}

$('#updateOrderBtn').click(function(e) {
	// addUserFunction
	$.ajax({
		type : "POST",
		url : "order/updateOrder.html",
		data : {
			userId : $.trim($("#updateuserId").val()),
			payment : $.trim($("#updatepayment").val()),
			paymentType : $.trim($("#updatepaymentType").val()),
			postFee : $.trim($("#updatepostFee").val()),
			status : $.trim($("#updatestatus").val()),
			shippingCode : $.trim($("#updateshippingCode").val())

		// 最后一个不需要逗号

		},
		dataType : "html",
		timeout : 1000,
		error : function() {
		},
		success : function(result) {
			$('#updateOrderDiv').modal('hide');
			window.location.href = "order/orderList.html";
		},
	});
});

$('.updateordercancel').click(function(e) {
	$("#updateuserId").val('');
	$("#updatepayment").val('');
	$("#updatepaymentType").val('');
	$("#updatepostFee").val('');
	$("#updatestatus").val('');
	$("#updateshippingCode").val('');

});
$('#addorderItemBtn')
		.click(
				function(e) {
					var str = "<tr id='addOrderItem" + itemNumber + "'>";
					str += "<td><input name='title'></td>";
					str += "<td><input name='num'></td>";
					str += "<td><input name='price'></td>";
					str += "<td><input name='totalFee'></td>";
					str += "<td><input name='picPath'></td>";
					str += "<td><input type='button' value='删除' onclick = 'delOrderItemFun("
							+ itemNumber + ")'></td>";
					str += "</tr>";
					$('.orderItemTr').append(str);
					itemNumber++;
				});

function delOrderItemFun(id) {
	$("#addOrderItem" + id).remove();
}
