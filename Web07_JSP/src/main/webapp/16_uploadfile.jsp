<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
String realPath = "";
String savePath = "images";
int maxSize = 10 * 1024 * 1024;
// 현재 어플리케이션 정보 저장
ServletContext context = request.getServletContext();
// 서버 URL의 실제 경로
realPath = context.getRealPath(savePath);

out.print(realPath + "<br>");

try {
	DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
	diskFileItemFactory.setRepository(new File(realPath));
	diskFileItemFactory.setSizeThreshold(maxSize);
	diskFileItemFactory.setDefaultCharset("UTF-8");
	
	// 업로드 핸들러
	ServletFileUpload fileUpload = new ServletFileUpload(diskFileItemFactory);
	// request 정보를 가져와서 upload 형태에 맞게 파싱
	List<FileItem> items = fileUpload.parseRequest(request);
	for (FileItem item : items) {
		if (item.isFormField()) { // 일반 파라미터인지 여부를 반환
			out.print(item.getString() + "<br>");
		} else { // 일반 파라미터가 아니라면 (파일이라면)
			out.print("파일명 : " + item.getName() + ", 파일크기 : " + item.getSize() + "<br>");
			if (item.getSize() > 0) {
				String separator = File.separator;
				int index = item.getName().lastIndexOf(separator);
				String fileName = item.getName().substring(index + 1);
				File uploadFile = new File(realPath + separator + fileName);
				// 받은파일을 서버에 업로드
				item.write(uploadFile);
				out.print(uploadFile);
				
				// 다른 jsp에서 이미지를 보기
				response.sendRedirect("/Web07_JSP/16_image_view.jsp");
				session.setAttribute("fileName", fileName);
			}
		}
	}
} catch (Exception e) {

}
%>

