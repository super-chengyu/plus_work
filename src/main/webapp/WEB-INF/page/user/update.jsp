<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src = "<%=request.getContextPath()%>/res/js/jquery-1.12.4.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	function update() {
		$.post("<%=request.getContextPath()%>/user/update",
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
		<input type="hidden" name="id" value="${user.id}"/>
		姓名：<input type="text" name="userName" value="${user.userName}"/>
		密码：<input type="text" name="userPwd" value="${user.userPwd}"/>
		年龄：<input type="text" name="userAge" value="${user.userAge}"/>
		手机号：<input type="text" name="userPhone" value="${user.userPhone}"/>
		<input type="button" value="修改" onclick="update()"/>
	</form>
</body>
</html>