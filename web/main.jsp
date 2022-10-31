<%@ page language="java" errorPage="/err.jsp"
	import="java.util.*" 	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	// 测试：http://localhost:8088/Xiaomi
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>小米商城首页</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	<script src="<c:url value="/webjars/jquery/3.6.0/jquery.js"/>"></script>
<script type="text/javascript">
	function submitform(pages) {
		document.searchForm.nowpage.value = pages;
		document.searchForm.submit();
	}
	
	//显示菜单的子菜单
	function showChildMenu(obj, divname) {
		var divobj = document.getElementById(divname);
		divobj.style.display = "block";
	}
	//隐藏菜单的子菜单
	function hideChildMenu(obj, divname) {
		var divobj = document.getElementById(divname);
		divobj.style.display = "none";
	}
	
	//轮播图
	var index = 1;
	function changeImg(op) {
		index++;
		//是否是鼠标事件
		if (!isNaN(op)) {
			index = op;
			clearInterval(temp_inter);
			temp_inter = "";
		}
		document.getElementById("lbtImg").src = "image/index_" + index + ".jpg";

		//设置标签的样式
		var li_objs = document.getElementById("lbtbqDiv").getElementsByTagName(
				"li");
		//把所有的标签背景设为默认
		for (var i = 0; i < li_objs.length; i++) {
			li_objs[i].style.backgroundColor = "";
		}
		//把当前图片的索引设一个背景
		li_objs[index - 1].style.backgroundColor = "#FF7E00";

		if (index == 7) {
			index = 0;
		}
	}
	var temp_inter = setInterval("changeImg()", 3000);
	function restart() {
		if (temp_inter == "") {
			temp_inter = setInterval("changeImg()", 3000);
		}
	}

	/*跑马灯效果*/
	function pmdxiaoguo() {
		document.getElementById("ad").scrollTop++;
		var nowtop = document.getElementById("ad").scrollTop;
		if (nowtop > document.getElementById("pmdDiv1").offsetHeight)
			document.getElementById("ad").scrollTop = 0;

		var delay = 10;
		if (nowtop % 120 == 0)
			delay = 3000;

		setTimeout("pmdxiaoguo()", delay);
	}
	window.onload = pmdxiaoguo;
