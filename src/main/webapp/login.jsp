<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale"="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>운동하실?</title>
<style>footer{background-color:#3c3935; text-align:center; font-size:15px; color: white; position:fixed; bottom:0; width:100%;}
.foo_div1{text-align:center; font-size:15px; color: white;}
h1{text-align:center; margin-top:100px; font-size:60px;}
.container{margin-top:100px;}</style>
</head>
<body>
  <nav class="navbar navbar-default">
  	<div class="navbar-header">
  		<button type="button" class="navbar-toggle collapsed"
  			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
  			aria-expanded="false">
  			<span class="icon-bar"></span>
  			<span class="icon-bar"></span>
  			<span class="icon-bar"></span>
  		</button>
  		<a class="navbar-brand" href="main.jsp">운동하실?</a>
  	</div>
  	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
  		<ul class="nav navbar-nav">
  			<li><a href="main.jsp">메인</a></li>
  			<li><a href="bbs.jsp">모집</a></li>
  			<li><a href="MAP.jsp">동네 체육시설 찾기</a></li>
  		</ul>
  		<ul class="nav navbar-nav navbar-right">
  			<li class="dropdown">
  				<a href="#" class="dropdown-toggle"
  					data-toggle="dropdown" role="button" aria-haspopup="true"
  					aria-expanded="false">접속하기<span class="caret"></span></a>
  				<ul class="dropdown-menu">
  					<li class="active"><a href="login.jsp">로그인</a></li>
  					<li><a href="join.jsp">회원가입</a></li>
  				</ul>
  			</li>
  		</ul>
  	</div>
  </nav>
  <h1>운동하실?</h1>
  <div class="container">
  	<div class="col-lg-4"></div>
  	<div class="col-lg-4">
  		<div class="jumbotron" style="padding-top: 20px;">
  		
  			<form method="post" action="loginAction.jsp">
  				<h3 style="text-align: center;">로그인</h3>
  				<div class="form-group">
  					<input type="text" class="form-control" placeholder="ID" name="userID" maxlength="20">
  				</div>
  				<div class="form-group">
  					<input type="password" class="form-control" placeholder="PASSWORD" name="userPassword" maxlength="20">
  				</div>
  				<input type="submit" class="btn btn-primary form-control" value="login">
  			</form>
  		</div>
  	</div>
  	<div class="col-lg-4"></div>
  </div>
  <footer>
	<div class="foo div"><span>㈜운동하실?</span>
	<span>주소: 22012 인천광역시 연수구 아카데미로 119(송도동) 인천대학교</span>
	<span>Tel:010-8903-9126</span></div>

	</footer>
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <script src="js/bootstrap.js"></script>
</body>
</html>