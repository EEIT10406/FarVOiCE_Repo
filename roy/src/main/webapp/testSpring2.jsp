<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ page import="org.springframework.web.context.WebApplicationContext"%>
	<%@ page import="org.springframework.context.ApplicationContext"%>
	<%@ page import="javax.sql.DataSource"%>
	<%@ page import="java.sql.*"%>
	<%
		ApplicationContext context = (ApplicationContext) application
				.getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);

		// DataSource dataSource = (DataSource) context.getBean("dataSource");
		// Connection conn = dataSource.getConnection();
		// Statement stmt = conn.createStatement();
		// ResultSet rset = stmt.executeQuery("select * from dept");
		// while(rset.next()) {
		// 	String col1 = rset.getString(1);
		// 	String col2 = rset.getString(2);
		// 	out.println("<h3>"+col1+", "+col2+"</h3>");
		// }
		// rset.close();
		// stmt.close();
		// conn.close();
	%>

	<%@ page import="org.hibernate.SessionFactory"%>
	<%@ page import="java.util.List"%>
	<%
		// SessionFactory sessionFactory = (SessionFactory) context.getBean("sessionFactory");
		// sessionFactory.getCurrentSession().beginTransaction();
		// List<ProductBean> products = 
		// 	sessionFactory.getCurrentSession().createQuery("from ProductBean", ProductBean.class).list();
		// out.println("<h3>products="+products+"</h3>");
		// sessionFactory.getCurrentSession().getTransaction().commit();
	%>
	<%@ page import="model.service.ReportService"%>
	<%@ page import="model.bean.ReportBean"%>
	<%@ page import="model.service.StoryService"%>
	<%@ page import="model.bean.StoryBean"%>
	<form:form modelAttribute="reportBean" action="report.create">
		<Table>
			<TR>
				<TD align="RIGHT">report_id：</TD>
				<TD align="LEFT"><form:input path="report_id" size="30" /> <font
					color='red' size='-3'></font></TD>
			</TR>
			<TR>
				<TD align="RIGHT">member_usernameReportS：</TD>
				<TD align="LEFT"><form:input path="member_usernameReportS"
						size="30" /> <font color='red' size='-3'></font></TD>
			</TR>

			<TR>
				<TD align="RIGHT">member_usernameReportM：</TD>
				<TD align="LEFT"><form:input path="member_usernameReportM" />
					<font color='red' size='-3'></font></TD>
			</TR>
			<TR>
				<TD align="RIGHT">music_idReportM：</TD>
				<TD align="LEFT"><form:input path="music_idReportM" /> <font
					color='red' size='-3'></font></TD>
			</TR>
			<TR>
				<TD align="RIGHT">report_time：</TD>
				<TD align="LEFT"><form:input path="report_time" /> <font
					color='red' size='-3'></font></TD>
			</TR>
			<TR>
				<TD colspan="2" align="center"><input type='submit'></TD>
			</TR>
		</Table>
	</form:form>
</body>
</html>
