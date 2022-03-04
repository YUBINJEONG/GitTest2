<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글 목록</title>
</head>
<body>
	<h1 align="center">게시판 글 목록</h1>
	<table border="1" width="600" align="center" cellspacing="0">
		<tr>
			<th width="35">번호</th>
			<th width="70">이름</th>
			<th>제목</th>
			<th>날짜</th>
			<th width="50">조회수</th>
		</tr>
		<c:forEach var="boardDTO" items="${ boardDTOList }">
			<tr align="center">
				<td>${ boardDTO.board_idx }</td>
				<td>${ boardDTO.board_name }</td>
				<td><a href="boardViewForm?board_idx=${ boardDTO.board_idx }">${ boardDTO.board_title }</a></td>
				<td>
					<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${ boardDTO.board_date }"/>
				</td>
				<td>${ boardDTO.board_hit }</td>
			</tr>
		</c:forEach>
		<tr align="center">
			<td colspan="5">
				<a href="boardWriteForm"><button style="margin:3px;">글쓰기</button></a>
			</td>
		</tr>
	</table>
	
	<!-- JS -->
	<script>
	window.onpageshow = function(event) { //뒤로가기시 새로고침(업데이트필요)
	    if (event.persisted || (window.performance && window.performance.navigation.type == 2)) {
	        document.location.reload();
	    }
	};
	//window.addEventListener('pageshow', function(event) {
	//	  if (event.persisted) {
	//	    console.log('Page was loaded from cache.');
	//	  }
	//});
	//window.onpageshow = function(event) { //나만 안먹음
	//    if (event.persisted) {
	//        document.location.reload();
	//    }
	//};
	</script>
	<script>
		let isEmpty = function(value){
			if( value == "" || value == null || value == undefined || 
					( value != null && typeof value == "object" && !Object.keys(value).length ) ){
				return true;
			}else{
				return false;
			}
		};
		
		let alert_message = "${alert_message}";
		if(!isEmpty(alert_message)){
			alert( alert_message );
		}
		<%
			request.getSession().setAttribute("alert_message", "");
		%>
	</script>
</body>
</html>