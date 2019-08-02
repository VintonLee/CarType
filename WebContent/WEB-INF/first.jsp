<%@ page  contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <c:set var="ctx" value="${pageContext.request.contextPath}" />
 
 <!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>首页</title>
    <style type="text/css">
        /*取消文本的下划线*/
        a{
            text-decoration: none;  /*超链接文办的下划线去掉*/
        }
		
        ul{
            list-style: none;  /*去掉列表前的标识符*/
            float: right;
            margin-right: 30px;
        }
        
        /*设置整个网页的边框*/
        #page{
            border: 1px solid black;
        }

        /*设置logo*/
        #logo{
            height: 150px;
           /* overflow: hidden;  清除浮动   只要超出这个高度就会隐藏掉 */
            border: 1px solid black;
            margin: 1px;
        }


        /*设置菜单的背景高宽*/
        #menu{
            background-color: #ffff66;
            height: 35px;
            padding-top: 0px;
            padding-left: 0px;
            padding-bottom:15px;
            border: 1px solid black;
            margin: 1px;
 			text-align:center;
 		    vertical-align:middle;
        }
        
        #menu p{
        	
        	font-size:20px;
 		    vertical-align:middle;
			width: 100%;        	
        }

        /*两个段落标签、正品保障和轮播图的边框设置*/
        #label{
            border: 1px solid black;
            margin: 1px;
            background:#ffff99;
        }

        /*表示最新商品和最热商品右半部分的整体*/
        .info{
        	float:left;
           position:fixed;  /* 绝对定位*/
            
        }
       

        /*表示整个最新商品和最热商品的框架*/
        .content{
        	background:#ffffcc;
            width:100%;
            height:420px;
            position:fixed;   /* 相对定位*/
            margin: 1px;  
        }
		
		
      	
      	.biaodan{
      		padding-left:50px;
      		padding-top: 50px;
      	}
      	.lianjie{
      		float: right;
      		padding-right: 100px;
      	}
       
        
    </style>
</head>
<body>
<table>
    <div id="page">
        

        <!--菜单部分-->
        <div id="menu">
            	<p><b>全国二手车首页</b></p>
        </div>
		
		<!--存放logo部分-->
        <div id="logo">
            <img alt="" src="${ctx}/img/top.jpg" width="100%" height="150px">
        </div>
       
        <!--热门商品-->
        <div class="content">
        
        <div class="age">
                   
     	<form action ="carByAge.do" method="post" class="biaodan" >
     	          请选择年龄:
     			<select name ="age" style="width:150px;" >
     					<option  >---请选择---</option>
						<option  >00</option>
						<option  >90</option>
						<option  >80</option>
					</select>
				<input type="submit" value="查询"/> 
				正在查看${ages}后年龄阶段最喜欢的车辆信息
		<a href="citycount.do" class="lianjie">全国二手车在售量市场调研</a>
     	
     	</form>
     	
		
		</div>

            <div class="info">
	           	<c:forEach items="${carlist}" var="o" varStatus="status">
					  	<ul>
	                        <li><img src="${ctx}/img/${o.img}"  width="200px" height="200px"/></li>
	                        <li><a href="#">${o.carname}</a></li>
	                        <li>${o.price }</li>
	                        <li>${o.carinfo }</li>
	                    </ul>
				</c:forEach>
			</div>

     
        </div>
	</div>
        <!--两个段落标签-->
        <div align="center" id="label" >
            <p>
                <a href="#">关于我们</a>
                <a href="#">联系我们</a>
                <a href="#">招贤纳士</a>
                <a href="#">法律声明</a>
                <a href="#">友情链接</a>
            </p>
            <p>
                Copyright<sup>&reg;</sup>河北工业大学<sup>&copy;</sup>
            </p>
        </div>
</table>
</body>
</html>