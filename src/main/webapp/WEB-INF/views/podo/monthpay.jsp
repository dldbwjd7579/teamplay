<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>PODO Home</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<!-- jQuery : Bootstrap JS 파일은 jQuery 라이브러리를 반드시 넣어줘야 함! -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- Bootstrap JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>


ul {
	overflow: auto;
	list-style-type: none;
}

li {
	float: left;
	display: inline;
  
}

/* .navbar-inverse {

	background-color: #4D408A;
	color: white;
} */

#innercontainer li {

  position: relative;
  z-index: 10; 
  list-style: none; 
  margin: 0;
  padding: 2px; 
  max-height: 50px; 
  overflow-y: scroll;
  overflow-x: scroll;
}

#innercontainer ul{
   margin: 0;
   padding: 0 4px;
   border-radius: 2px;
   max-width: 10em;

   white-space: nowrap;
   color: black;
   cursor: pointer; 


}




</style>



</head>



<body>


	<div class="container" style="width:1000px;">
		<!-- 타이틀 -->
		<h1 class="text-center">
			<a href="http://localhost:8181/ex00/">PODO DREAM</a>
		</h1>



		<!-- 로그인  -->
		<div id="noline" style="float: right">
			<form action="login-post" method="post" id="noline">
				<c:if test="${empty loginUserid}">
					<input type="text" name="userid" id="userid" placeholder="아이디"
						style="margin-right: 10px" required autofocus />
					<br>
					<input type="password" name="password" id="password"
						style="margin-right: 10px" placeholder="비밀번호" required />
					<br>
					<input type="submit" id="btn-login" value="로그인" class="btn" style="background-color:#DFE0E7; color:white;">
					<a href="register"><input type="button" value="회원가입" class="btn"style="background-color:#DFE0E7; color:white;"> </a>
					<br>
					</tbody>


				</c:if>

			</form>

			<c:if test="${not empty loginUserid}">
				<form action="logout" method="get">
					${loginUserid}님, 환영합니다 <input type="submit" id="btn-logout" class="btn"
					style="background-color:#DFE0E7; color:white;"
						name="btn-logout" value="로그아웃" style="margin-right: 10px"><br>
					<a href="member_detail" class="text-align:right">마이페이지(test)</a>
				</form>
			</c:if>

			<!-- 로그인 후에 이동할 페이지 -->
			<input type="hidden" name="queryString" value="${loginTarget}" />
		</div>


		<br>
		<form action="search" method="get" class="text-center"
			style="margin-left: 50px">
			<select name="searchType">
				<option value="1">노래 제목</option>
				<option value="2">가수</option>
				<option value="3">앨범명</option>
				<option value="4">장르별</option>
			</select> <input type="text" name="searchKeyword" placeholder="검색어"
				style="width: 500" /> <input type="submit" value="검색" class="btn " style="background-color:#1C1637; color:white;" />
		</form>
		<br>

		<!-- 메뉴 bar -->

		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="">PODO</a>
				</div> 
				<ul class="nav navbar-nav">
					<li class="active"><a href="">홈</a></li>

					<li><a href="chart">차트</a></li>

					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">장르 <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="">발라드</a></li>
							<li><a href="">댄스</a></li>
							<li><a href="">인디</a></li>
							<li><a href="">힙합</a></li>
							<li><a href="">트로트</a></li>
						</ul></li>
					<li><a href="monthpay">이용권</a></li>
					<li><a href="event">이벤트</a></li>
					<li><a href="boardQnA">Q&A</a></li>
				</ul>
			</div>
		</nav>


<div align="center">
<h1>이용권 구매</h1>

<h2>1개월권 3900원</h2>
<a onclick="month1()">결제하기</a>
<br/>
<h2>2개월권 7900원</h2>
<a onclick="month2()">결제하기</a>
<br/>
<h2>3개월권 9900원</h2>
<a onclick="month3()">결제하기</a>
<br/>
<h1>매월 자동 결제 신청 시 월 3300원!</h1>
<h2><a>월 자동 결제 신청하기</a></h2>
<br/>
</div>


<div align="right">

	<input id="money" name="money" readonly required>원<br/>
	<input id="pay" type="submit" value="결제하기" disabled onclick="popupOpen()">

</div>

<script type="text/javascript">
function month1() {
	if (${not empty loginUserid}) {
		var money = document.getElementById('money');
		money.value = 3900;
		document.getElementById("pay").disabled = false;
	} else {
		alert('로그인이 필요합니다');	
	}
}

function month2() {
	if (${not empty loginUserid}) {
		var money = document.getElementById('money');
		money.value = 7900;
		document.getElementById("pay").disabled = false;
	} else {
		alert('로그인이 필요합니다');	
	}
}
function month3() {
	if (${not empty loginUserid}) {
		var money = document.getElementById('money');
		money.value = 9900;
		document.getElementById("pay").disabled = false;
	} else {
		alert('로그인이 필요합니다');	
	}
}


</script>


<script> 
function popupOpen(){
	var money = document.getElementById('money');
	var popUrl = "http://localhost:8181/ex00/paid?money=" + money.value;	
	var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;";    
		window.open(popUrl,"",popOption);
	}

</script> 




</div>


</body>
</html>

