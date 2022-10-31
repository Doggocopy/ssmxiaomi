<%@ page language="java"
	import="java.util.*"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>全部商品</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript">
	function submitform(pages) {
		document.searchForm.nowpage.value = pages;
		document.searchForm.submit();
	}
</script>

<style type="text/css">
/* 顶部菜单导航栏 */
a { text-decoration: none; color: black;}
a:hover { color: #FF7E00;}
#ad {height: 119px;width: 1890px;}
#topbar {background-color: #3B3B3B;width: 1890px;height: 40px;}
.sep {color: #3B3B3B}
#topbar a {text-decoration: none;color: #BDBDBD;font-family: 黑体;font-size: 14;}
#topbar a:hover {color: white;}
#topbar_left {width: 700px;margin-left: 350px;padding-top: 10px;float: left;}
#topbar_right {width: 400px;margin-left: 1300px;padding-top: 10px;}
/* 顶部菜单 */
#menu {height: 95px;background-color: white;}
#logo {margin-left: 350px;padding-top: 20px;float: left;}
#menu_nav {margin-left: 500px;padding-top: 40px;width: 1100px;}
#menu_nav a {text-decoration: none;color: black;font-family: 黑体;font-size: 16;}
#menu_nav a:hover {color: #FF7E00;}
#searchbtn {background-color: #FF7E00;width: 60px;height: 25px;border: 1px solid #EDEDED;
			cursor: pointer;font-size: 16px;font-family: 黑体;}
/* 全部商品列表 */
#prod_search {text-align: center;}
#allproduct {background-color: white;width: 1226px;margin-left: 350px;height: 1200px;}
#product {width: 1000px;height: 800;margin: 0px auto;}
#product hr {border: 1px solid #EDEDED;}
.productDiv {width: 500px;height: 400px;float: left;}
.productDiv a {font-size: 18px;}
.productDiv a:hover {color: #FF7E00;}
.prodimg {width: 300px;float: left;}
.prodcontent {width: 170px;margin-left: 300px;text-align: center;}
.addcar {display: block;background-color: #FF7E00;width: 160px;height: 40px;line-height: 40px;}
.addcar a:hover {color: white;}
#pages {margin: 0px auto;width: 260px;height: 100px;text-align: center;font-size: 20px;}
.pages {float: left;display: block;background-color: #FF7E00;width: 40px;height: 30px;line-height: 30px;margin-left: 20px;}
#pages a {color: black;}
#pages a:hover {color: white;}
/* 尾部 */
#foot {width: 1890px;}
</style>
</head>

<body style=" background-color: #EDEDED; font-family: 黑体; ">
	<!-- 顶部菜单导航栏 -->
	<div id="header">
		<div id="topbar">
			<div id="topbar_left">
				<a href="${pageContext.request.contextPath}/prod/show5.action">小米商城</a><span class="sep">|</span>
				<a href="" target="_blank">MIUI</a><span class="sep">|</span>
				<a href="" target="_blank">米聊</a><span class="sep">|</span>
				<a href="" target="_blank">游戏</a><span class="sep">|</span>
				<a href="" target="_blank">多看阅读</a><span class="sep">|</span>
				<a href="" target="_blank">云服务</a><span class="sep">|</span>
				<a href="" target="_blank">金融</a><span class="sep">|</span>
				<a href="" target="_blank">米币</a><span class="sep">|</span>
				<a href="" target="_blank">手机版</a><span class="sep">|</span>
				<a href="" target="_blank">问题反馈</a>
			</div>
			<div id="topbar_right">
				<c:if test="${empty user }">
					<a href="login.jsp">登陆</a>
					<span class="sep">|</span>
				</c:if>
				<c:if test="${not empty user }">
					<a href="">${user.uname}</a>
					<span class="sep">|</span>
					<a href="${pageContext.request.contextPath}/fore/logout.action">注销</a>
					<span class="sep">|</span>
					<a href="${pageContext.request.contextPath}/fore/showOrder.action" target="_blank">我的订单</a>
					<span class="sep">|</span>
					<a href="${pageContext.request.contextPath}/fore/showCarShop.action" target="_blank">购物车</a>
					<span class="sep">|</span>
				</c:if>
				<a href="register.jsp" target="_blank">注册</a><span class="sep">|</span>
			</div>
		</div>
		<!-- 顶部菜单 -->
		<div id="menu">
			<div id="logo">
				<a href=""><img alt="" src="image/milogo.jpg" onmouseover="this.src='image/milogo2.jpg'" onmouseout="this.src='image/milogo.jpg'"></a>
			</div>
			<div id="menu_nav">
				<a href="mainServlet">全部商品</a><span class="sep">&nbsp;</span>
				<a href="mainServlet?typeId=1">小米手机</a><span class="sep">&nbsp;</span>
				<a href="mainServlet?typeId=1">红米</a><span class="sep">&nbsp;</span>
				<a href="mainServlet?typeId=2">平板电脑</a><span class="sep">&nbsp;</span>
				<a href="mainServlet?typeId=3">电视</a><span class="sep">&nbsp;</span>
				<a href="" target="_blank">盒子影音</a><span class="sep">&nbsp;</span>
				<a href="" target="_blank">路由器</a><span class="sep">&nbsp;</span>
				<a href="" target="_blank">智能硬件</a><span class="sep">&nbsp;</span>
				<a href="" target="_blank">服务</a><span class="sep">&nbsp;</span>
				<a href="" target="_blank">社区</a><span class="sep">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
				<input type="text" id="search">
				<a href="" target="_blank">搜索</a>
			</div>
		</div>
	</div>
	
	<br>
	
	<!-- 全部商品 -->
	<div id="allproduct">
		<br>
		<h2>&nbsp;全部商品</h2>
		<div id="prod_search">
			<form action="mainServlet" name="searchForm" method="post">
				<input type="hidden" name="nowpage" value="1"> 商品类型：
				<select name="typeId">
					<option value="-1">选择类型</option>
					<c:forEach var="type" items="${typeList }">
						<option value="${type.typeid }"
						<c:if test="${product.typeid==type.typeid }">selected="selected"</c:if>>${type.typename }
						</option>
					</c:forEach>
				</select>
				商品名称：
				<input type="text" name="pname" value="${product.pname }" style="border: 1px solid #EDEDED;"
					onmouseover="this.style.borderColor='#FF7E00';"
					onmouseout="this.style.borderColor='#EDEDED';">
				<br><br><br>
				商品规格：
				<input type="text" name="pcontent" value="${product.pcontent }" style="border: 1px solid #EDEDED;"
					onmouseover="this.style.borderColor='#FF7E00';"
					onmouseout="this.style.borderColor='#EDEDED';">
				商品价格：
				<input type="text" name="xjiage" value="${product.minprice }" style="width: 50px;border: 1px solid #EDEDED;"
					onmouseover="this.style.borderColor='#FF7E00';"
					onmouseout="this.style.borderColor='#EDEDED';">-<input
					style="width: 50px;border: 1px solid #EDEDED;" type="text"
					name="djiage" value="${product.maxprice }"
					onmouseover="this.style.borderColor='#FF7E00';"
					onmouseout="this.style.borderColor='#EDEDED';">
				<input type="submit" value="搜索" id="searchbtn"
					onmouseover="this.style.color='white';"
					onmouseout="this.style.color='black';" />
			</form>
			<hr>
			<a href="productServlet?type=priceasc">价格↑</a>
			<a href="productServlet?type=numberasc">销量↑</a>
		</div>
		<hr>
		<br>
		<!-- 商品列表 -->
		<div id="product">
			<c:forEach var="product" items="${prodList }" varStatus="i">
				<div class="productDiv">
					<div class="prodimg">
						<a href="productServlet?type=dodetail&pid=${product.pid }">
						<img alt="" src="image/${product.pimage }" height="300px;">
						</a>
					</div>
					<div class="prodcontent">
						<br><br><br>
						<a href="productServlet?type=dodetail&pid=${product.pid }">
						<span style="font-size: 20px;">${product.pname }</span>
						</a>
						<br><br><br>
						<a href="productServlet?type=dodetail&pid=${product.pid }">
							${product.pcontent }
						</a>
						<br><br><br>
						<span style="color: #FF7E00; font-size: 26;">${product.pprice }元</span>
						<br><br>
						<a class="addcar" href="productServlet?type=addcarshop&pid=${product.pid }" target="_blank" 
							onmouseover="this.style.color='white';" onmouseout="this.style.color='black';">
						加入购物车
						</a>
					</div>
				</div>
			</c:forEach>

		</div>

		<!-- 页数显示 -->
		<hr>
		<div id="pages">
			<br>
			<c:forEach var="i" begin="1" end="${pages }">
				<a class="pages" href="javascript:submitform(${i })">${i }</a>
			</c:forEach>
		</div>

	</div>


	<br><br>

	<!-- 尾部 -->
	<div id="foot">
		<img alt="" src="image/foot.jpg" width="1890px;">
	</div>
</body>
</html>
