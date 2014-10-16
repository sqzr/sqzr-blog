package filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by weiyang on 2014/10/16.
 */
public class JspAccessFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest httpReq = (HttpServletRequest) servletRequest;
        String Url = httpReq.getRequestURI();
        if (Url.endsWith(".jsp")) {
            HttpServletResponse httpRes = (HttpServletResponse) servletResponse;
            httpRes.sendRedirect(httpReq.getContextPath() + "/");
        } else {
            filterChain.doFilter(servletRequest, servletResponse);
        }
    }

    @Override
    public void destroy() {

    }
}
