<%@ page  contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
</head>
	<script>
		    //定义一个数组
</script>
	

<body style="font-size: 30px;">

	<form action ="carByAge.do" method="post"> 
		<select name ="age" style="width:150px;" >
			<option  >00后</option>
			<option  >90后</option>
			<option  >80后</option>
			<input type="submit" value="查询"/>
		</select>
	</form>
	<br>
	<c:forEach items="${carlist}" var="o" varStatus="status">
								<tr>
									<td>${o.carname}</td>
									<td>${o.count}</td>
									<td>${o.age}</td>
								</tr>
								<br>
			</c:forEach>
		
</body>
</html>