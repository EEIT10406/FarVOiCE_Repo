package _00.init;

import java.util.Properties;

import javax.naming.NamingException;
import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jndi.JndiObjectFactoryBean;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import model.bean.ListMusicBean;
import model.bean.MusicBean;
import model.bean.PlaylistBean;
import model.bean.MemberBean;
import model.bean.PostBean;

@Configuration

@ComponentScan(basePackages="model")
@EnableTransactionManagement
public class RootAppConfig {
	@Bean
	public DataSource dataSource() {
		try {
			JndiObjectFactoryBean bean = new JndiObjectFactoryBean();
			bean.setJndiName("java:comp/env/jdbc/xxx");
			bean.setProxyInterface(DataSource.class);
			bean.afterPropertiesSet();
			return (DataSource) bean.getObject();
		} catch (IllegalArgumentException | NamingException e) {
			e.printStackTrace();
			throw new ExceptionInInitializerError(e);
		}
	}

	@Bean
	public SessionFactory sessionFactory() {
		LocalSessionFactoryBuilder builder = new LocalSessionFactoryBuilder(dataSource());

		builder.addAnnotatedClasses(MemberBean.class,PostBean.class,MusicBean.class,PlaylistBean.class,ListMusicBean.class);
		Properties props = new Properties();
		props.setProperty("hibernate.dialect", "org.hibernate.dialect.SQLServerDialect");
		props.setProperty("hibernate.show_sql", "true");
//		props.setProperty("hibernate.current_session_context_class", "thread");
		builder.addProperties(props);

		return builder.buildSessionFactory();
	}
	@Bean(name="transactionManager")
    @Autowired
    public HibernateTransactionManager transactionManager(SessionFactory sessionFactory) {
         HibernateTransactionManager txManager = new HibernateTransactionManager();
         txManager.setSessionFactory(sessionFactory);
         return txManager;
      }	
	
	private Properties additionalProperties()  {
		Properties properties=new Properties();
		properties.put("hibernate.dialect", org.hibernate.dialect.SQLServer2012Dialect.class);
		properties.put("hibernate.show_sql", Boolean.TRUE);
		properties.put("hibernate.format_sql", Boolean.TRUE);
		properties.put("default_batch_fetch_size", 10);
		properties.put("hibernate.hbm2ddl.auto", "update");
		return properties;
	}
}
