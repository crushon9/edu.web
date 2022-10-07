<%@page import="edu.web.board.domain.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<form action="delete.do" method="post" style="display: inline;">
		<input type="hidden" name="boardId" value="${vo.boardId }">
		<input type="submit" value="글 삭제">
	</form>
	<hr>
	
	<!-- 댓글을 가져오기 위해 boardId 와 memberId를 hidden으로 둠 -->
	<input type="hidden" id="boardId" value="${vo.boardId }">
	<!-- memberId 세션이 없다면 -->
	<c:if test="${empty sessionScope.memberId }">
		*댓글은 로그인이 필요한 서비스 입니다
		<a href="login.go?targetURL=detail.do?boardId=${vo.boardId }">로그인</a>
	</c:if>
	<!-- memberId 세션이 있다면 -->
	<c:if test="${not empty sessionScope.memberId }">
		<div style="text-align: center;">
			${sessionScope.memberId }님, 댓글 작성 가능합니다	
			<input type="hidden" id="memberId" value="${sessionScope.memberId }">
			<input type="text" id="replyContent">
			<button id="btn_add">작성</button>
		</div>
	</c:if>
	
	<hr>
	<!-- 댓글을 출력할 div공간 마련 -->
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
							// 성공하면 댓글 가져오기
							getAllReplies();
						}
					} // end ajax.success.function
				}); // end ajax
			}); // end btn_add.click

			// 게시판 댓글 전체 가져오기
			function getAllReplies() {
				var boardId = $('#boardId').val();
				var memberId = $('#memberId').val();
				console.log(memberId);
				var url = 'replies/all?boardId=' + boardId;
				$.getJSON( // 자동으로 JSON 데이터가 javaScript로 parsing됨
					url,
					function(data) {
						// 서버에서 온 data가 저장되어있음
						console.log(data);
						// 댓글 데이터를 HTML에 표현할 문자열 변수
						var replyList = '';
					
						// $(컬렉션).each() : 컬렉션 데이터를 반복문으로 꺼내는 함수
						// 댓글 한줄씩 반복문으로 생성
						$(data).each(function() {
							// this : data 컬렉션의 한줄 데이터를 의미
							console.log(this);
							// string 날짜를 다시 Date로 변환
							var replyDateCreated = new Date(this.replyDateCreated);
							replyList += '<div class="reply_item">' // 여러개가 생성될거니깐 class를 부여했고, 댓글 한줄마다 호출시 구분해주는 역할
								+ '<pre>'
								// <pre> 태그로 감싼 문장은 입력한 문장 형태 그대로 브라우저에 표현할 수 있습니다.
								// 예를 들어 엔터(Enter), 탭(Tab), 스페이스바(Space) 는 pre 를 사용하지 않았을 때 무조건 공백 하나로 인식합니다.
								// 하지만 pre 를 사용하게 되면 HTML 형태 그대로 유지가 가능합니다.
								+ '<input type="hidden" class="replyId" value="' + this.replyId + '"/>'
								+ '<input type="hidden" class="memberId" value="' + this.memberId + '"/>'
								+ this.memberId // getJSON으로 받아온 data에 저장된 memberId 의미
								+ '&nbsp;&nbsp;'
								+ '<input type="text" class="replyContent" value="' + this.replyContent + '" readonly/>'
								+ '&nbsp;&nbsp;'
								+ replyDateCreated
								+ '&nbsp;&nbsp;';
								if (memberId == this.memberId) {
									replyList += '<button class="btn_update">수정</button>'
									+ '<button class="btn_delete">삭제</button>';
								} else {
									replyList += '<button class="btn_update" disabled>수정</button>'
									+ '<button class="btn_delete" disabled>삭제</button>';
								}
							replyList += '</pre>'
								+ '</div>';
								console.log(replyList);
						}); // end data.each
						$('#replies').html(replyList); // 반복문으로 생성된 html태그 출력
					}
				); // end getJSON
			} // end getAllReplies
			
			// 수정 버튼을 클릭하면 댓글 수정
			$('#replies').on('click', '.reply_item .btn_update', function(){
				var isReadOnly = $(this).prevAll('.replyContent').prop('readonly');
				if (isReadOnly == true) { // readonly가 true면
					// readonly 속성제거 후 버튼 변경
					$(this).prevAll('.replyContent').removeAttr('readonly');
					$(this).prevAll('.replyContent').css({"border-color":"red"});
					$(this).text("수정확인");
					$(this).nextAll('.btn_delete').hide();
				} else { // 아니라면 댓글 수정
					console.log(this); // this : 선택된 btn_update
					// 선택된 댓글의 replyId, replyContent 값을 저장
					// prevAll() : 선택된 노드 이전에 위치해 있는 모든 형제 노드를 접근
					var replyId = $(this).prevAll('.replyId').val();
					var replyContent = $(this).prevAll('.replyContent').val();
					console.log("replyId : " + replyId + ", replyContent : " + replyContent);
					// ajax로 서버로 데이터 전송
					$.ajax({
						type : 'POST',
						url : 'replies/update',
						data : {
							'replyId' : replyId,
							'replyContent' : replyContent
						},
						success : function(result) {
							console.log("댓글수정결과" + result);
							getAllReplies();
						}
					});
				}
			}); // end replies.on.btn_update
			
			// 삭제 버튼을 클릭하면 선택된 댓글 삭제
			$('#replies').on('click', '.reply_item .btn_delete', function(){
				console.log(this);
				var replyId = $(this).prevAll('.replyId').val();
				console.log("replyId : " + replyId);
				$.ajax({
					type : 'POST',
					url : 'replies/delete',
					data : {
						'replyId' : replyId,
					},
					success : function(result) {
						console.log(result);
						getAllReplies();
					}
				});
			}); // end replies.on.btn_delete
			

		}); // end document
	</script>
</body>
</html>