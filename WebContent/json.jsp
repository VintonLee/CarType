<%@ page  contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>

<html>
<head>
</head>
	<script>
		    //定义一个数组
		var partList = <%=request.getAttribute("cityjson")%>
</script>
	

<body style="font-size: 30px;">
	</br>
		<%=request.getAttribute("cityjson")%>
</body>
</html>