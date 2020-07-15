<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src = "<%=request.getContextPath()%>/res/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	
	var t = ""; 
	function inserts(){
		t++;
		var html = "<div><hr/><input type = 'button' value = '-' onclick = 'del(this)'/>";
		html += '名字：<input type = "text" name = "userList['+t+'].userName"/><br/>'
		html += '密码：<input type = "text" name = "userList['+t+'].userPwd"/><br/>'
		html += '年龄：<input type = "text" name = "userList['+t+'].userAge"/><br/>'
		html += '性别'
		html += '女：<input type = "radio" name = "userList['+t+'].userSex" value="0"/>'
		html += '男：<input type = "radio" name = "userList['+t+'].userSex" value="1"/><br/>'
		html += '手机号：<input type = "text" name = "userList['+t+'].userPhone"/><br/>'
		html += '爱好'
		html += '羽毛球：<input type="checkbox" name="userList['+t+'].userHobby" class="hobby" value="1"/><br/>'
		html += '乒乓球：<input type="checkbox" name="userList['+t+'].userHobby" class="hobby" value="2"/><br/>'
		html += '钢丝球：<input type="checkbox" name="userList['+t+'].userHobby" class="hobby" value="3"/><br/>'
		html += '玻璃球：<input type="checkbox" name="userList['+t+'].userHobby" class="hobby" value="23"/><br/>'
		html += '<input type = "hidden" name = "userList['+t+'].isDel" value="0"/><br/>'
		html += '</div></div>'
		$("#divAdds").append(html);
	}

	function del(obj){
		$(obj).parent().remove();
	}
	
	function adds(){
		$.post("<%=request.getContextPath()%>/user/adds",
				$("#fm").serialize(),
				function(data){
					if (data.code == 200){
						window.location.href = "<%=request.getContextPath()%>/user/toShow"
					}
		})
	}
</script>
</head>
<body>
	<input type = "button" value = "+" onclick = "inserts()"/>
	<form id = "fm">
		名字：<input type = "text" name = "userList[0].userName"/><br/>
		密码：<input type = "text" name = "userList[0].userPwd"/><br/>
		年龄：<input type = "text" name = "userList[0].userAge"/><br/>
		性别：
			女<input type = "radio" name="userList[0].userSex" value="0"/>
			男<input type = "radio" name="userList[0].userSex" value="1"/><br/>
		手机号：<input type="text" name="userList[0].userPhone"/><br/>
		爱好：
			羽毛球：<input type="checkbox" name="userList[0].userHobby" class="hobby" value="1"/>
			乒乓球：<input type="checkbox" name="userList[0].userHobby" class="hobby" value="2"/>
			钢丝球：<input type="checkbox" name="userList[0].userHobby" class="hobby" value="3"/>
			玻璃球：<input type="checkbox" value="23" name="userList[0].userHobby" class="hobby"/><br/>
		<input type = "hidden" name = "userList[0].isDel" value="0"/><br/>
		<div id = "divAdds">
		
		</div>
		<input type = "button" value = "增加" onclick = "adds()"/>		
	</form>
</body>
</html>