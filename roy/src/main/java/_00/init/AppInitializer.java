package _00.init;

import javax.servlet.Filter;
import javax.servlet.ServletContext;
import javax.servlet.ServletRegistration;

import org.springframework.util.Assert;
import org.springframework.util.ObjectUtils;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.filter.HiddenHttpMethodFilter;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;
  
public class AppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {
    //宣告RootAppConfig.class就是spring的組態檔(取代web.xml的設定)
	@Override
	protected Class<?>[] getRootConfigClasses() {
		return new Class[]{RootAppConfig.class};
	}
   //宣告WebAppConfig.class就是spring MVC組態檔
	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class[]{WebAppConfig.class};
	}
   //如果沒有其他的dispatcherServlet有相關的url就用該"/"來處理
	@Override
	protected String[] getServletMappings() {
		return new String[]{"/"};
	}
	//春春
	protected Filter[] getServletFilters() {
		CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
		characterEncodingFilter.setEncoding("UTF-8");
		characterEncodingFilter.setForceEncoding(true);
		//可以拿到其他隱藏方法，本來只有get&post，用這可以拿到delete等其他方法
		HiddenHttpMethodFilter  hiddenHttpMethodFilter = new HiddenHttpMethodFilter();
		return new Filter[] {characterEncodingFilter, hiddenHttpMethodFilter};
	}
	//如果有例外會丟到NoHandleFoundController,裡面有設@ExceptionHandler
	@Override
	protected void customizeRegistration(ServletRegistration.Dynamic registration) {
	    boolean done = registration.setInitParameter("throwExceptionIfNoHandlerFound", "true"); // -> true
	    if(!done) throw new RuntimeException();
	}
}
