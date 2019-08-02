<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>首页</title>
<style type="text/css">
/*取消文本的下划线*/
a {
	text-decoration: none; /*超链接文办的下划线去掉*/
}

/*用列标的形式表示商品电饭煲*/
ul {
	list-style: none; /*去掉列表前的标识符*/
	float: right;
	margin-right: 30px;
}

/*设置整个网页的边框*/
#page {
	border: 1px solid black;
}

/*设置logo*/
#logo {
	height: 150px;
	/* overflow: hidden;  清除浮动   只要超出这个高度就会隐藏掉 */
	border: 1px solid black;
	margin: 1px;
}

/*设置菜单的背景高宽*/
#menu {
	background-color: #ffff66;
	height: 35px;
	padding-top: 0px;
	padding-left: 0px;
	padding-bottom: 15px;
	border: 1px solid black;
	margin: 1px;
	text-align: center;
	vertical-align: middle;
}

#menu p {
	font-size: 20px;
	vertical-align: middle;
	width: 100%;
}

/*两个段落标签、正品保障和轮播图的边框设置*/
#label {
	border: 1px solid black;
	margin: 1px;
	background: #ffff99;
}

/*表示最新商品和最热商品右半部分的整体*/
.info {
	position: absolute; /* 绝对定位*/
	top: 100px;
}

/*表示整个最新商品和最热商品的框架*/
.content {
	background: #ffffcc;
	width: 100%;
	height: 420px;
	position: relative; /*相对定位*/
	margin: 1px;
}

.biaodan {
	padding-left: 50px;
	padding-top: 50px;
}

.lianjie {
	float: right;
	padding-right: 100px;
}

.biao{
  	text-align: center;
}
.tablebox {
	border: solid 1px #ddd;
	text-align: center;
}

.tablebox td {
	text-align: center;
	border: solid 1px #ddd;
	padding: 5px;
}
.age{

	height: 50px;
}

</style>
</head>
<body>
	<table>


			<!--菜单部分-->
			<div id="menu">
				<p>
					<b>全国二手车首页</b>
				</p>
				<!--  <a href="#"><font color="black" size="4" >首页</font></a> -->
			</div>

			<!--存放logo部分-->
			<div id="logo">
				<img alt="" src="${ctx}/img/top.jpg" width="100%" height="150px">
			</div>
        <div class="age">
                   
     	       类型：
     	    <a class="select" name="b_link" para="custom" cl="" href="search.do">不限</a>
     	    <a class="select" name="b_link" para="custom" cl="" href="search.do?car=benchicar">奔驰</a>
     	    <a class="select" name="b_link" para="custom" cl="" href="search.do?car=dazhongcar">大众</a>
     	    <a class="select" name="b_link" para="custom" cl="" href="search.do?car=baomacar">宝马</a>
     	    <a class="select" name="b_link" para="custom" cl="" href="search.do?car=qitacar">其他</a>
     			</br>
     			价格：
     		<a name="b_link" para="custom" cl="" href="search.do?car=benchicar&&low=0&&high=99">不限</a>
     		<a name="b_link" para="custom" cl="" href="search.do?car=benchicar&&low=0&&high=10">10万元以内</a>
     		<a name="b_link" para="custom" cl="" href="search.do?car=benchicar&&low=10&&high=20">10-20万元</a>
     		<a name="b_link" para="custom" cl="" href="search.do?car=benchicar&&low=20&&high=99">20万元以上</a>
     			
     			
			<a href="citycount.do" class="lianjie">全国二手车在售量市场调研</a>
     	
     	
		
		</div>
          
	<div style="width: 100%; margin: 0 auto;" class="biao">
		<table class="tablebox" width="100%" border="0" cellpadding="0"
			cellspacing="0">
			<thead  class="header">
				<tr>
					<td>品牌</td>
					<td>信息</td>
					<td>里程</td>
					<td>排量</td>
					<td>变速箱</td>
					<td>价格</td>
					<td>年限</td>			
				</tr>
			</thead>

	<tbody id="table2">
	
		<c:forEach items="${benchi}" var="o" varStatus="status">
				 <tr>
					<td>${o.carname}</td>
					<td>${o.carinfo}</td>
					<td>${o.carlc}</td>
					<td>${o.carpailiang}</td>
					<td>${o.carbsx}</td>
					<td>${o.price}</td>
					<td>${o.caryear}</td>
				</tr>
		</c:forEach>
	
	</tbody>
	</table>

	<div style="height: 30px; margin: 20px 0 0 0;" class="biao">
		<span id="spanFirst">第一页</span> <span id="spanPre">上一页</span> <span
			id="spanNext">下一页</span> <span id="spanLast">最后一页</span> 第<span
			id="spanPageNum"></span>页/共 <span id="spanTotalPage"></span>页
	</div>
	</div>
