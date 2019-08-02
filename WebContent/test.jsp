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

        /*设置整个网页的边框*/
        #page{
            border: 1px solid black;
        }

        /*设置logo*/
        #logo{
            height: 55px;
            overflow: hidden;  /*清除浮动   只要超出这个高度就会隐藏掉 */
            border: 1px solid black;
            margin: 1px;
        }

        /*设置logo里的超链接*/
        .kop{
            float:right;
            width: 80px;
            height: 50px;   /*块元素的高*/
            text-align: center;
            line-height:50px;   /*行高  字体上下居中*/
            position: relative;  /*相对定位*/
            top: -90px;
        }

        /*设置logo中的两个图片*/
        .picture1{
            padding-left: 50px;
        }
        .pictrue2{
            display: block;
            margin: 0 auto;
            position: relative;
            top: -55px;
        }

        /*设置菜单的背景高宽*/
        #menu{
            background-color: white;
            height: 35px;
            padding-top: 8px;
            padding-left: 10px;
            border: 1px solid black;
            margin: 1px;
        }

        /*两个段落标签、正品保障和轮播图的边框设置*/
        #label,
        #goods,
        #play,
        #advisement{
            border: 1px solid black;
            margin: 1px;
        }

        /*表示最新商品和最热商品右半部分的整体*/
        .info{
           position:absolute; /* 绝对定位*/
            top:100px;
            
        }
        .age{
        	
        }

        /*表示整个最新商品和最热商品的框架*/
        .content{
            width:100%;
            height:500px;
            position:relative;    /*相对定位*/
            margin: 1px;  
        }

      
        /*用列标的形式表示商品电饭煲*/
        ul{
            list-style: none;  /*去掉列表前的标识符*/
            float: right;
            margin-right: 30px;
        }
    </style>
</head>
<body>
<table>
    <div id="page">
        <!--存放logo部分-->
        <div id="logo">
            			全国二手车销量
        </div>

        <!--菜单部分-->
        <div id="menu">
            <a href="#"><font color="black" size="4">首页</font></a>
            <a href="#"><font color="black" size="4">手机数码</font></a>
            <a href="#"><font color="black" size="4">家用电器</font></a>
            <a href="#"><font color="black" size="4">生活用品</font></a>
            <a href="#"><font color="black" size="4">电脑办公</font></a>
        </div>

     <!--  轮播图
        <div id="play">
            <img src="img/1.jpg" width="500px" height="200px"/>
        </div> 
        -->
       
        <!--热门商品-->
        <div class="content">
        
        <div class="age">
                   
				<form action ="carByAge.do" method="get"> 
					请选择：
					<select name ="age" style="width:150px;" >
						<option  >00后</option>
						<option  >90后</option>
						<option  >80后</option>
					</select>
					<input type="submit" value="查询"/> 
				</form>
					<p>${ages }</p>
		</div>
			<div class="info">
	           	<c:forEach items="${carlist}" var="o" varStatus="status">
					  	<ul>
	                        <li><img src="${ctx}/img/${o.img}"  width="200px" height="200px"/></li>
	                        <li><a href="#">${o.carname}</a></li>
	                        <li>${o.price }</li>
	                        <%-- <li>${o.carinfo }</li> --%>
	                    </ul>
				</c:forEach>
			</div>
<!--             <div class="info">
                    <ul>
                        <li><img src="img/small08.jpg"  width="200px" height="200px"/></li>
                        <li><a href="#">奔驰</a></li>
                        <li>200¥</li>
                    </ul>
                    <ul>
                        <li><img src="img/small08.jpg"  width="200px" height="200px"/></li>
                        <li><a href="#">宝马</a></li>
                        <li>200¥</li>
                    </ul>
                    <ul>
                        <li><img src="img/small08.jpg"  width="200px" height="200px"/></li>
                        <li><a href="#">本田</a></li>
                        <li>200¥</li>
                    </ul>
                    <ul>
                        <li><img src="img/small08.jpg"  width="200px" height="200px"/></li>
                        <li><a href="#">吉利</a></li>
                        <li>200¥</li>
                    </ul>
                    <ul>
                        <li><img src="img/small08.jpg"  width="200px" height="200px"/></li>
                        <li><a href="#">吉利</a></li>
                        <li>200¥</li>
                    </ul>
            </div> -->
        </div>

        <!--两个段落标签-->
        <div align="center" id="label">
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