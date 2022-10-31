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

<title>确认订单</title>

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
	//复选按钮计算总金额
	function jisuanTotal() {
		//获取所有的复选按钮
		var chks = document.getElementsByName("pid");
		var total = 0;
		for (var i = 0; i < chks.length; i++) {
			//判断复选按钮是否被选中
			if (chks[i].checked == true) {
				var pid = chks[i].value;
				var xiaoji = document.getElementById("td_" + pid).innerHTML;
				//alert(xiaoji);

				total += parseInt(xiaoji);
			}
		}
		//为合计赋值
		document.getElementById("total_txt").value = total.toFixed(2);
		//${total } = total;
	}
	
	//改变地址
	function changeAddress(op) {
		if (op == true) {
			document.getElementById("oldAddressDiv").style.display = "none";
			document.getElementById("newAddressDiv").style.display = "block";
		} else {
			document.getElementById("oldAddressDiv").style.display = "block";
			document.getElementById("newAddressDiv").style.display = "none";
		}
	}
	
	//全选按钮的选中
	function selall( op ){
		var chks =document.getElementsByName("pid");
		for(var i = 0;i<chks.length;i++){
			chks[i].checked = op;
		}
	}
</script>

<style type="text/css">
a { text-decoration: none; color: black;}
a:hover {color: #FF7E00;}
/* 顶部菜单导航栏 */
#topbar {background-color: #3B3B3B;width: 1890px;height: 40px;}
.sep {color: #3B3B3B}
#topbar a {text-decoration: none;color: #BDBDBD;font-family: 黑体;font-size: 14;}
#topbar a:hover {color: white;}
#topbar_left {width: 700px;margin-left: 350px;padding-top: 10px;float: left;}
#topbar_right {width: 400px;margin-left: 1300px;padding-top: 10px;}
/* 确认订单 */
#pay_title {background-color: white;width: 1890px;height: 95px;}
#logo {float: left;width: 60px;margin-left: 350px;padding-top: 20px;}
#pay_text {width: 700px;margin-left: 500px;padding-top: 30px;}
#hr {height: 2px;border: none;border-top: 2px solid #FF7E00;margin-top: 25px;}
#pay {background-color: white;width: 1226px;height: 100px;margin-left: 350px;}
#pay a {text-decoration: none;font-family: 黑体;font-size: 20;color: black;}
#pay a:hover {color: #FF7E00;}
#pay_left {width: 400px;padding-top: 25px;margin-left: 40px;float: left;}
#pay_right {width: 550px;height: 40px;margin-left: 700px;padding-top: 25px;}
#total_span {color: #FF7E00;}
#total_num {font-size: 40px;}
#total_txt {border: 0px solid #EDEDED;width: 120px;height: 50;line-height: 50px;font-size: 30px;color: #FF7E00;}
#paybtn {background-color: #FF7E00;width: 150px;height: 50px;line-height: 50px;border: 1px solid #EDEDED;cursor: pointer;font-size: 20px;font-family: 黑体;}
/* 收货地址 */
#address {background-color: white;width: 1226px;margin-left: 350px;text-align: center;}
#oldAddressDiv {width: 600px;margin: 0px auto;text-align: center;}
/* 备注信息 */
#beizhu {background-color: white;width: 1226px;height: 180px;margin-left: 350px;text-align: center;}
/* 购物车 */
#carshop {background-color: white;width: 1226px;margin-left: 350px;}
#carshop hr {border: 1px solid #EDEDED;}
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
	</div>

	<!-- 确认订单 -->
	<div id="pay_title">
		<div id="logo">
			<a href="">
				<img alt="" src="${pageContext.request.contextPath}/image/milogo.jpg"
				onmouseover="this.src='${pageContext.request.contextPath}/image/milogo2.jpg'"
				onmouseout="this.src='${pageContext.request.contextPath}/image/milogo.jpg'"></a>
		</div>
		<div id="pay_text">
			<span style="font-family: 黑体;font-size: 34;">确认订单</span>
			&nbsp;&nbsp;&nbsp;&nbsp; 
			<span style="font-family: 黑体;font-size: 16;">温馨提示：请在1小时内完成支付，否则订单将被关闭哦</span>
		</div>
		<hr id="hr">
	</div>
	<br>
	
	<form action="${pageContext.request.contextPath}/fore/zhifu.action" method="post">
	<!-- 收货地址 -->
        <div id="address">
		<br><br>
		<span style="font-family: 黑体;font-size: 30;">&nbsp;选择收货地址</span>
		<input type="checkbox" id="showadd" name="showadd" value="new"
			onclick="changeAddress(this.checked)" />
			<!-- 
		<span style="font-family: 黑体;font-size: 24;">新增收货地址</span>
		-->
		<br><br>
		<hr>
		<div id="oldAddressDiv">
			<table border="0px" width="600" style="text-align: center;">
			<tr>
			<td>地址</td>
			<td>收货人</td>
			<td>电话</td>
			</tr>
			<c:if test="${not empty addressList}">
				<script type="text/javascript">
					document.getElementById("showadd").checked = false;
				</script>
				<c:forEach var="add" items="${addressList}">
					<tr>
						<td width="300px;" height="50px;" style="text-align: left;">&nbsp;
						<input type="radio"	name="rdo" checked="checked" value="${add.addressid}" />
							<span style="font-size: 22;">${add.address }</span></td>
						<td width="100px;">${add.cnee }</td>
						<td width="100px;">${add.phone }</td>
					</tr>
				</c:forEach>

			</c:if>

				<c:if test="${empty addressList }">
					<script type="text/javascript">

						document.getElementById("oldAddressDiv").style.display = "none";
						document.getElementById("newAddressDiv").style.display = "block";
						document.getElementById("showadd").checked = true;
					</script>
				</c:if>

			</table>
		</div>
		<div id="newAddressDiv" style="display: none;">
			<span style="font-family: 黑体;font-size: 16;">&nbsp;请输入收货人姓名</span>
			<br><br>
			<input type="text" name="cnee" style="width: 200px; height: 30px; border: 1px solid #EDEDED;"
				onmouseover="this.style.borderColor='#FF7E00';"
				onmouseout="this.style.borderColor='#EDEDED';">
			<br><br>
			<span style="font-family: 黑体;font-size: 16;">&nbsp;请输入收货人电话</span>
			<br><br>
			<input type="text" name="phone" style="width: 200px; height: 30px; border: 1px solid #EDEDED;"
				onmouseover="this.style.borderColor='#FF7E00';"
				onmouseout="this.style.borderColor='#EDEDED';">
			<br><br>
			<span style="font-family: 黑体;font-size: 16;">&nbsp;请输入新地址</span><br>
			<br>
			<textarea rows="3" cols="100" name="newaddress"
				onmouseover="this.style.borderColor='#FF7E00';"
				onmouseout="this.style.borderColor='#EDEDED';"></textarea>
			<br>
			
		</div>
		<br>
	</div>
	<br>

	<!-- 备注信息 -->
	<div id="beizhu">
		<br>
		<br> <span style="font-family: 黑体;font-size: 24;">&nbsp;输入备注信息</span><br>
		<br> &nbsp;
		<textarea rows="3" cols="100" name="beizhu"
			onmouseover="this.style.borderColor='#FF7E00';"
			onmouseout="this.style.borderColor='#EDEDED';"></textarea>
	</div>
	<br>

	<!-- 购物车 -->
	
		<div id="carshop">
			<table border="0px" width="1226" style="text-align: center;">
				<tr>
					<td>选择</td>
					<td height="70px;">图片</td>
					<td>名称</td>
					<td>型号</td>
					<td>单价</td>
					<td>数量</td>
					<td>小计</td>
				</tr>

				<c:set var="total" value="0"></c:set>
				<c:forEach var="car" items="${carlist}" varStatus="i">
					<tr>
						<td colspan="7"><hr></td>
					</tr>
					<tr style="font-size: 18px;">
						<td width="50">
							<input type="checkbox" name="pid" value="${car.prod.pId }" checked="checked"
								onclick="jisuanTotal()" /></td>
						<td width="100" height="150">
							<img alt="" src="image_big/${car.prod.pImage }" style="height: 150;"></td>
						<td width="126"><a href="">${car.prod.pName }</a></td>
						<td width="400"><a href="">${car.prod.pContent }</a></td>
						<td width="100">${car.prod.pPrice }元</td>
						<td width="200">${car.numbers }件</td>
						<td width="130" style="color: #FF7E00;" id="td_${car.prod.pId }">${car.prod.pPrice*car.numbers }元</td>
						<c:set var="total" value="${total+car.prod.pPrice*car.numbers }"></c:set>
					</tr>
				</c:forEach>
			</table>
		</div>
		<br>
		
		<!-- 支付栏 -->
		<div id="pay">
			<div id="pay_left">
				<a href="index.jsp"
					style="display: block; width: 150px; height: 50px; line-height: 50px; background-color: #FF7E00; font-size: 20; text-align: center;"
					onmouseover="this.style.color='white';"
					onmouseout="this.style.color='black';"> 继续购物</a>
			</div>
			<div id="pay_right">
				<span>活动优惠：减0元&nbsp;&nbsp;</span>
				<span id="total_span">合计：
				<input type="text" id="total_txt" name="total" readonly="readonly" value="${total }"></span>
				<span>
				<input type="submit" value="立即支付" id="paybtn" onmouseover="this.style.color='white';"
						onmouseout="this.style.color='black';"></span>
			</div>
		</div>
		<br>
	</form>

	<div>
		<img alt="" src="image/carshop_tj.jpg" width="1890px;">
	</div>

	<!-- 尾部 -->
	<div id="foot">
		<img alt="" src="image/foot.jpg" width="1890px;">
	</div>

</body>
</html>
