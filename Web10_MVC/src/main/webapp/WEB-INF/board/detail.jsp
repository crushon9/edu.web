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
	<div style="margin-left: 80px">
		<input type="hidden" id="boardId" value="${vo.boardId }">
		<input type="text" id="memberId">
		<input type="text" id="replyContent">
		<button id="btn_add">작성</button>
	</div>
	<hr>
	<div style="margin-left: 40px">
		<div id="replies"></div>
	</div>
	<div>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			// 처음에 댓글 전체 가져오기 호출
			getAllReplies();

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
							getAllReplies(); // 댓글가져오기
						}
					} // end ajax.success.function
				}); // end ajax
			}); // end btn_add.click

			// 게시판 댓글 전체 가져오기

			function getAllReplies() {
				var boardId = $('#boardId').val();
				var url = 'replies/all?boardId=' + boardId;
				$.getJSON( // 자동으로 JSON 데이터가 javaScript로 parsing됨
					url,
					function(data) {
						// 서버에서 온 data가 저장되어있음
						console.log(data);
						// 댓글 데이터를 HTML에 표현할 문자열 변수
						var replyList = '';
					
						// $(컬렉션).each() : 컬렉션 데이터를 반복문으로 꺼내는 함수
						$(data).each(function() {
							// this : 컬렉션의 한줄데이터를 의미
							console.log(this);
							// string 날짜를 다시 Date로 변환
							var replyDateCreated = new Date(this.replyDateCreated);
							// 댓글 한줄씩 반복문으로 생성
							replyList += '<div class="reply_item">'
								+ '<pre>'
								+ '<input type="hidden" id="replayId" value="' + this.replayId + '"/>'
								+ '<input type="hidden" id="memberId" value="' + this.memberId + '"/>'
								+ this.memberId
								+ '&nbsp;&nbsp;'
								+ '<input type="text" id="replyContent" value="' + this.replyContent + '" readonly/>'
								+ '&nbsp;&nbsp;'
								+ replyDateCreated
								+ '&nbsp;&nbsp;'
								+ '<button id="btn_update">수정</button>'
								+ '<button id="btn_delete">삭제</button>'
								+ '</pre>'
								+ '</div>';
						});
						$('#replies').html(replyList);
					}
				); // end getJSON
			} // end getAllReplies
			

		}); // end document
	</script>
</body>
</html>