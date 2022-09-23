<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드</title>
</head>
<body>
	<!-- 
	* 파일 업로드 구현 순서
	1. web.xml에 <context-param>을 설정
	2. commons-fileupload-x.x.jar을 다운로드 및 WEB-INF/lib 폴더에 저장
	3. commons-io-x.x.jar을 다운로드 및 WEB-INF/lib 폴더에 저장
		(WEB-INF : 라이브러리 또는 프로젝트 관련 설정을 저장하는 폴더, 서버가동시 외부에서 접근불가)
	4. c:\tmp 와 C:\server\apache-tomcat-9.0.65\webapps\data 폴더 두개를 생성
 -->

	<h2>파일 업로드</h2>
	<p>파일 선택 : </p>
	<form action="16_uploadfile.jsp" method="post" enctype="multipart/form-data">
		<input type="text" name="name"><br>
		<input type="file" name="files" size="1000" multiple="multiple"><br>
		<input type="submit" value="파일 업로드"><br>
	</form>


</body>
</html>