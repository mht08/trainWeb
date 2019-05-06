$("#myDelRoleBtn").click(function(){
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
    			url: "role/delete.html",
    			data: {"ids":selectIds},
    			dataType: "html",
    	  		timeout:1000,
    			error: function () {
    			   alert("删除失败error");
    				window.location.href = "role/backend/roleList.html";
    	        },
    	        success: function(result){
    	        	if(result == "success"){
    	 			   window.location.href = "role/backend/roleList.html";
    	 			  alert("编号"+selectIds+"删除成功了");
    	        	}else if(result == "failed"){
    	        		window.location.href = "role/backend/roleList.html";
    	        		 alert("删除失败");
    	        	}
    	        },
    		});
    	  	
    	}else{
	    	alert("请选择编号");
	    }
	    
});



$('.viewrole').click(function(e){
	var m_id = $(this).attr('id');
	$.ajax({
		url: 'role/backend/getRole.html',
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
				console.log(m);
				$("#edit_name").html(m.name);
				$("#edit_enname").html(m.enname);
				$("#edit_isSys").html(m.isSys);
				
			}
		}
	});
	
	e.preventDefault();
	$('#viewRoleModal').modal('show');
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

$('.addRole').click(function(e){
	$("#add_formtip").html('');
	e.preventDefault();
	$('#addRoleDiv').modal('show');
});



$('#addRoleBtn').click(function(e){
	if(addRoleFunction()) {
		$.ajax({
			type : "POST",
			url : "role/backend/addRole.html",
			data : {
				name : $.trim($("#name").val()),
				enname : $.trim($("#enname").val()),
				roleType : $.trim($("#roleType").val()),
				dataScope : $.trim($("#dataScope").val()),
				createDateStr : $.trim($("#createDateStr").val()),
				createBy : $.trim($("#createBy").val()),
				isSys : $.trim($("#isSys").val()),
				useable : $.trim($("#useable").val())
				
			},
			dataType : "html",
			timeout : 1000,
			error : function() {
			},
			success : function(result) {
				$('#addRoleDiv').modal('hide');
				window.location.href = "role/backend/roleList.html";
			},
		});
	}
});


function addRoleFunction(){
	$("#add_formtip").html("");
	var result = true;
	if($("#name").val() == ""){
		$("#add_formtip").css("color","red");
		$("#add_formtip").append("<li>对不起，车次不能为空。</li>");
		result = false;
	}
	if($("#enname").val() == ""){
		$("#add_formtip").css("color","red");
		$("#add_formtip").append("<li>对不起，发车不能为空。</li>");
		result = false;
	}
	if($("#roleType").val() == ""){
		$("#add_formtip").css("color","red");
		$("#add_formtip").append("<li>对不起，到达不能为空。</li>");
		result = false;
	}
	if($("#dataScope").val() == ""){
		$("#add_formtip").css("color","red");
		$("#add_formtip").append("<li>对不起，发时不能为空。</li>");
		result = false;
	}
	if($("#createDateStr").val() == ""){
		$("#add_formtip").css("color","red");
		$("#add_formtip").append("<li>对不起，到时不能为空。</li>");
		result = false;
	}
	if($("#createBy").val() == ""){
		$("#add_formtip").css("color","red");
		$("#add_formtip").append("<li>对不起，车型不能为空。</li>");
		result = false;
	}
	if($("#isSys").val() == ""){
		$("#add_formtip").css("color","red");
		$("#add_formtip").append("<li>对不起，车型不能为空。</li>");
		result = false;
	}
	if($("#useable").val() == ""){
		$("#add_formtip").css("color","red");
		$("#add_formtip").append("<li>对不起，车型不能为空。</li>");
		result = false;
	}
//	if(result == true) alert("添加成功 ^_^");
	return result;
}

$('.addrolecancel').click(function(e) {
	$('#name').val('');
	$('#enname').val('');
	$('#roleType').val('');
	$('#dataScope').val('');
	$('#createDateStr').val('');
	$('#createBy').val('');
	$('#isSys').val('');
	$('#useable').val('');
});



