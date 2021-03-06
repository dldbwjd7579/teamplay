
<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>PODO</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="css/style.css">
<!-- jQuery : Bootstrap JS 파일은 jQuery 라이브러리를 반드시 넣어줘야 함! -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- Bootstrap JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="js.prefixfree.jquery.js"></script>
<script type="text/javascript" src="js/custom.js"></script>

<style>
#innercontainer li {
	float: left;
	display: inline;
	position: relative;
	z-index: 10;
	list-style: none;
	margin: 0;
	padding: 2px;
	max-height: 50px;
	overflow-y: scroll;
	overflow-x: scroll;
}

#innercontainer ul {
	overflow: auto;
	list-style-type: none;
	margin: 0;
	padding: 0 4px;
	border-radius: 2px;
	max-width: 10em;
	white-space: nowrap;
	color: black;
	cursor: pointer;
}

#menu {
	list-style: none;
	float: center;
	margin: 0;
	padding: 0;
}

#menuLi {
	margin: 0;
	padding: 0;
	border: 0;
	float: left;
}


a {
	outline: none;
	text-decoration: none;
	color: #555;
}

img {
	barder: 0;
}

#newalbum_place {
	padding: 10px;
	background-color: white;
}

#newalbum_place li {
	padding: 10px;
	float: left;
	display: inline;
}

#albumart:hover {
	/* filter : opacity(50%); */
	
}

#albumart {
	width: 65px;
	height: 65px;
}

.footer_item {
	width: 200px;
	text-align: center;
}

.navitem:hover {
	background-color: #8d8a9b;
}

#nav-chart:hover, #nav-jenre:hover, #nav-charge:hover, #nav-event:hover,
	#nav-fanda:hover, #nav-home:hover {
	background-color: #8d8a9b;
}

#nav-jenre:active, #nav-jenre:visited {
	background-color: #8d8a9b;
}
</style>



</head>