</script>
<style type="text/css">
ul {padding: 0px;margin: 0px;}
li {float: left;width: 50px;border: solid 0px white;list-style: none;text-align: center;color: white;}
hr {border: 1px solid #EDEDED;}
/* 顶部菜单导航栏 */
#ad {overflow: hidden;height: 120px;width: 1890px;;}
#topbar {background-color: #3B3B3B;width: 1890px;height: 40px;}
.sep {color: #3B3B3B}
#topbar a {text-decoration: none;color: #BDBDBD;font-family: 黑体;font-size: 14;}
#topbar a:hover {color: white;}
#topbar_left {width: 700px;margin-left: 350px;padding-top: 10px;float: left;}
#topbar_right {width: 400px;margin-left: 1300px;padding-top: 10px;}
#menu {height: 95px;}
#logo {margin-left: 350px;padding-top: 20px;float: left;}
#menu_nav {margin-left: 100px;padding-top: 40px;width: 800px;float: left;}
#menu_nav a {text-decoration: none;color: black;font-family: 黑体;font-size: 16;}
#menu_nav a:hover {color: #FF7E00;}
.menu_child {z-index: 3;background-color: white;position: absolute;display: none;width: 1890px;height: 190px;margin-left: 0px;}
#search {margin-left: 1300px;width: 300px;padding-top: 30px;}
#searchinput {width: 200px;height: 40px;font-size: 16px;border: 1px solid #EDEDED;}
#searchbtn {background-color: white;width: 60px;height: 40px;border: 1px solid #EDEDED;cursor: pointer;font-size: 16px;font-family: 黑体;}
/* 海报轮播图 */
#body_top {height: 1100px;width: 1890px;}
#leftmenu {background-color: black;opacity: 0.7;z-index: 1;position: absolute;width: 235px;height: 460px;top: 263px;filter: alpha(opacity = 50)}
#leftmenu li {position: relative;width: 235px;height: 40px;text-align: left;color: white;}
#leftmenu a {text-decoration: none;color: white;display: block;width: 235px;height: 40px;}
#leftmenu a:hover {background-color: #FF7E00;}
.rightmenu {z-index: 3;background-color: white;position: absolute;display: none;top: 262px;left: 590px;}
#lbtDiv {width: 1226px;height: 480px;margin-left: 350px;}
#lbtbqDiv {position: absolute;z-index: 2;top: 700px;left: 795px;}
#xhb {width: 1226px;height: 170px;margin-left: 350px;}
/* 小米明星单品 */
#mxdp_text {margin-left: 350px;font-family: 黑体;}
#mxdp_img {margin-left: 350px;}
.mxdp_span {color: white;}
/* 尾部 */
#foot {width: 1890px;}
</style>
</head>

<body style="font-family: 黑体;">
	<div id="ad">
		<div id="pmdDiv1">
			<a href="productServlet?type=dodetail&pid=1"><img alt="" src="image/index_top1.jpg" width="1890px;" height="120px;"></a> 
			<a href="productServlet?type=dodetail&pid=2"><img alt="" src="image/index_top2.jpg" width="1890px;" height="120px;"></a>
			<a href="productServlet?type=dodetail&pid=3"><img alt="" src="image/index_top3.jpg" width="1890px;" height="120px;"></a>
			<a href="productServlet?type=dodetail&pid=1"><img alt="" src="image/index_top4.jpg" width="1890px;" height="120px;"></a>
		</div>
		<div id="pmdDiv2">
			<a href="productServlet?type=dodetail&pid=1"><img alt="" src="image/index_top1.jpg" width="1890px;" height="120px;"></a>
			<a href="productServlet?type=dodetail&pid=2"><img alt="" src="image/index_top2.jpg" width="1890px;" height="120px;"></a>
			<a href="productServlet?type=dodetail&pid=3"><img alt="" src="image/index_top3.jpg" width="1890px;" height="120px;"></a>
			<a href="productServlet?type=dodetail&pid=1"><img alt="" src="image/index_top4.jpg" width="1890px;" height="120px;"></a>
		</div>
	</div>
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
		<div id="menu">
			<div id="logo">
				<a href=""><img alt="" src="image/milogo.jpg"
					onmouseover="this.src='image/milogo2.jpg'"
					onmouseout="this.src='image/milogo.jpg'"></a>
			</div>
			<div id="menu_nav">
				<a href="mainServlet">全部商品</a><span class="sep">&nbsp;</span>
				<a href="mainServlet?typeId=1"
					onmouseover="showChildMenu( this, 'menu_xm')"
					onmouseout="hideChildMenu(this,'menu_xm')">小米手机</a><span class="sep">&nbsp;</span>
				<a href="mainServlet?typeId=1"
					onmouseover="showChildMenu( this, 'menu_hm')"
					onmouseout="hideChildMenu(this,'menu_hm')">红米</a><span class="sep">&nbsp;</span>
				<a href="mainServlet?typeId=2"
					onmouseover="showChildMenu( this, 'menu_dn')"
					onmouseout="hideChildMenu(this,'menu_dn')">平板电脑</a><span class="sep">&nbsp;</span>
				<a href="mainServlet?typeId=3"
					onmouseover="showChildMenu( this, 'menu_ds')"
					onmouseout="hideChildMenu(this,'menu_ds')">电视</a><span class="sep">&nbsp;</span>
				<a href="" target="_blank">盒子影音</a><span class="sep">&nbsp;</span> 
				<a href="" target="_blank">路由器</a><span class="sep">&nbsp;</span> 
				<a href="" target="_blank">智能硬件</a><span class="sep">&nbsp;</span> 
				<a href="" target="_blank">服务</a><span class="sep">&nbsp;</span> 
				<a href="" target="_blank">社区</a><span class="sep"></span>
			</div>
			<div id="search">
				<form action="mainServlet" method="post">
					<input type="hidden" name="nowpage" value="1">
					<input type="text" name="pname" id="searchinput" value="${product.pname }"
						onmouseover="this.style.borderColor='#FF7E00';"
						onmouseout="this.style.borderColor='#EDEDED';">
					<input type="submit" id="searchbtn" value="搜索"
						onmouseover="this.style.backgroundColor='#FF7E00';"
						onmouseout="this.style.backgroundColor='white';">
				</form>
			</div>
		</div>
		<!-- 子菜单 -->
		<div id="menu_xm" class="menu_child">
			<hr>
			<table border="0" style="width: 1200; margin-left: 370px; text-align: center; font-size: 14px;">
				<tr>
					<td width="200px"><img alt="" src="image/xmMIX2.jpg" height="100"></td>
					<td width="200px"><img alt="" src="image/xmNote3.jpg" height="100"></td>
					<td width="200px"><img alt="" src="image/xm6.jpg" height="100"></td>
					<td width="200px"><img alt="" src="image/xmMAX2.jpg" height="100"></td>
					<td width="200px"><img alt="" src="image/xm5X.jpg" height="100"></td>
					<td width="200px"><img alt="" src="image/xmNote2.jpg" height="100"></td>
				</tr>
				<tr>
					<td>小米MIX2</td>
					<td>小米Note3</td>
					<td>小米6</td>
					<td>小米MAX2</td>
					<td>小米5X</td>
					<td>小米Note2</td>
				</tr>
				<tr style="color: #FF7E00;">
					<td>3299元</td>
					<td>2499元</td>
					<td>2499元</td>
					<td>1699元</td>
					<td>1499元</td>
					<td>2099元</td>
				</tr>
			</table>
		</div>

		<div id="menu_hm" class="menu_child">
			<hr>
			<table border="0" style="width: 1200; margin-left: 370px; text-align: center; font-size: 14px;">
				<tr>
					<td width="200px"><img alt="" src="image/hmNote5A.jpg" height="100"></td>
					<td width="200px"><img alt="" src="image/hmNote4X.jpg" height="100"></td>
					<td width="200px"><img alt="" src="image/hm4.jpg" height="100"></td>
					<td width="200px"><img alt="" src="image/hm4X.jpg" height="100"></td>
				</tr>
				<tr>
					<td>红米Note5A</td>
					<td>红米Note4X</td>
					<td>红米4</td>
					<td>红米4X</td>
				</tr>
				<tr style="color: #FF7E00;">
					<td>899元</td>
					<td>999元</td>
					<td>899元</td>
					<td>699元</td>
				</tr>
			</table>
		</div>

		<div id="menu_dn" class="menu_child">
			<hr>
			<table border="0"
				style="width: 1200; margin-left: 370px; text-align: center; font-size: 14px;">
				<tr>
					<td width="200px"><img alt="" src="image/xmPad3.jpg" height="100"></td>
					<td width="200px"><img alt="" src="image/xmAir12.jpg" height="100"></td>
					<td width="200px"><img alt="" src="image/xmAir13.jpg" height="100"></td>
					<td width="200px"><img alt="" src="image/xmPro.jpg" height="100"></td>
				</tr>
				<tr>
					<td>小米平板3</td>
					<td>小米笔记本Air12.5</td>
					<td>小米笔记本Air13.3</td>
					<td>小米笔记本Pro</td>
				</tr>
				<tr style="color: #FF7E00;">
					<td>1499元</td>
					<td>3499元</td>
					<td>4999元</td>
					<td>6999元</td>
				</tr>
			</table>
		</div>

		<div id="menu_ds" class="menu_child">
			<hr>
			<table border="0"
				style="width: 1200; margin-left: 370px; text-align: center; font-size: 14px;">
				<tr>
					<td width="200px"><img alt="" src="image/xmTV4-49.jpg" height="100"></td>
					<td width="200px"><img alt="" src="image/xmTV4-55.jpg" height="100"></td>
					<td width="200px"><img alt="" src="image/xmTV4-65.jpg" height="100"></td>
					<td width="200px"><img alt="" src="image/xmTV4A-43.jpg" height="100"></td>
					<td width="200px"><img alt="" src="image/xmTV4A-49.jpg" height="100"></td>
				</tr>
				<tr>
					<td>小米电视4 49"</td>
					<td>小米电视4 55"</td>
					<td>小米电视4 65"</td>
					<td>小米电视4A 43"</td>
					<td>小米电视4A 49"</td>
				</tr>
				<tr style="color: #FF7E00;">
					<td>3299元</td>
					<td>3999元</td>
					<td>8999元</td>
					<td>1999元</td>
					<td>2499元</td>
				</tr>
			</table>
		</div>


	</div>

	<!-- 海报轮播和下方小海报以及明星单品 -->
	<div id="body_top">
		<!-- 大海报轮播图 -->
		<div id="lbtDiv">
			<a href="productServlet?type=dodetail&pid=2"><img id="lbtImg" alt="" src="image/index_1.jpg"></a>
			<div id="lbtbqDiv">
				<ul>
					<a href="productServlet?type=dodetail&pid=1"><li onmouseover="changeImg(1)" onmouseout="restart()">1</li></a>
					<a href="productServlet?type=dodetail&pid=2"><li onmouseover="changeImg(2)" onmouseout="restart()">2</li></a>
					<a href="productServlet?type=dodetail&pid=3"><li onmouseover="changeImg(3)" onmouseout="restart()">3</li></a>
					<a href="productServlet?type=dodetail&pid=1"><li onmouseover="changeImg(4)" onmouseout="restart()">4</li></a>
					<a href="productServlet?type=dodetail&pid=1"><li onmouseover="changeImg(5)" onmouseout="restart()">5</li></a>
					<a href="productServlet?type=dodetail&pid=1"><li onmouseover="changeImg(6)" onmouseout="restart()">6</li></a>
					<a href="productServlet?type=dodetail&pid=1"><li onmouseover="changeImg(7)" onmouseout="restart()">7</li></a>
				</ul>
			</div>
			<div id="leftmenu">
				<ul>
					<li></li>
					<li><a href="mainServlet?typeId=1" target="_blank"
						onmouseover="showChildMenu( this, 'rightmenu1')"
						onmouseout="hideChildMenu(this,'rightmenu1')">&nbsp;&nbsp;
						手机 电话卡</a></li>
					<li><a href="mainServlet?typeId=2" target="_blank"
						onmouseover="showChildMenu( this, 'rightmenu2')"
						onmouseout="hideChildMenu(this,'rightmenu2')">&nbsp;&nbsp;
						笔记本 平板</a></li>
					<li><a href="mainServlet?typeId=3" target="_blank"
						onmouseover="showChildMenu( this, 'rightmenu3')"
						onmouseout="hideChildMenu(this,'rightmenu3')">&nbsp;&nbsp;
						电视 盒子</a></li>
					<li><a href=""
						onmouseover="showChildMenu( this, 'rightmenu4')"
						onmouseout="hideChildMenu(this,'rightmenu4')">&nbsp;&nbsp;
						路由器 智能硬件</a></li>
					<li><a href=""
						onmouseover="showChildMenu( this, 'rightmenu5')"
						onmouseout="hideChildMenu(this,'rightmenu5')">&nbsp;&nbsp;
						移动电源 插线板</a></li>
					<li><a href=""
						onmouseover="showChildMenu( this, 'rightmenu6')"
						onmouseout="hideChildMenu(this,'rightmenu6')">&nbsp;&nbsp;
						耳机 音箱</a></li>
					<li><a href=""
						onmouseover="showChildMenu( this, 'rightmenu7')"
						onmouseout="hideChildMenu(this,'rightmenu7')">&nbsp;&nbsp;
						保护套 贴膜</a></li>
					<li><a href=""
						onmouseover="showChildMenu( this, 'rightmenu8')"
						onmouseout="hideChildMenu(this,'rightmenu8')">&nbsp;&nbsp;
						线材 支架 存储卡</a></li>
					<li><a href=""
						onmouseover="showChildMenu( this, 'rightmenu9')"
						onmouseout="hideChildMenu(this,'rightmenu9')">&nbsp;&nbsp;
						箱包 服饰 鞋 眼镜</a></li>
					<li><a href=""
						onmouseover="showChildMenu( this, 'rightmenu10')"
						onmouseout="hideChildMenu(this,'rightmenu10')">&nbsp;&nbsp;
						米兔 生活周边</a></li>
				</ul>
			</div>
			<div id="rightmenu1" class="rightmenu">
				<img alt="" src="image/rightmenu1.jpg">
			</div>
			<div id="rightmenu2" class="rightmenu">
				<img alt="" src="image/rightmenu2.jpg">
			</div>
			<div id="rightmenu3" class="rightmenu">
				<img alt="" src="image/rightmenu3.jpg">
			</div>
			<div id="rightmenu4" class="rightmenu">
				<img alt="" src="image/rightmenu4.jpg">
			</div>
			<div id="rightmenu5" class="rightmenu">
				<img alt="" src="image/rightmenu5.jpg">
			</div>
			<div id="rightmenu6" class="rightmenu">
				<img alt="" src="image/rightmenu6.jpg">
			</div>
			<div id="rightmenu7" class="rightmenu">
				<img alt="" src="image/rightmenu7.jpg">
			</div>
			<div id="rightmenu8" class="rightmenu">
				<img alt="" src="image/rightmenu8.jpg">
			</div>
			<div id="rightmenu9" class="rightmenu">
				<img alt="" src="image/rightmenu9.jpg">
			</div>
			<div id="rightmenu10" class="rightmenu">
				<img alt="" src="image/rightmenu10.jpg">
			</div>

		</div>
		<!-- 小海报 -->
		<div id="xhb">
			<a href="productServlet?type=dodetail&pid=1">
				<img alt="" src="image/index2_1.jpg" width="300px;"height="155px;"></a> 
			<a href="productServlet?type=dodetail&pid=2">
				<img alt="" src="image/index2_2.jpg" width="300px;" height="155px;"></a> 
			<a href="productServlet?type=dodetail&pid=3">
				<img alt="" src="image/index2_3.jpg" width="300px;" height="155px;"></a> 
			<a href="productServlet?type=dodetail&pid=1">
				<img alt="" src="image/index2_4.jpg" width="300px;" height="155px;"></a>
		</div>
		<!-- 明星单品 -->
		<div id="mxdp">
			<div id="mxdp_text">
				<h2>小米明星单品</h2>
			</div>
			<div id="mxdp_img" style="width:1300px;">
				<!--显示5条数据-->
				<c:forEach items="${pb.list}" var="p" >
				<a href="${pageContext.request.contextPath}/fore/detailOne.action?pid=${p.pId}">
					<img src="${pageContext.request.contextPath}/image_big/${p.pImage}" alt="" width="250px" height="300px" /></a>
				</c:forEach>
			</div>
		</div>
	</div>

	<br>
	<br>

	<!-- 尾部 -->
	<div id="foot">
		<img alt="" src="image/foot.jpg" width="1890px;">
	</div>

</body>
</html>














