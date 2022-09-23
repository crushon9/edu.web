package edu.web.member;

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

@WebFilter("/HomepageFilter")
public class HomepageFilter extends HttpFilter implements Filter {
    public HomepageFilter() {
    }
    // init() : 필터가 시작할 때 호출
    public void init(FilterConfig fConfig) throws ServletException {
    }
    // destroy() : 필터가 종료 될 때 호출
	public void destroy() {
	}
	// doFilter() : 필터를 사용할 때 마다 호출
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// 클라이언트로부터 IP 얻기
		String ipAddress = request.getRemoteAddr();
		System.out.println("IP : " + ipAddress + " , Time : " + new Date().toString());
		// 한글깨짐필터
		request.setCharacterEncoding("UTF-8");
		chain.doFilter(request, response);
	}
}