<body>

	<div style="background-color: #1C1637">
		<div class="container" style="width: 1200px;background-color: #1C1637">
			<!-- 타이틀 -->
			<h1 class="text-center">
				<a href="http://192.168.11.11:8181/ex00/" style="text-decoration: none;">
					<img alt="grape" src="././resources/images/grape3.png"
					style="width: 58px;"> <img alt="PODO"
					src="././resources/images/podo_white.png">
				</a>
			</h1>

			<!-- 로그인  -->
			<div id="noline" style="float: right; margin-top: 20px;">
				<c:if test="${empty loginUserid}">
					<form action="login-post" method="post" id="noline">
						<table>
							<tr>
								<td><input type="text" name="userid" id="userid"
									placeholder="아이디" style="width: 150px; margin-right: 5px;"
									required autofocus /></td>
								<td rowspan="2"><input type="submit" id="btn-login"
									value="로그인" class="btn"
									style="background-color: #8d8a9b; color: white; height: 50px; font-weight: bold;">
								</td>
							</tr>
							<tr>
								<td><input type="password" name="password" id="password"
									style="width: 150px; margin-right: 5px;" placeholder="비밀번호"
									required /></td>
							</tr>
						</table>
						<a href="register" style="color: #8d8a9b;">회원가입</a>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="iforgotMyId"
							style="color: #8d8a9b;">아이디·비밀번호 찾기</a> <br>
						</tbody>

					</form>
				</c:if>

				<c:if test="${not empty loginUserid}">
					<form action="logout" method="get">
						<table>
							<tr>
								<td>
									<p style="margin-right: 5px; color: white;">${loginUserid}님,
										환영합니다</p>
								</td>
								<td rowspan="2"><input type="submit" id="btn-logout"
									class="btn"
									style="background-color: #8d8a9b; color: white; height: 50px;"
									name="btn-logout" value="로그아웃"></td>
							</tr>
							<tr>
								<td><a href="member_detail" class="text-align:right"
									style="margin-right: 5px; color: #8d8a9b;">마이페이지</a></td>
							</tr>
						</table>
						<br>

					</form>
				</c:if>

				<!-- 로그인 후에 이동할 페이지 -->
				<input type="hidden" name="queryString" value="${loginTarget}" />
			</div>

			<!--로그인 실패시 띄울 알람. -->
			<script>
		$(document).ready(function() {
			if (${loginfail}==5) {
				alert("아이디와 비밀번호 확인해 주세요.");
				
			} 
			});
		</script>


			<br>
			<!-- 검색창 -->
			<form action="search" method="get" class="text-center"
				id="form-search">
				<input type="hidden" name="searchType" id="searchType" value="1">
				<table class="text-center"
					style="margin-left: 280px; border: 1px solid #8d8a9b;">
					<tr>
						<td><input type="text" name="searchKeyword" placeholder="검색"
							style="width: 580px; height: 42px; border: 3px solid #1C1637; margin: 5px;" />
						</td>
						<td>
							<!-- 검색 버튼 --> <a href="#" id="btn-search"
							style="text-decoration: none;"> <img alt="search"
								src="././resources/images/search_icon.png"
								style="background-color: #1C1637; padding: 5px;">
						</a>
						</td>
					</tr>
				</table>
			</form>
			<br>

		</div>


		<div style="background-color: #1C1637; height: 50px;">
			<!-- 메뉴 bar -->

			<div class="container">
				<nav class="navbar navbar-inverse"
					style="width: 970px; display: inline-block; background-color: #1C1637; border: none; text-align: center;">
					<div class="container-fluid">
						<div class="navbar-header">
							<a class="navbar-brand navitem"
								href="http://192.168.11.11:8181/ex00/" style="color: #00FDFD;"
								id="nav-podo">PODO</a>
						</div>
						<ul class="nav navbar-nav">
							<li><a href="http://192.168.11.11:8181/ex00/"
								style="color: white;" id="nav-home"> 홈 </a></li>
							<li><a href="chart" style="color: white;" id="nav-chart">
									차트 </a></li>
							<li class="dropdown"><a class="dropdown-toggle"
								data-toggle="dropdown" href="#" style="color: white;"
								id="nav-jenre"> 장르 <span class="caret"></span>
							</a>
								<ul class="dropdown-menu">
									<li><a href="search?searchType=4&searchKeyword=ballad">발라드</a></li>
									<li><a href="search?searchType=4&searchKeyword=dance">댄스</a></li>
									<li><a href="search?searchType=4&searchKeyword=indi">인디</a></li>
									<li><a href="search?searchType=4&searchKeyword=hiphop">힙합</a></li>
									<li><a href="search?searchType=4&searchKeyword=trot">트로트</a></li>
								</ul></li>
							<li><a href="monthpay" style="color: white;" id="nav-charge">이용권</a></li>
							<li><a href="event" style="color: white;" id="nav-event">이벤트</a></li>
							<li><a href="boardFnA" style="color: white;" id="nav-fanda">F&A</a></li>

						</ul>
					</div>
				</nav>
			</div>
		</div>
	</div>
	<br/>
	<img src="././resources/images/boardlogo11.png"alt="게시글 수정" style="width:250px; height:60px; margin-left:100px;">
	
	<hr />

	<ul style="display:inline;" id="menu">
		<li><a href="boardFnA" id="menuLi"	style="width: 100px; height: 40px; margin-left:120px; background-color: #1c1637; font-family: 배달의민족 주아; font-size: 20px; color: #fff; border: 2px solid lightgrey;"
				class="btn btn-primary;"">메인으로</a></li>
		<li><a href="delete?bno=${board.bno }" id="menuLi"	style="width: 100px; margin-left:10px; height: 40px; background-color: #1c1637; font-family: 배달의민족 주아; font-size: 20px; color: #fff; border: 2px solid lightgrey;"
				class="btn btn-primary;">삭제하기</a></li>
	</ul>
	<br/><br/>
	<hr />

	<div class="text-left" style="margin-left:120px">
		<form action="boardupdate" method="post">
			<input type="hidden" name="bno" id="bno" value="${board.bno }">
		
			<label for="title"><img	src="././resources/images/boardlogo2_2.png" alt="제목"></label>
			<input type="text" name="title" id="title"  style="width: 800px"value="${board.title }" />
			<br /> 
			
			<label for="content"><img src="././resources/images/boardlogo3_3.png" alt="내용"
				style="display: inline;"></label><br />
			<textarea  rows="15" cols="130" name="content" id="content">${board.content}</textarea>
			<br /> 
			
			<label for="userid"><img src="././resources/images/boardlogo4_4.png" alt="아이디"></label>
			<input type="text" name="userid" id="userid" value="${board.userid}" readonly /> <br />
			
			<label for="regdate"><img src="././resources/images/boardlogo7.png" alt="작성시간"></label>
			<fmt:formatDate value="${board.regdate}" var="regdate"	pattern="yyyy/MM/dd HH:mm:ss" />
			<input type="text" id="regdate" value="${regdate}" readonly /><br />
			<br/>
			
			<input type="submit" value="작성완료"
				style="width: 100px; margin-left:400px;  height: 40px; background-color: #1c1637; font-family: 배달의민족 주아; font-size: 20px; color: #fff; border: 2px solid lightgrey;"
				class="btn btn-primary; " /> <br />

		</form>

	</div>

	<div>
		<img src="././resources/images/logo11.png" alt=" "
			style="margin-top: 100px;" />
	</div>
</body>
<footer>
	<div style="float: center;">
		<table style="text-align: center; font-size: 13; width: 700px;">
			<tr>
				<td class="footer_item"><a href="introduction">회사소개</a></td>
				<td class="footer_item"><a>인재채용</a></td>
				<td class="footer_item"><a>제휴제안</a></td>
				<td class="footer_item"><a href="usingagreement">이용약관</a></td>
				<td class="footer_item"><a href="personalInformation">개인정보처리방침</a></td>
				<th class="footer_item"><a>ⓒ PODO Corp.</a></th>
			</tr>
		</table>
	</div>
</footer>
</html>