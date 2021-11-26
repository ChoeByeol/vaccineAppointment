package ncv.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebFilter(urlPatterns = {
		"*.jsp", "*.txt" //jsp, Servlet전체
})
public class EncodingFilter implements Filter {
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		//추가할 작업을 코드로 구현(간섭)
		HttpServletRequest req =  (HttpServletRequest)request;
		req.setCharacterEncoding("UTF-8");
		
		chain.doFilter(request, response);//모든 요청 통과
		
		
	}
}