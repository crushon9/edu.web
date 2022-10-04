package edu.web.board.util;

import java.io.IOException;
import java.util.Date;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;

// 필터를 여러개 만들고
// 적용경로를 세분화하여 페이지오류, 세션만료 등을 처리할 수도 있겠네?
@WebFilter("/CharFilter")
public class CharFilter extends HttpFilter implements Filter {
	public CharFilter() {
	}

	// init() : 필터가 시작할 때 호출
	public void init(FilterConfig fConfig) throws ServletException {
	}

	// doFilter() : 필터를 사용할 때 마다 호출
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// 클라이언트로부터 IP 얻기
		String ipAddress = request.getRemoteAddr();
		System.out.println("IP : " + ipAddress + " , Time : " + new Date().toString());
		// 한글깨짐필터
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		chain.doFilter(request, response);
	}

	// destroy() : 필터가 종료 될 때 호출
	public void destroy() {
	}
}
