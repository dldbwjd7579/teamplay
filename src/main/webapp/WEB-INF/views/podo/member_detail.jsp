<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
 <!-- jQuery : Bootstrap JS 파일은 jQuery 라이브러리를 반드시 넣어줘야 함! -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
 <!-- Bootstrap JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
td{
	padding: 20px;
}
.rigth_box{
	border: 1px solid purple;
	width: 700px;
	height: 400px;
}
.left_box{
	border: 1px solid gray;
	width: 200px;
	height: 200px;
}
</style>
</head>
<body>
<div class="container">
<h1>마이페이지</h1>
<hr>
<table class="text-center">
<thead></thead>
<tbody>
	<tr>
		<td>
			<div class="left_box">
				user프로필 출력<br><br>
				<h4>테스트 아이디 : ${userid }</h4>
				<br>
				테스트 아이디에 해당하는<br>
				- mp3 다운로드리스트
				(PODO_GET)<br>
				- 플레이리스트
				(PODO_PLAYLIST)
			</div>
		</td>
		<td rowspan="2">
			<h5>mp3 구매 목록</h5>
			<div class="rigth_box">
				<table class="table">
				<thead>
					<tr style="background-color: purple; color: white;">
						<th class="text-center">제목</th>
						<th class="text-center">앨범</th>
						<th class="text-center">가수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="mp3" items="${mp3List }">
						<tr>
						<td>${mp3.mtitle}</td>
						<td>${mp3.malbum }</td>
						<td>${mp3.martist}</td>
						</tr>
					</c:forEach>
				</tbody>
				</table>
			</div>
		</td>
	</tr>
	<tr><td>--</td></tr>
	<tr>
		<td>--</td>
		<td rowspan="2">
			<h5>플레이리스트 목록</h5>
			<div class="rigth_box">
				<table class="table">
				<thead>
					<tr style="background-color: purple; color: white;">
						<th class="text-center">리스트 제목</th>
						<th class="text-center">저장 날짜</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="music" items="${playList }">
						<tr>
						<td><a>${music.ptitle }</a></td>
						<td>${music.pdate }</td>
						<td>
						<!-- 버튼 누르면 해당 플레이리스트 삭제 -->
						<button id = "btn_playlist_delete"
						class="btn" 
						style="padding: 5px; padding-top: 0px; padding-bottom: 0px;">X</button>
						</td>
						</tr>
					</c:forEach>
				</tbody>
				</table>
			</div>
		</td>
	</tr>
	<tr><td>--</td></tr>
</tbody>
</table>


</div>
<script>
$(document).ready(function(){
	
	
	
	//플레이 리스트의 x 버튼 눌리면
	$('#btn_playlist_delete').click(function(){
		
	});
	
});
</script>
</body>
</html>

