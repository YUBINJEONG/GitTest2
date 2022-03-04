<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글 내용</title>
</head>
<body>
	<!-- Content -->
	<form action="boardModifyAction?board_idx=${ boardDTO.board_idx }" method="post" name="userContent" onsubmit="return checkValue();">
		<table border="1" width="480" align="center" cellspacing="0">
			<tr>
				<td align="center" width="52">번호</td>
				<td>${ boardDTO.board_idx }</td>
			</tr>
			<tr>
				<td align="center">조회수</td>
				<td>${ boardDTO.board_hit }</td>
			</tr>
			<tr>
				<td align="center">이름</td>
				<td>
					<input type="text" name="board_name" id="board_name" value="${ fn:escapeXml(boardDTO.board_name) }" maxlength="20" size="50" />
				</td>
			</tr>
			<tr>
				<td align="center">제목</td>
				<td>
					<input type="text" name="board_title" id="board_title"  value="${ fn:escapeXml(boardDTO.board_title) }"maxlength="100" size="50" />
				</td>
			</tr>
			<tr>
				<td align="center">내용</td>
				<td>
					<textarea name="board_content" maxlength="300" cols="55" rows="12">${ boardDTO.board_content }</textarea>
				</td>
			</tr>
			<tr align="center">
				<td colspan="2">
					<input type="submit" value="수정" style="margin:5px;">
					<a href="boardListForm"><input type="button" value="목록" style="margin-right:5px;"></a>
					<a href="boardDeleteAction?board_idx=${ boardDTO.board_idx }"><input type="button" value="삭제"></a>
				</td>
			</tr>
		</table>
	</form>
	
	<!-- ReplyList -->
	<table border="1" width="600" align="center" cellspacing="0" cellpadding="0" style="margin-top:20px; margin-bottom:20px;">
		<tr>
			<th width="70">이름</th>
			<th>내용</th>
			<th>날짜</th>
			<th width="45">삭제</th>
		</tr>
		<c:forEach var="replyDTO" items="${ replyDTOList }">
			<tr align="center">
				<td>${ replyDTO.reply_name }</td>
				<td>${ replyDTO.reply_content }</td>
				<td>
					<fmt:formatDate var="fmt_reply_date" pattern="yyyy-MM-dd HH:mm:ss" value="${ replyDTO.reply_date }"/>
					${ fmt_reply_date }
				</td>
				<td><a href="replyDeleteAction?reply_idx=${ replyDTO.reply_idx }&board_idx=${ boardDTO.board_idx }"><button>삭제</button></a></td>
			</tr>
		</c:forEach>
	</table>
	
	<!-- ReplyWrite -->
	<form action="replyWriteAction?reply_board_idx=${ boardDTO.board_idx }" method="post" name="userReply" onsubmit="return replyCheckValue();">
		<table border="1" width="480" align="center" cellspacing="0">
			<tr>
				<td align="center" width="52">이름</td>
				<td>
					<input type="text" name="reply_name" id="reply_name" maxlength="20" size="50" />
				</td>
			</tr>
			<tr>
				<td align="center">댓글</td>
				<td align="right">
					<textarea name="reply_content" maxlength="300" cols="55" rows="3"></textarea>
          			<input type="submit" value="등록" style="margin:0px 3px 3px 3px;">
				</td>
			</tr>
		</table>
	</form>
	
	<!-- JS -->
	<script>
		function checkValue() {		//유효성체크
			var name = document.userContent.board_name.value;
			if(!name || name.match(/\s/)) {	//값이 없을 때 or 공백이 있을 때
				alert("이름을 작성해주세요.\n(공백허용안함)")
				document.getElementById('board_name').focus();
				return false;	//submit 전송실패
			}
			var title = document.userContent.board_title.value;
			if(!title.trim()) { //값이 없을 때 or 공백만 있을 때(trim() : 앞뒤 공백제거)
				alert("제목을 작성해주세요.")
				document.getElementById('board_title').focus();
				return false;	//submit 전송실패
			}
			return true;
		}
		function replyCheckValue() {	//유효성체크
			var name = document.userReply.reply_name.value;
			if(!name || name.match(/\s/)) { //값이 없을 때 or 공백이 있을 때
				alert("이름을 작성해주세요.\n(공백허용안함)")
				document.getElementById('reply_name').focus();
				return false;	//submit 전송실패
			}
			return true;
		}
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