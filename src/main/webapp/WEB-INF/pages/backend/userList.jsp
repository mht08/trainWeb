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
					<i class="icon-th"></i> 用户信息
				</h2>
			 <div class="box-icon"><span class="btn btn-small btn-primary addUser" >
								<i class="icon-plus icon-white"></i> 添加 </span>
				  </div>

			</div>
			<div class="box-content">
				<table
					class="table table-striped table-bordered bootstrap-datatable datatable">
					<thead>
						<tr>
							<th><input type="button" value="删除" id="myDelUserBtn" ></th>
							<th>编号</th>
							<th>登录名</th>
							<th>真实姓名</th>
							<th>电话</th>
							<th>地址</th>
							<th>生日</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${userList }" var="user">
							<tr>
								<td><input type="checkbox" class="checkbox" name="delUser" value="${user.id }"></td>
								<td><a class="viewuser" id="${user.id }">${user.id }</a></td>
								<td>${user.username}</td>
								<td>${user.realname }</td>
								<td>${user.telphone }</td>
								<td>${user.address }</td>
								<td>${user.birthday}</td>
								<td><input type="button" value="x"  onclick="updateUserFun(${user.id})"></td>
							</tr >
						</c:forEach>
					</tbody>
				</table>
			</div>

			
		</div>
	</div>
</div>

<!-- 查看用户信息 -->
<div class="modal hide fade" id="myUserModal">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal">×</button>
		<h3>用户详细信息</h3>
	</div>
	<div class="modal-body">
		   <table class="table table-bordered bootstrap-datatable ">
			<tbody>
				<tr>
					<td>编号</td>
					<td id="userId"></td>
				</tr>
				<tr>
					<td>用户名</td>
					<td  id="userUsername"></td>
				</tr>
				<tr>
					<td>密码</td>
					<td  id="userPassword"></td>
				</tr>
				<tr>
					<td>真实姓名</td>
					<td  id="userRealname"></td>
				</tr>
				<tr>
					<td>生日</td>
					<td  id="userBirth"></td>
				</tr>
				<tr>
					<td>电话</td>
					<td  id="userTelphone"></td>
				</tr>
				<tr>
					<td>地址</td>
					<td  id="userAddress"></td>
				</tr>
				
			</tbody>
		</table>
	</div>
	<div class="modal-footer">
		<a href="#" class="btn btn-primary" data-dismiss="modal">关闭</a> 
	</div>
</div>

<!-- 添加用户信息的表单 -->
<div class="modal hide fade" id="addUserDiv" > 
 <!-- <form action="backend/addTrain.html"  method="post" onsubmit="return addTrainFunction();" > -->
	<div class="modal-header">
		<button type="button" class="close  addusercancel" data-dismiss="modal">×</button>
		<h3>添加用户</h3>
	</div>
	<div class="modal-body">
			<ul id="add_formtip1"></ul>
               <ul class="topul">
                  <li><label>登录名：</label><input type="text" id="username" name="username" value="" />
                    				<span style="color:red;font-weight: bold;">*</span></li>
                  <li><label>真实姓名：</label><input type="text" id="realname" name="realname" value=""></li>
                  <li><label>电话：</label><input type="text" id="telphone" name="telphone" value="">
                  					<span style="color:red;font-weight: bold;">*</span></li>
                  <li><label>地址：</label><input type="text" id="address" name="address" value="">
                  					<span style="color:red;font-weight: bold;">*</span></li>
                  <li><label>生日：</label><input type="text" id="birthday" name="birthday" value="">
                  					<span style="color:red;font-weight: bold;">*</span></li>
                  
               </ul>
	</div>
	<div class="modal-footer">
		<a href="#" class="btn addusercancel" data-dismiss="modal">关闭</a>
		<input type="button"  id="addUserBtn" class="btn btn-primary" value="保存" />
	</div>
	<!-- </form> -->
</div>



<!-- 修改用户 -->
<div class="modal hide fade" id="updateUserDiv" > 
 <!-- <form action="backend/addTrain.html"  method="post" onsubmit="return addTrainFunction();" > -->
 	
 	
	<div class="modal-header">
		<button type="button" class="close  updateusercancel" data-dismiss="modal">×</button>
		<h3>修改用户</h3>
	</div>
	<div class="modal-body">
		<input id="updateId" type="hidden"/>
		<ul id="update_formtip"></ul>
        <ul class="topul">
           <li><label>名称：</label><input type="text" id="updateUsername" value="" />
             				<span style="color:red;font-weight: bold;">*</span></li>
           <li><label>密码：</label><input type="text" id="updatePassword" value=""></li>
           <li><label>真实名字：</label><input type="text" id="updateRealname"  value="">
           					<span style="color:red;font-weight: bold;">*</span></li>
           <li><label>地址：</label><input type="text" id="updateAddress" value="">
           					<span style="color:red;font-weight: bold;">*</span></li>
           <li><label>电话：</label><input type="text" id="updateTelphone" value="">
           					<span style="color:red;font-weight: bold;">*</span></li>
           <li><label>生日：</label><input type="text" id="updateBirth"value="">
           					<span style="color:red;font-weight: bold;">*</span></li>
           
        </ul>
	</div>
	<div class="modal-footer">
		<a href="#" class="btn updateusercancel" data-dismiss="modal">关闭</a>
		<input type="button"  id="updateUserBtn" class="btn btn-primary" value="修改" />
	</div>
	<!-- </form> -->
</div>




<%@include file="/WEB-INF/pages/common/foot.jsp"%>
<script src="statics/localjs/user.js?3"></script>		

	