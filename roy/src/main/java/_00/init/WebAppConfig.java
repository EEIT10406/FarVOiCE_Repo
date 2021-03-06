package _00.init;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = { "controller" })
public class WebAppConfig implements WebMvcConfigurer {

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
//		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
//		viewResolver.setViewClass(JstlView.class);
//		viewResolver.setSuffix(".jsp");
//		return viewResolver;
//	}

//	@Override  原本抓靜態資源的設定但用了就抓不到404
//	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
//		configurer.enable();
//	}

	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/css/**").addResourceLocations("/css/");
		registry.addResourceHandler("/fonts/**").addResourceLocations("/fonts/");
		registry.addResourceHandler("/img/**").addResourceLocations("/img/");
		registry.addResourceHandler("/js/**").addResourceLocations("/js/");
	}

	@Bean
	public MultipartResolver multipartResolver() {
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
//		multipartResolver.setMaxUploadSize(5000000);
		return multipartResolver;
	}
//	@Override
//    public void addResourceHandlers(ResourceHandlerRegistry registry) {
//        registry
//          .addResourceHandler("/resources/png")
//          .addResourceLocations("/resources/"); 
//    }

}
