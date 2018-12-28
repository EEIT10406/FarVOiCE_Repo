package _00.init;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = { "_01", "_02" })
public class WebAppConfig implements WebMvcConfigurer{

	@Autowired
	ServletContext context;

//	@Override
	// 本方法會自動產生一個ContentNegotiationManager
//	public void configureContentNegotiation(ContentNegotiationConfigurer configurer) {
		// 如果Spring無法由延伸檔名、請求標頭判斷出使用者要求的沒有型態，
		// 就使用MediaType.APPLICATION_JSON為預設型態。
		// configurer.ignoreAcceptHeader(true).defaultContentType(MediaType.TEXT_HTML);
//		configurer.defaultContentType(MediaType.APPLICATION_JSON);
//	}
	// 配置 Spring提供的 InternalResourceViewResolver
//	@Bean
//	public ViewResolver jspViewResolver() {
//		System.out.println("jspViewResolver");
//		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
//		viewResolver.setViewClass(JstlView.class);
//		viewResolver.setPrefix("/WEB-INF/views/");
//		viewResolver.setSuffix(".jsp");
//		return viewResolver;
//	}
	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
	}
//	@Override
//    public void addResourceHandlers(ResourceHandlerRegistry registry) {
//        registry
//          .addResourceHandler("/resources/png")
//          .addResourceLocations("/resources/"); 
//    }

}
