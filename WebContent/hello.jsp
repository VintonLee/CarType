<%@ page  contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<script language="javascript" src="${ctx}/js/jquery-1.11.1.js"></script>  

<html>
<head>
</head>

<script type="text/javascript">
		  
/* 		 var types = new Array();
		 var counts = new Array();
			
		    //console.info("info");
		    <c:forEach items="${carlist}" var="item" varStatus="status" >
		        types.push("${item.type}");
		        counts.push("${item.count}");
		    </c:forEach> 
 		    for(var i=0;i<counts.length;i++){
			    document.write(counts[i]+"<br>");
			}  */
		    

		    function getCity(){
				alert(111);
			    var params =  document.getElementById('s1').value;
			    alert(params);
			    
	            $.ajax({
	                url:"/hello.do",
	                type:'post',
	                data:'city='+params,
	                dataType:'html',
	                success:function(data,status){
	                    if(status == "success"){
	                        var objs = jQuery.parseJSON(data);
	                        var str = "";
	                        for(var i=0;i<objs.length;i++){
	                            str = str + objs[i].activityName+" ";
	                        }
	                        $("#content").html(str);
	                    }
	                },
	                error:function(xhr,textStatus,errorThrown){
	                }
	            });
			}
				
		    
		    
</script>

<body style="font-size: 30px;">
	
<%-- 		<p style="width:300px;">${city}</p> --%>
			<!-- 级联菜单 -->
		<select id="s1" style="width:150px;" onchange="getCity();" >
			<option  >北京</option>
			<option  >上海</option>
			<option  >天津</option>
		</select>
		
</body>
</html>