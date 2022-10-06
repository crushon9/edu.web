<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<title>${vo.boardTitle}</title>
</head>
<body>
	<h2>글 보기</h2>
	<div>
		<p>글번호 : ${vo.boardId }</p>
	</div>
	<div>
		<p>제목 : 
		<input type="text" name="boardTitle" value=" ${vo.boardTitle}" readonly></p>
	</div>
	<div>
		<p>작성자 : ${vo.memberId }</p>
		<p>작성일 : ${vo.boardDateCreated }</p>
	</div>
	<div>
		<textarea rows="20" cols="120" readonly>${vo.boardContent }</textarea>
	</div>
	<a href="index.jsp"><input type="button" value="글 목록"></a>
	<a href="update.do?boardId=${vo.boardId }"><input type="button" value="글 수정"></a>
	<form action="delete.do" method="post">
		<input type="hidden" name="boardId" value="${vo.boardId }">
		<input type="submit" value="글 삭제">
	</form>
	<hr>
	<div style="text-align: center;">
		<input type="hidden" id="boardId" value="${vo.boardId }">
		<input type="text" id="memberId">
		<input type="text" id="replyContent">
		<button id="btn_add">작성</button>
	</div>
	<hr>
	<div style="text-align: center;">
		<div id="replies"></div>
	</div>
	<div>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			// 버튼 클릭시 댓글 추가
			$('#btn_add').click(function() {
				var boardId = $('#boardId').val(); // 게시글번호 데이터
				var memberId = $('#memberId').val(); // 사용자아이디 데이터
				var replyContent = $('#replyContent').val(); // 댓글내용 데이터
				var obj = {
					'boardId' : boardId,
					'memberId' : memberId,
					'replyContent' : replyContent
				};
				console.log(obj);

				// $.ajax로 송수신
				$.ajax({
					type : "POST",
					url : "replies/add",
					data : {
						'obj' : JSON.stringify(obj)
					}, // JSON으로 변환
					success : function(result) {
						console.log(result);
						if (result == 'success') {
							alert('댓글 입력 성공');
						}
					} // end ajax.success.function
				}); // end ajax
			}); // end btn_add.click

			// 게시판 댓글 전체 가져오기
			function getAllReplies() {
				var boardId = $('#boardId').val();
				var url = 'replies/all?boardId=' + boardId;
				$.getJSON(); // end getJSON
			} // end getAllReplies

		}); // end document
	</script>
</body>
</html>