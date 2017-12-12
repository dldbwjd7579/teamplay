<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<!-- jQuery : Bootstrap JS 파일은 jQuery 라이브러리를 반드시 넣어줘야 함! -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- Bootstrap JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
.m_detail_th {
	width: 200px;
	padding: 10px;
}

.m_detail_td {
	padding: 10px;
}
</style>
</head>
<body>

	<div class="container" style="width: 1000px;">
		<!-- 타이틀 -->
		<h1 class="text-center">
			<a href="http://localhost:8181/ex00/" style="text-decoration: none;">PODO
				DREAM</a>
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
					<input type="submit" id="btn-login" value="로그인" class="btn"
						style="background-color: #DFE0E7; color: white;">
					<a href="register"><input type="button" value="회원가입"
						class="btn" style="background-color: #DFE0E7; color: white;">
					</a>
					<br>
					</tbody>


				</c:if>

			</form>

			<c:if test="${not empty loginUserid}">
				<form action="logout" method="get">
					${loginUserid}님, 환영합니다 <input type="submit" id="btn-logout"
						class="btn" style="background-color: #DFE0E7; color: white;"
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
				style="width: 500" /> <input type="submit" value="검색" class="btn "
				style="background-color: #1C1637; color: white;" />
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


		<!-- 본문 -->
		<div style="float: center;">
			<div style="font-size: 40px; font-weight: bold; margin: 20px;">
				${music.mtitle }</div>
			<table>
				<tr>
					<td><img class="albumart" alt="자켓이미지"
						src="././resources/images/${music.malbumart}"
						style="width: 300px; height: 300px;"></td>
					<td style="padding: 20px; border: 1px solid #2E2E2E;">
						<table style="font-size: 18px;">
							<tr>
								<th class="m_detail_th">제목</th>
								<td class="m_detail_td">${music.mtitle }</td>
							</tr>
							<tr>
								<th class="m_detail_th">앨범</th>
								<td class="m_detail_td">${music.malbum }</td>
							</tr>
							<tr>
								<th class="m_detail_th">아티스트</th>
								<td class="m_detail_td">${music.martist }</td>
							</tr>
							<tr>
								<th class="m_detail_th">발매일</th>
								<td class="m_detail_td">${music.mdate }</td>
							</tr>
						</table>
				</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<br>
					<iframe
							width="853" height="480"
							src="https://www.youtube.com/embed/42A-rFdralM?rel=0"
							frameborder="0" gesture="media" allow="encrypted-media"
							allowfullscreen>
					</iframe>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center"
						style="padding: 20px; font-size: 15px; font-weight: bold;">
						가사</td>
				</tr>
				<tr>
					<td colspan="2"><textarea rows="100" cols="100" readonly
							style="border: none; margin-top: 30px; text-align: center; width: 970px;">${music.mlyrics}
						</textarea></td>
				</tr>
			</table>
		</div>
		<!-- 본문 끝 -->

	</div>
</body>
</html>










					







