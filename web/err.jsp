<%@ page  isErrorPage="true"  contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    
</head>
<style>
    #topbar {background-color: #3B3B3B;width: 100%;height: 40px;}
    .sep {color: #3B3B3B}
    #topbar a {text-decoration: none;color: #BDBDBD;}
    #topbar a:hover {color: white;}
    #topbar_left { width: 700px;margin-left: 350px;margin-right:200px; padding-top: 10px;float: left;}
    #topbar_right {padding-top: 10px;float: left;}

    #foot{
        margin-top:50px;
    }

    #main{
        width: 1228px;
        height: 400px;
        margin: 0 auto;
    }
    #main img{
        display: block;
        margin: 0 auto;
    }
</style>
<body>


<div id="main" >
    <img src="image/404.png" width="987" alt="404">
</div>
<a href="${pageContext.request.contextPath}/index.jsp">返回首页</a>
<div id="foot">
    <img src="image/foot.jpg" alt="">
</div>
</body>
</html>
