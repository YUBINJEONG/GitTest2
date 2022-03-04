<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글 작성</title>
</head>
<body>
	<h1 align="center">게시판 글쓰기</h1>
	<form action="boardWriteAction" method="post" name="userContent" onsubmit="return checkValue();">
		<table border="1" width="480" align="center" cellspacing="0">
			<tr>
				<td align="center"  width="52">이름</td>
				<td>
					<input type="text" name="board_name" id="board_name" maxlength="20" size="50" />
				</td>
			</tr>
			<tr>
				<td align="center">제목</td>
				<td>
					<input type="text" name="board_title" id="board_title" maxlength="100" size="50" />
				</td>
			</tr>
			<tr>
				<td align="center">내용</td>
				<td>
					<textarea name="board_content" maxlength="300" cols="55" rows="12"></textarea>
				</td>
			</tr>
			<tr align="center">
				<td colspan="2">
					<input type="submit" value="등록" style="margin:5px;">
					<a href="boardListForm"><input type="button" value="목록"></a>
				</td>
			</tr>
		</table>
	</form>
	
	<!-- JS -->
	<script>
		function checkValue() {		//유효성체크
			var name = document.userContent.board_name.value;
			if(!name || name.match(/\s/)) { //값이 없을 때 or 공백이 있을 때
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
	</script>
</body>
</html>