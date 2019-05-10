
$('.viewmenu').click(function(e) {
	var m_id =$(this).attr('id');
	$.ajax({
		url:'menu/backend/getMenu.html',
		type:'post',
		data:{id:m_id},
		dataType:'html',
		timeout:1000,
		error:function(){
			alert("alert");
		},
		success:function(result){
			if("failed" == result){
				alert("没有数据");
				}
			else if("nodata" == result){
				alert("操作超时");
			}else{
				m = eval('(' + result + ')');
				console.log(m);
				$("#strname").html(m.name);
				$("#strhref").html(m.href);
				$("#strtarget").html(m.target);
				
			}
		}
	});
	e.preventDefault();
	$('#myMenuModal').modal('show');
});


$("#myDelMenuBtn").click(function(){
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
   			url: "menu/delete1.html",
   			data: {"ids":selectIds},
   			dataType: "html",
   	  		timeout:1000,
   			error: function () {
   			   alert("删除失败error");
   				window.location.href = "menu/backend/menuList.html";
   	        },
   	        success: function(result){
   	        	if(result == "success"){
   	 			   window.location.href = "menu/backend/menuList.html";
   	 			  alert("编号 "+selectIds+"删除成功了");
   	        	}else if(result == "failed"){
   	        		window.location.href = "menu/backend/menuList.html";
   	        		 alert("删除失败");
   	        	}
   	        },
   		});
   	  	
   	}else{
	    	alert("请选择编号");
	    }
	    
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
function addNextMenu(parentId,parentIds) {
	$('#addParentId').val(parentId);
	$('#addParentIds').val(parentIds+parentId+",");
	$('#add_formtip2').html("");
	$('#addMenuDiv').modal('show');
}



$('.addMenu').click(function(e){
	$('#addParentId').val("");
	$('#addParentIds').val("");
	$("#add_formtip2").html('');
	e.preventDefault();
	$('#addMenuDiv').modal('show');
});
$('#addMenuBtn').click(function(e){
	if(addMenuFunction()) {
		$.ajax({
			type : "POST",
			url : "menu/backend/addMenu.html",
			data : {
				name : $.trim($("#name").val()),
				href : $.trim($("#href").val()),
				target : $.trim($("#target").val()),
				sort : $.trim($("#sort").val()),
				icon : $.trim($("#icon").val()),
				parentId:$.trim($('#addParentId').val()),
				parentIds:$.trim($('#addParentIds').val())
				
			},
			dataType : "html",
			timeout : 1000,
			error : function() {
			},
			success : function(result) {
				if(result == "0000"){
					$('#addMenuDiv').modal('hide');
					window.location.href = "menu/backend/menuList.html";
				}else{
					alert("保存失败");	
					window.location.href = "menu/backend/menuList.html";
				}
			},
		});
	}
});


function addMenuFunction(){
	$("#add_formtip2").html("");
	var result = true;
	if($("#name").val() == ""){
		$("#add_formtip2").css("color","red");
		$("#add_formtip2").append("<li>对不起，车次不能为空。</li>");
		result = false;
	}
	if($("#href").val() == ""){
		$("#add_formtip2").css("color","red");
		$("#add_formtip2").append("<li>对不起，发车不能为空。</li>");
		result = false;
	}
	if($("#target").val() == ""){
		$("#add_formtip2").css("color","red");
		$("#add_formtip2").append("<li>对不起，到达不能为空。</li>");
		result = false;
	}
	if($("#sort").val() == ""){
		$("#add_formtip2").css("color","red");
		$("#add_formtip2").append("<li>对不起，发时不能为空。</li>");
		result = false;
	}
	if($("#icon").val() == ""){
		$("#add_formtip2").css("color","red");
		$("#add_formtip2").append("<li>对不起，到时不能为空。</li>");
		result = false;
	}
	
//	if(result == true) alert("添加成功 ^_^");
	return result;
}

$('.addmenucancel').click(function(e) {
	$('#name').val('');
	$('#href').val('');
	$('#target').val('');
	$('#sort').val('');
	$('#icon').val('');
	
});




function updateMenuFun(id) {
	$.ajax({
		type : "POST",
		url : "menu/backend/getMenu.html",
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
				$("#updatename").val(m.name);
				$("#updateshort").val(m.short);
				$("#updatehref").val(m.href);
				$("#updatehrefType").val(m.hrefType);
				$("#updatetarget").val(m.target);
				$("#updatepermission").val(m.permission);
				
				$('#updateMenuDiv').modal('show');
			}
		}
	});
}



$('#updateMenuBtn').click(function(e) {
	// addUserFunction
	$.ajax({
		type : "POST",
		url : "menu/backend/updateMenu.html",
		data : {
			id : $.trim($("#updateId").val()),
			name : $.trim($("#updatename").val()),
			sort : $.trim($("#updateshort").val()),
			href : $.trim($("#updatehref").val()),
			href_type : $.trim($("#updatehrefType").val()),
			target : $.trim($("#updatetarget").val()),
			permission : $.trim($("#updatepermission").val())
		// 最后一个不需要逗号

		},
		dataType : "html",
		timeout : 1000,
		error : function() {
		},
		success : function(result) {
			$('#updateMenuDiv').modal('hide');
			window.location.href = "menu/backend/menuList.html";
		},
	});
});
	
$('.updatemenucancel').click(function(e) {
	$("#updatename").val('');          
	$("#updateshort").val('');    
	$("#updatehref").val('');    
	$("#updatehrefType").val('');    
	$("#updatetarget").val('');       
	$("#updatepermission").val('');    
	$("#updateId").val('');     
});

