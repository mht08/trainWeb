<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/common/head.jsp"%>


<div id="content" class="span10">

	<div>
		<ul class="breadcrumb">
			<li><a href="javascript:void();">后台管理</a> <span class="divider">/</span></li>
			<li><a href="javascript:void();">火车信息管理</a></li>
		</ul>
	</div>

	<div class="row-fluid sortable">

		<div class="box span12">
			<div class="box-header well" data-original-title>
				<h2><i class="icon-th"></i> 角色信息</h2>
				  <div class="box-icon"><span class="btn btn-small btn-primary addRole" >
								<i class="icon-plus icon-white"></i> 添加 </span>
				  </div>
			  	
			 </div>
			<div class="box-content">
				<table class="table table-striped table-bordered bootstrap-datatable datatable">
					<thead>
						<tr>
							<th><input type="button" value="删除" id="myDelRoleBtn" ></th>
							<th>编号</th>
							<th>角色名称</th>
							<th>英文名称</th>
							<th>角色类型</th>
							<th>数据范围</th>
							<th>是否系统数据</th>
							<th>是否可用</th>
							<th>创建者</th>
							<th>创建时间</th>
							<th>更新者</th>
							<th>更新时间</th>
							<th>备注信息</th>
							<th>删除标记</th>
							<th>版本号</th>
							<th>修改</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${roleList}" var="role">
							<tr>
								<td><input type="checkbox" class="checkbox" name="delRole" value="${role.id }"></td>
								<td><a class="viewrole" id="${role.id }">${role.id  }</a></td>
								<td>${role.name }</td>
								<td>${role.enname }</td>
								<td>${role.roleType }</td>
								<td>${role.dataScope }</td>
								<td>${role.isSys }</td>
								<td>${role.useable }</td>
								<td>${role.createBy }</td>
								<td>${role.createDateStr }</td>
								<td>${role.updateBy }</td>
								<td>${role.updateDate }</td>
								<td>${role.remarks }</td>
								<td>${role.delFlag }</td>
								<td>${role.version }</td>
								<td><input type="button" value="x"  onclick="updateRoleFun(${role.id})"></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			
		</div>
	</div>
</div>


<!-- 添加角色的表单 -->
<div class="modal hide fade" id="addRoleDiv" > 
 <!-- <form action="backend/addTrain.html"  method="post" onsubmit="return addTrainFunction();" > -->
	<div class="modal-header">
		<button type="button" class="close  addrolecancel" data-dismiss="modal">×</button>
		<h3>添加火车车次</h3>
	</div>
	<div class="modal-body">
			<ul id="add_formtip"></ul>
               <ul class="topul">
                  <li><label>角色名称：</label><input type="text" id="name" name="name" value="" />
                    				<span style="color:red;font-weight: bold;">*</span></li>
                  <li><label>英文名称：</label><input type="text" id="enname" name="enname" value=""></li>
                  <li><label>角色类型：</label><input type="text" id="roleType" name="roleType" value="">
                  					<span style="color:red;font-weight: bold;">*</span></li>
                  <li><label>数据范围：</label><input type="text" id="dataScope" name="dataScope" value="">
                  					<span style="color:red;font-weight: bold;">*</span></li>
                  <li><label>创建时间：</label><input type="text" id="createDateStr" name="createDateStr" value="">
                  					<span style="color:red;font-weight: bold;">*</span></li>
                  <li><label>创建者：</label><input type="text" id="createBy" name="createBy" value="">
                  					<span style="color:red;font-weight: bold;">*</span></li>
                  <li><label>是否系统数据：</label><input type="text" id="isSys" name="isSys" value="">
                  					<span style="color:red;font-weight: bold;">*</span></li>
                  <li><label>是否可用：</label><input type="text" id="useable" name="useable" value=""></li>
               </ul>
	</div>
	<div class="modal-footer">
		<a href="#" class="btn addrolecancel" data-dismiss="modal">关闭</a>
		<input type="button"  id="addRoleBtn" class="btn btn-primary" value="保存" />
	</div>
	<!-- </form> -->
</div>

<!-- 查看火车详信息 -->
<div class="modal hide fade" id="viewRoleModal">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal">×</button>
		<h3>角色详情</h3>
	</div>
	<div class="modal-body">

 				<table class="table table-bordered bootstrap-datatable ">
			<tbody>
				<tr>
					<td>角色名称</td>
					<td id="edit_name"></td>
				</tr>
				<tr>
					<td>英文名称</td>
					<td>
						<span id="edit_enname"></span></td>
				</tr>
				<tr>
					<td>是否系统数据</td>
					<td> 
					<span id="edit_isSys"></span></td>
				</tr>
				
			</tbody>
		</table>
	</div>
	<div class="modal-footer">
		<a href="#" class="btn btn-primary" data-dismiss="modal">关闭</a>
	</div>
</div> 


<!-- 修改用户 -->
<div class="modal hide fade" id="updateRoleDiv" > 
 <!-- <form action="backend/addTrain.html"  method="post" onsubmit="return addTrainFunction();" > -->
 	
 	
	<div class="modal-header">
		<button type="button" class="close  updaterolecancel" data-dismiss="modal">×</button>
		<h3>修改用户</h3>
	</div>
	<div class="modal-body">
		<input id="updateId" type="hidden"/>
		<ul id="update_formtip"></ul>
        <ul class="topul">
           <li><label>是否可用：</label><input type="text" id="useable" value="" />
             				<span style="color:red;font-weight: bold;">*</span></li>
           <li><label>英文名称：</label><input type="text" id="updateenname" value=""></li>
           <li><label>角色名称：</label><input type="text" id="updatename"  value="">
           					<span style="color:red;font-weight: bold;">*</span></li>
           <li><label>是否系统数据：</label><input type="text" id="updateisSys" value="">
           					<span style="color:red;font-weight: bold;">*</span></li>
           <li><label>角色类型：</label><input type="text" id="updateroleType" value="">
           					<span style="color:red;font-weight: bold;">*</span></li>
           <li><label>备注信息：</label><input type="text" id="updateremarks"value="">
           					<span style="color:red;font-weight: bold;">*</span></li>
           
        </ul>
	</div>
	<div class="modal-footer">
		<a href="#" class="btn updaterolecancel" data-dismiss="modal">关闭</a>
		<input type="button"  id="updateRoleBtn" class="btn btn-primary" value="修改" />
	</div>
	<!-- </form> -->
</div>
<%@include file="/WEB-INF/pages/common/foot.jsp"%>
<script src="statics/localjs/role.js?1"></script>
	
