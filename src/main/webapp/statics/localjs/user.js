

$("#myDelUserBtn").click(function(){
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
  			url: "user/delete2.html",
  			data: {"ids":selectIds},
  			dataType: "html",
  	  		timeout:1000,
  			error: function () {
  			   alert("删除失败error");
  				window.location.href = "user/backend/userList.html";
  	        },
  	        success: function(result){
  	        	if(result == "success"){
  	 			   window.location.href = "user/backend/userList.html";
  	 			  alert("编号 "+selectIds+"删除成功了");
  	        	}else if(result == "failed"){
  	        		window.location.href = "user/backend/userList.html";
  	        		 alert("删除失败");
  	        	}
  	        },
  		});
  	  	
  	}else{
	    	alert("请选择编号");
	    }
	    
});





$('.viewuser').click(function(e){
	var m_id = $(this).attr('id');
	$.ajax({
		url: 'user/backend/getUser.html',
		type: 'POST',
		data: {id:m_id},
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
				$("#userId").html(m.id);
				$("#userUsername").html(m.username);
				$("#userPassword").html(m.password);
				$("#userRealname").html(m.realname);
				$("#userBirth").html(m.birthday);
				$("#userTelphone").html(m.telphone);
				$("#userAddress").html(m.address);
				
			}
		}
	});
	
	e.preventDefault();
	$('#myUserModal').modal('show');
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




$('.addUser').click(function(e){
	$("#add_formtip1").html('');
	e.preventDefault();
	$('#addUserDiv').modal('show');
});

$('#addUserBtn').click(function(e){
	// addUserFunction 
	if(addUserFunction()) {
		$.ajax({
			type : "POST",
			url : "user/backend/addUser.html",
			data : {
				username : $.trim($("#username").val()),
				realname : $.trim($("#realname").val()),
				telphone : $.trim($("#telphone").val()),
				address : $.trim($("#address").val()),
				birthday : $.trim($("#birthday").val()) //  最后一个不需要逗号
				
			},
			dataType : "html",
			timeout : 1000,
			error : function() {
			},
			success : function(result) {
				$('#addUserDiv').modal('hide');
				window.location.href = "user/backend/userList.html";
			},
		});
	}
});

function addUserFunction(){
	$("#add_formtip1").html("");
	var result = true;
	if($("#username").val() == ""){
		$("#add_formtip1").css("color","red");
		$("#add_formtip1").append("<li>对不起，用户名不能为空。</li>");
		result = false;
	}
	if($("#realname").val() == ""){
		$("#add_formtip1").css("color","red");
		$("#add_formtip1").append("<li>对不起，真实姓名不能为空。</li>");
		result = false;
	}
	if($("#telphone").val() == ""){
		$("#add_formtip1").css("color","red");
		$("#add_formtip1").append("<li>对不起，电话不能为空。</li>");
		result = false;
	}
	if($("#address").val() == ""){
		$("#add_formtip1").css("color","red");
		$("#add_formtip1").append("<li>对不起，地址不能为空。</li>");
		result = false;
	}
	if($("#birthday").val() == ""){
		$("#add_formtip1").css("color","red");
		$("#add_formtip1").append("<li>对不起，生日不能为空。</li>");
		result = false;
	}
	
//	if(result == true) alert("添加成功 ^_^");
	return result;
}

$('.addusercancel').click(function(e) {
	$('#username').val('');
	$('#realname').val('');
	$('#telphone').val('');
	$('#address').val('');
	$('#birthday').val('');
	
});