<script type="text/javascript">
var theTable = document.getElementById("table2");
var totalPage = document.getElementById("spanTotalPage");
var pageNum = document.getElementById("spanPageNum");
var spanPre = document.getElementById("spanPre");
var spanNext = document.getElementById("spanNext");
var spanFirst = document.getElementById("spanFirst");
var spanLast = document.getElementById("spanLast");
var numberRowsInTable = theTable.rows.length;
var pageSize = 8;
var page = 1;
//下一页
function next() {
    hideTable();
    currentRow = pageSize * page;
    maxRow = currentRow + pageSize;
    if ( maxRow > numberRowsInTable )
    maxRow = numberRowsInTable;
    for ( var i = currentRow; i< maxRow; i++ ) {
        theTable.rows[i].style.display = '';
    }
        page++;
    if ( maxRow == numberRowsInTable ){
        nextText();
        lastText();
    }
    showPage();
    preLink();
    firstLink();
}

//上一页
function pre() {
    hideTable();
    page--;
    currentRow = pageSize * page;
    maxRow = currentRow - pageSize;
    if ( currentRow > numberRowsInTable )
    currentRow = numberRowsInTable;
    for ( var i = maxRow; i< currentRow; i++ ) {
        theTable.rows[i].style.display = '';
    }
    if ( maxRow == 0 ) {
        preText();
        firstText();
    }
    showPage();
    nextLink();
    lastLink();
}
//第一页
function first() {
    hideTable();
    page = 1;
    for ( var i = 0; i<pageSize; i++ ) {
        theTable.rows[i].style.display = '';
    }
    showPage();

    preText();
    nextLink();
    lastLink();
}

//最后一页
function last() {
    hideTable();
    page = pageCount();
    currentRow = pageSize * (page - 1);
    for ( var i = currentRow; i<numberRowsInTable; i++ ) {
        theTable.rows[i].style.display = '';
    }
    showPage();
    
    preLink();
    nextText();
    firstLink();
}

function hideTable() {
    for ( var i = 0; i<numberRowsInTable; i++ ) {
    theTable.rows[i].style.display = 'none';
    }
}

function showPage() {
    pageNum.innerHTML = page;
}

//总共页数
function pageCount() {
    var count = 0;
    if ( numberRowsInTable%pageSize != 0 ) count = 1; 
    return parseInt(numberRowsInTable/pageSize) + count;
}

//显示链接
function preLink() { spanPre.innerHTML = "<a href='javascript:pre();'>上一页</a>"; }
function preText() { spanPre.innerHTML = "上一页"; }

function nextLink() { spanNext.innerHTML = "<a href='javascript:next();'>下一页</a>"; }
function nextText() { spanNext.innerHTML = "下一页"; }

function firstLink() { spanFirst.innerHTML = "<a href='javascript:first();'>第一页</a>"; }
function firstText() { spanFirst.innerHTML = "第一页"; }

function lastLink() { spanLast.innerHTML = "<a href='javascript:last();'>最后一页</a>"; }
function lastText() { spanLast.innerHTML = "最后一页"; }

//隐藏表格
function hide() {
    for ( var i = pageSize; i<numberRowsInTable; i++ ) {
        theTable.rows[i].style.display = 'none';
    }

    totalPage.innerHTML = pageCount();
    pageNum.innerHTML = '1';
    
    nextLink();
    lastLink();
}

hide();
</script>
			
		<!--两个段落标签-->
		<div align="center" id="label">
			<p>
				<a href="#">请</a> <a href="#">待</a> <a href="#">后</a> <a
					href="#">续</a> <a href="#">...</a>
			</p>
			<p>
				版权<sup>&reg;</sup>河北工业大学<sup>&copy;</sup>
			</p>
		</div>
	</table>
</body>
</html>