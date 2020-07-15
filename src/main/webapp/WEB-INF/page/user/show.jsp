<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src = "<%=request.getContextPath()%>/res/js/jquery-1.12.4.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		search();
	})

	
	function search(){
		$.post("<%=request.getContextPath()%>/user/show",
				$("#fm").serialize(),
				function(data){
				var html = "";
				var pageInfo = "";
				for (var i = 0; i<data.data.userList.length; i++){
					var user = data.data.userList[i];
					html += "<tr>";
						html += "<td><input type='checkbox' value='"+user.id+"' name = 'id'/></td>";
						html+="<td>"+user.userName+"</td>"
						html+="<td>"+user.userPwd+"</td>"
						html+="<td>"+user.userAge+"</td>"
						if(user.userSex == 0) {
							html+="<td>女</td>"
						}
						if(user.userSex == 1) {
							html+="<td>男</td>"
						}
						html+="<td>"+user.hobbyShow+"</td>"
						html+="<td>"+user.userPhone+"</td>"
						html+="<td><input type='button' value='修改' onclick='toUpdate("+user.id+")'><input type='button' value='删除' onclick='toDel("+user.id+")'></td>"
					html += "</tr>";
				}
				pageInfo += "<input type = 'button' value = '上一页' onclick = 'page(0, "+data.data.pages+")'/>";
				pageInfo += "<input type = 'button' value = '下一页' onclick = 'page(1, "+data.data.pages+")'/>";
				$("#tbd").html(html);
				$("#pageInfo").html(pageInfo);
		})
	}

	function page(status, pages){
		var page = $("#pageNo").val();
		if(status == 0){
			page--;
			if(page < 1){
				alert("已经是第一页");
				return;
			}
		}
		if(status == 1){
			page++;
			if(page > pages){
				alert("已经是最后一页");
				return;
			}
		}
		$("#pageNo").val(page);
		search();
	}

	function loadUser() {
		$("#tbd").empty();
		$("#pageNo").val(1);
		search();
	}

	function toDel(id){
		$.post("<%=request.getContextPath()%>/user/updateDel",
				{"id":id, "isDel":1},
				function(data){
				if(data.code == 200){
					alert(data.msg);
					search();
				}
		})
	}

	function toUpdate(id){
		window.location.href="<%=request.getContextPath()%>/user/toUpdate?id="+id;
	}

	function toAdd(){
		window.location.href="<%=request.getContextPath()%>/user/toAdd";
	}

	function toAdds(){
		window.location.href="<%=request.getContextPath()%>/user/toAdds";
	}

	<%--function deleteAll(){--%>
	<%--	var datas=$('input:checkbox[name="id"]:checked').map(function(){--%>
	<%--		return $(this).val();--%>
	<%--	}).get();--%>
	<%--	$.post("<%=request.getContextPath()%>/user/updateAll",--%>
	<%--			{"ids":datas},--%>
	<%--			function(data){--%>
	<%--				if(data.code == 200){--%>
	<%--					alert(data.msg);--%>
	<%--					search();--%>
	<%--				}--%>
	<%--	})--%>
	<%--}--%>
</script>
</head>
<body>
	<input type="button" value="新增" onclick="toAdd()"/><br/>
	<form id="fm">
		<input type = "hidden" name = "pageNo" value = "1" id = "pageNo"/>
		性别：
			女<input type="radio" name = "userSex" value = "0"/>
			男<input type="radio" name = "userSex" value = "1"/><br/>
		爱好：
			羽毛球：<input type="checkbox" value="1" name="userHobby" class="hobby"/>
			乒乓球：<input type="checkbox" value="2" name="userHobby" class="hobby"/>
			钢丝球：<input type="checkbox" value="3" name="userHobby" class="hobby"/>
			玻璃球：<input type="checkbox" value="23" name="userHobby" class="hobby"/><br/>
<%--		年龄：--%>
<%--			<input type = "text" name="userAge" />----<input type="text" name="userAge"/>--%>
		手机号：
			<input type="text" name="userPhone"/>
		<input type="button" value="查询" onclick="loadUser()"/>
		<input type="button" value="批量删除" onclick="deleteAll()"/>
		<input type="button" value="批量新增" onclick="toAdds()"/>
	</form>

	<table>
			<tr>
				<th>选择</th>
				<th>姓名</th>
				<th>密码</th>
				<th>年龄</th>
				<th>性别</th>
				<th>爱好</th>
				<th>手机号</th>
			</tr>
			<tbody id = "tbd">

			</tbody>
	</table>
	<div id="pageInfo">

	</div>
</body>
</html>