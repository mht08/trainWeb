$("#myDelTrainBtn").click(function(){
	 var trs = $("table").find("tr"); //获取表格每一行
	 var selectIds = "";
	    trs.each(function() {  // 遍历
	        var isChecked = $(this).find(".checkbox").prop("checked");  // 获取当前行checkbox选择状态；
	        if(isChecked == true || isChecked == "true") { // 如果选中
	        	selectIds += $(this).find(".checkbox").val()+" "; // checkbox的value
	        }
	    })
	    
    	if(selectIds != "" && selectIds != null){
    		
    	  	$.ajax({
    			type: "POST",
    			url: "train/delete.html",
    			data: {"ids":selectIds},
    			dataType: "html",
    	  		timeout:1000,
    			error: function () {
    			   alert("删除失败error");
    				window.location.href = "train/backend/trainList.html";
    	        },
    	        success: function(result){
    	        	if(result == "success"){
    	 			   window.location.href = "train/backend/trainList.html";
    	 			  alert("车次"+selectIds+"删除成功了");
    	        	}else if(result == "failed"){
    	        		window.location.href = "train/backend/trainList.html";
    	        		 alert("删除失败");
    	        	}
    	        },
    		});
    	  	
    	}else{
	    	alert("请选择车次");
	    }
	    
});



$('.viewtrain').click(function(e){
	var m_id = $(this).attr('id');
	$.ajax({
		url: 'train/backend/getTrain.html',
		type: 'POST',
		data: {
			id:m_id,
			fs:m_id
			},
		dataType: 'html',
		timeout: 1000,
		error: function(){
			alert("error");
		},
		success:function(result){
			if("failed" == result){
				alert("操作超时！");
			}else if("nodata" == result){
				alert("没有数据！");
			}else{
				m = eval('(' + result + ')');
				$("#trainNo").html(m.train_no);
				$("#trainStartStation").html(m.start_station);
				$("#trainAarrivalStation").html(m.arrival_station);
				$("#trainStartTime").html(m.start_time);
				$("#trainAarrivalTime").html(m.arrival_time);
				$("#trainType").html(m.type);
				$("#trainRuntime").html(m.runtime);
				$("#trainMile").html(m.mile);
			}
		}
	});
	
	e.preventDefault();
	$('#viewTrainModal').modal('show');
});





//Date日期类型以json形式显示到前台时，显示为[object Object]问题
//解决方法二：在js中转换
//function toDate(v,r,i) {
//    var date = new Date();
//    date.setTime(v.time);
//    var y = date.getFullYear();
//    var m = date.getMonth()+1;
//    m = m<10?'0'+m:m;
//    var d = date.getDate();
//    d = d<10?("0"+d):d;
//    var h = date.getHours();
//    h = h<10?("0"+h):h;
//    var M = date.getMinutes();
//    M = M<10?("0"+M):M;
//   // var str = y+"-"+m+"-"+d+" "+h+":"+M;
//    var str = y+" 年 "+m+" 月 "+d+" 日";
//    return str;
//
//}

$('.addTrain').click(function(e){
	$("#add_formtip").html('');
	e.preventDefault();
	$('#addTrainDiv').modal('show');
});



$('#addTrainBtn').click(function(e){
	if(addTrainFunction()) {
		$.ajax({
			type : "POST",
			url : "train/backend/addTrain.html",
			data : {
				train_no : $.trim($("#train_no").val()),
				start_station : $.trim($("#start_station").val()),
				arrival_station : $.trim($("#arrival_station").val()),
				start_time : $.trim($("#start_time").val()),
				arrival_time : $.trim($("#arrival_time").val()),
				type : $.trim($("#type").val()),
				runtime : $.trim($("#runtime").val())
			},
			dataType : "html",
			timeout : 1000,
			error : function() {
			},
			success : function(result) {
				$('#addTrainDiv').modal('hide');
				window.location.href = "train/backend/trainList.html";
			},
		});
	}
});


function addTrainFunction(){
	$("#add_formtip").html("");
	var result = true;
	if($("#train_no").val() == ""){
		$("#add_formtip").css("color","red");
		$("#add_formtip").append("<li>对不起，车次不能为空。</li>");
		result = false;
	}
	if($("#start_station").val() == ""){
		$("#add_formtip").css("color","red");
		$("#add_formtip").append("<li>对不起，发车不能为空。</li>");
		result = false;
	}
	if($("#arrival_station").val() == ""){
		$("#add_formtip").css("color","red");
		$("#add_formtip").append("<li>对不起，到达不能为空。</li>");
		result = false;
	}
	if($("#start_time").val() == ""){
		$("#add_formtip").css("color","red");
		$("#add_formtip").append("<li>对不起，发时不能为空。</li>");
		result = false;
	}
	if($("#arrival_time").val() == ""){
		$("#add_formtip").css("color","red");
		$("#add_formtip").append("<li>对不起，到时不能为空。</li>");
		result = false;
	}
	if($("#type").val() == ""){
		$("#add_formtip").css("color","red");
		$("#add_formtip").append("<li>对不起，车型不能为空。</li>");
		result = false;
	}
//	if(result == true) alert("添加成功 ^_^");
	return result;
}

$('.addtraincancel').click(function(e) {
	$('#train_no').val('');
	$('#start_station').val('');
	$('#arrival_station').val('');
	$('#start_time').val('');
	$('#arrival_time').val('');
	$('#type').val('');
	$('#mile').val('');
	$('#runtime').val('');
});


function updateTrainFun(id) {
	$.ajax({
		type : "POST",
		url : "train/backend/getTrain.html",
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
				$("#updateId").val(m.id);
				$("#updatetrainNo").val(m.train_no);
				$("#updatestartStation").val(m.start_station);
				$("#updatearrivalStation").val(m.arrival_station);
				$("#updatestartTime").val(m.start_time);
				$("#updatetype").val(m.type);
				$("#updatemile").val(m.mile);
				
				$('#updateTrainDiv').modal('show');
			}
		}
	});
}



$('#updateTrainBtn').click(function(e) {
	// addUserFunction
	$.ajax({
		type : "POST",
		url : "train/backend/updateTrain.html",
		data : {
			id : $.trim($("#updateId").val()),
			train_no : $.trim($("#updatetrainNo").val()),
			start_station : $.trim($("#updatestartStation").val()),
			arrival_station : $.trim($("#updatearrivalStation").val()),
			start_time : $.trim($("#updatestartTime").val()),
			type : $.trim($("#updatetype").val()),
			mile : $.trim($("#updatemile").val())
		// 最后一个不需要逗号

		},
		dataType : "html",
		timeout : 1000,
		error : function() {
		},
		success : function(result) {
			$('#updateTrainDiv').modal('hide');
			window.location.href = "train/backend/trainList.html";
		},
	});
});
	
$('.updatetraincancel').click(function(e) {
	$("#updateId").val('');          
	$("#updatetrainNo").val('');    
	$("#updatestartStation").val('');    
	$("#updatearrivalStation").val('');    
	$("#updatestartTime").val('');       
	$("#updatetype").val('');    
	$("#updatemile").val('');     
});



