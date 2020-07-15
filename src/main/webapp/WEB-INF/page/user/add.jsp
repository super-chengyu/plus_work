<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src = "<%=request.getContextPath()%>/res/js/jquery-1.12.4.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	function add() {
		$.post("<%=request.getContextPath()%>/user/add",
				$("#fm").serialize(),
				function(data){
				if (data.code == 200){
					alert(data.msg);
					window.location.href="<%=request.getContextPath()%>/user/toShow";
				} else {
					alert("操作失败");
					return;
				}
		})
	}
</script>
</head>
<body>
	<form id="fm">
		姓名：<input type="text" name="userName"/><br/>
		密码：<input type="text" name="userPwd"/><br/>
		年龄：<input type="text" name="userAge"/><br/>
		手机号：<input type="text" name="userPhone"/><br/>
		爱好：
			羽毛球：<input type="checkbox" name="userHobby" class="hobby" value="1"/>
			乒乓球：<input type="checkbox" name="userHobby" class="hobby" value="2"/>
			钢丝球：<input type="checkbox" name="userHobby" class="hobby" value="3"/>
			玻璃球：<input type="checkbox" value="23" name="userHobby" class="hobby"/><br/>
		<input type="button" value="新增" onclick="add()"/>
	</form>
</body>
</html>