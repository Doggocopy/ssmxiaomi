<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

<title>添加评论</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script language="javascript"> 
	function sumbit_tips(){
		alert("发表成功");
	}
</script>
<style type="text/css">
/* 顶部菜单导航栏 */
hr {border: 1px solid #EDEDED;}
a {text-decoration: none;color: black;}
a:hover {color: #FF7E00;}
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
/* 商品评论 */
#product {background-color: white;width: 1226px;height: 500px;margin-left: 350px;}
#left {width: 610px;height: 400px;float: left;}
#right {width: 610px;height: 400px;margin-left: 616px;}
#commbtn{background-color: #FF7E00;width: 100px;height: 50;line-height: 50px;font-family:黑体;
			font-size: 16px;border: 0px solid #EDEDED;cursor: pointer;}
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
				<a href=""><img alt="" src="image/milogo.jpg"></a>
			</div>
			<div id="menu_nav">
				<a href="mainServlet">全部商品</a><span class="sep">&nbsp;</span>
				<a href="mainServlet?typeId=1" >小米手机</a><span class="sep">&nbsp;</span>
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
	
	<!-- 添加评论 -->
	<div id="product">
		<br>
		<h2>&nbsp;添加评论</h2>
		<br>
		<div id="left">
			<table width="600" border="0" style="text-align: center;">
				<tr>
					<td width="50" rowspan="6"><img alt="" src="image/${product.pimage }" height="300"></td>
				</tr>
				<tr>
					<td width="300">${product.pname }</td>
				</tr>
				<tr>
					<td><hr></td>
				</tr>
				<tr>
					<td width="300">${product.pcontent }</td>
				</tr>
				<tr>
					<td><hr></td>
				</tr>
				<tr>
					<td width="300">${product.pprice }元</td>
				</tr>
			</table>
		</div>

		<hr style="border:1px solid #FF7E00; height: 350px; width: 0px; margin-left: 2px;float: left;">

		<div id="right">
			<form action="commentServlet?type=addcomment" enctype="multipart/form-data" method="post" onsubmit="return sumbit_tips()">
				<input type="hidden" name="pid" value="${product.pid }">
				<input type="hidden" name="uid" value="${user.uid }">
				<table width="600" border="0" style="text-align: center;">
					<tr>
						<td height="65">评分： 
						<select name="pscore">
							<option value="5" selected="selected">5分</option>
							<option value="4">4分</option>
							<option value="3">3分</option>
							<option value="2">2分</option>
							<option value="1">1分</option>
						</select>
						</td>
					</tr>
					<tr>
						<td><hr></td>
					</tr>
					<tr>
						<td height="125">评价：
						<input type="text" name="pcontent" style="height: 50px; width: 300px;">
						</td>
					</tr>
					<tr>
						<td><hr></td>
					</tr>
					<tr>
						<td>晒图：<input type="file" name="pimage" /></td>
					</tr>
					<tr>
						<td height="30">
					</tr>
					<tr>
						<td>
						<input id="commbtn" type="submit" value="发表评论" 
								onmouseover="this.style.color='white';" onmouseout="this.style.color='black';"/>
						</td>
					</tr>
				</table>
			</form>
		</div>

	</div>



</body>
</html>
