package _00.init;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Enumeration;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.MemberBean;
@WebFilter(
		urlPatterns = { "/*" }, 
		initParams = { 
				@WebInitParam(name = "mustLogin1", value = "/personalPage/*"),				
				@WebInitParam(name = "mustLogin2", value = "/rankTop10/ShareMusic.controller"),				
				@WebInitParam(name = "mustLogin3", value = "/login-signUp-upload/upload.jsp"),				
				@WebInitParam(name = "mustLogin4", value = "/personalPage/personalPage.jsp"),				
				@WebInitParam(name = "mustLogin5", value = "/personalPage/personalDetail.jsp"),			
				@WebInitParam(name = "mustLogin6", value = "/funding/startProject.jsp"),				
				@WebInitParam(name = "mustLogin7", value = "/funding/showMusic.controller"),			
				@WebInitParam(name = "mustLogin8", value = "/funding/turnToDonatePage.controller"),		

		})
public class LoginCheckingFilter implements Filter {
	Collection<String> url = new ArrayList<String>();
	String servletPath;
	String contextPath;
	String requestURI;
	public void init(FilterConfig fConfig) throws ServletException {
		Enumeration<String> e = fConfig.getInitParameterNames();
		while (e.hasMoreElements()) {
			String path = e.nextElement();
			url.add(fConfig.getInitParameter(path));
		}
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		boolean isRequestedSessionIdValid = false;
		if (request instanceof HttpServletRequest
				&& response instanceof HttpServletResponse) {
			HttpServletRequest req = (HttpServletRequest) request;
			HttpServletResponse resp = (HttpServletResponse) response;
			servletPath = req.getServletPath();  
			contextPath = req.getContextPath();
			requestURI  = req.getRequestURI();
			isRequestedSessionIdValid = req.isRequestedSessionIdValid();
			
			if (mustLogin()) {           
				if (checkLogin(req)) {   
					//  需要登入，但已經登入
					System.out.println("需要登入，但已經登入");
					System.out.println("------------------");
					chain.doFilter(request, response);
				} else {	
					System.out.println("需要登入，尚未登入");
					System.out.println("------------------");
					//  需要登入，尚未登入，所以送回登入畫面
					HttpSession session = req.getSession();
				    // 記住原本的"requestURI"，稍後如果登入成功，系統可以自動轉入
					// 原本要執行的程式。
					System.out.println("放requestURI"+requestURI);
					if(!requestURI.endsWith("jsp")) {
						if(requestURI.endsWith("turnToDonatePage.controller")) {
//							requestURI="/roy/funding/fundingDetail.jsp";
							requestURI="/roy/funding/allFunding.jsp";
						} else {
							requestURI = "/roy/homePage/index.jsp" ;
						}
					}
					session.setAttribute("requestURI", requestURI);
					if ( ! isRequestedSessionIdValid ) {
						System.out.println("使用逾時，請重新登入");
						session.setAttribute("timeOut", "使用逾時，請重新登入");
					}
					resp.sendRedirect(contextPath + "/login-signUp-upload/login.jsp");
					return;
				}
			} else {   //不需要登入，直接去執行他要執行的程式
			
				chain.doFilter(request, response);
				
			}
		} else {
			throw new ServletException("Request/Response 型態錯誤(極不可能發生)");
		}
	}
	private boolean checkLogin(HttpServletRequest req) {
		HttpSession session = req.getSession();
		Object o = (Object) session.getAttribute("user");
		if(o instanceof MemberBean) {
			MemberBean loginToken = (MemberBean) o;
			if (loginToken != null) {
				return true;
			} 
		}
			return false;
	}

	private boolean mustLogin() {
		boolean login = false;
		// 如果ServletPath是某一個必須登入才能使用之功能之的路徑開頭，
		// 那就必須登入
		for (String sURL : url) {
			if (sURL.endsWith("*")) {
				sURL = sURL.substring(0, sURL.length() - 1);
				if (servletPath.startsWith(sURL)) {
					login = true;
					break;
				}
			} else {
				if (servletPath.equals(sURL)) {
					login = true;
					break;
				}
			}
		}
		return login;
	}
	@Override
	public void destroy() {
	}
}