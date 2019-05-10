<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/common/head.jsp"%>

<div id="content" class="span10">

	<div>
		<ul class="breadcrumb">
			<li><a href="javascript:void();">后台管理</a> <span class="divider">/</span></li>
			<li><a href="javascript:void();">用户信息管理</a></li>
		</ul>
	</div>

	<div class="row-fluid sortable">

		<div class="box span12">
			<div class="box-header well" data-original-title>
				<h2>
					<i class="icon-th"></i> 菜单信息
				</h2>
				 <div class="box-icon"><span class="btn btn-small btn-primary addMenu" >
								<i class="icon-plus icon-white"></i> 添加 </span>
				  </div>
				</div>
			<div class="box-content">
				<table
					class="table table-striped table-bordered bootstrap-datatable datatable">
					<thead>
						<tr>
							<th><input type="button" value="删除" id="myDelMenuBtn" ></th>
							<th>编号</th>
							<th>父级编号</th>
							<th>所有父级编号</th>
							<th>名称</th>
							<th>排序</th>
							<th>链接</th>
							<th>链接类型</th>
							<th>目标</th>
							<th>图标</th>
							<th>是否在菜单中显示</th>
							<th>权限标识</th>
							<th>创建者</th>
							<th>创建时间</th>
							<th>更新者</th>
							<th>更新时间</th>
							<th>备注信息</th>
							<th>删除标记</th>
							<th>版本号</th>
							<th>操作</th>
							<th>修改</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${menuList }" var="menu">
							<tr>
								<td><input type="checkbox" class="checkbox" name="delMenu" value="${menu.id }"></td>
								<td><a class="viewmenu" id="${menu.id }">${menu.id }</a></td>
								<td>${menu.parentIdStr}</td>
								<td>${menu.parentIdsStr }</td>
								<td>${menu.name }</td>
								<td>${menu.sort}</td>
								<td>${menu.href}</td>
								<td>${menu.hrefType}</td>
								<td>${menu.target}</td>
								<td>${menu.icon}</td>
								<td>${menu.isShow }</td>
								<td>${menu.permission}</td>
								<td>${menu.createBy}</td>
								<td>${menu.createDateStr }</td>
								<td>${menu.updateBy }</td>
								<td>${menu.updateDateStr}</td>
								<td>${menu.remarks}</td>
								<td>${menu.delFlag }</td>
								<td>${menu.version}</td>
								<td><input type="button" value="下一级菜单"  onclick="addNextMenu('${menu.id}','${menu.parentIds}')"></td>
								<td><input type="button" value="x"  onclick="updateMenuFun(${menu.id})"></td>
							</tr >
						</c:forEach>
					</tbody>
				</table>
			</div>

			
		</div>
	</div>
</div>

 <!-- 查看菜单详情信息 -->
 <div class="modal hide fade" id="myMenuModal">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal">×</button>
		<h3>用户详细信息</h3>
	</div>
	<div class="modal-body">
		   <table class="table table-bordered bootstrap-datatable ">
			<tbody>
				<tr>
					<td>名称</td>
					<td id="strname"></td>
				</tr>
				<tr>
					<td>链接</td>
					<td  id="strhref"></td>
				</tr>
				
				<tr>
					<td>图标</td>
					<td  id="strtarget"></td>
				</tr>
				
			</tbody>
		</table>
	</div>
	<div class="modal-footer">
		<a href="#" class="btn btn-primary" data-dismiss="modal">关闭</a> 
	</div>
</div>

<!-- 添加菜单信息的表单 -->
<div class="modal hide fade" id="addMenuDiv" > 
 <!-- <form action="backend/addTrain.html"  method="post" onsubmit="return addTrainFunction();" > -->
 	<input  id="addParentId" type="hidden">
 	<input id="addParentIds" type="hidden">
 	
	<div class="modal-header">
		<button type="button" class="close  addmenucancel" data-dismiss="modal">×</button>
		<h3>添加菜单</h3>
	</div>
	<div class="modal-body">
			<ul id="add_formtip2"></ul>
               <ul class="topul">
                  <li><label>名称：</label><input type="text" id="name" name="name" value="" />
                    				<span style="color:red;font-weight: bold;">*</span></li>
                  <li><label>链接：</label><input type="text" id="href" name="href" value=""></li>
                  <li><label>目标：</label><input type="text" id="target" name="target" value="">
                  					<span style="color:red;font-weight: bold;">*</span></li>
                  <li><label>排序：</label><input type="text" id="sort" name="sort" value="">
                  					<span style="color:red;font-weight: bold;">*</span></li>
                  <li><label>图标：</label><input type="text" id="icon" name="icon" value="">
                  					<span style="color:red;font-weight: bold;">*</span></li>
                  
               </ul>
	</div>
	<div class="modal-footer">
		<a href="#" class="btn addmenucancel" data-dismiss="modal">关闭</a>
		<input type="button"  id="addMenuBtn" class="btn btn-primary" value="保存" />
	</div>
	<!-- </form> -->
</div>

<!-- 修改菜单 -->
<div class="modal hide fade" id="updateMenuDiv" > 
 <!-- <form action="backend/addTrain.html"  method="post" onsubmit="return addTrainFunction();" > -->
 	
 	
	<div class="modal-header">
		<button type="button" class="close  updatemenucancel" data-dismiss="modal">×</button>
		<h3>修改用户</h3>
	</div>
	<div class="modal-body">
		<input id="updateId" type="hidden"/>
		<ul id="update_formtip"></ul>
        <ul class="topul">
           <li><label>名称：</label><input type="text" id="updatename" value="" />
             				<span style="color:red;font-weight: bold;">*</span></li>
           <li><label>排序：</label><input type="text" id="updateshort" value=""></li>
           <li><label>链接：</label><input type="text" id="updatehref"  value="">
           					<span style="color:red;font-weight: bold;">*</span></li>
           <li><label>链接类型：</label><input type="text" id="updatehrefType" value="">
           					<span style="color:red;font-weight: bold;">*</span></li>
           <li><label>目标：</label><input type="text" id="updatetarget" value="">
           					<span style="color:red;font-weight: bold;">*</span></li>
           <li><label>权限标识：</label><input type="text" id="updatepermission"value="">
           					<span style="color:red;font-weight: bold;">*</span></li>
           
        </ul>
	</div>
	<div class="modal-footer">
		<a href="#" class="btn updatemenucancel" data-dismiss="modal">关闭</a>
		<input type="button"  id="updateMenuBtn" class="btn btn-primary" value="修改" />
	</div>
	<!-- </form> -->
</div>





<%@include file="/WEB-INF/pages/common/foot.jsp"%>
<script src="statics/localjs/menu.js?2"></script>		