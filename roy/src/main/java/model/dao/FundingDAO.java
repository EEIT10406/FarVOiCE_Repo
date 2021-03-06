package model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.bean.FundingBean;

@Repository
public class FundingDAO {
	// Spring MVC
	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return this.sessionFactory.getCurrentSession();
	}
//	public void setSessionFactory(SessionFactory sessionFactory) {
//		this.sessionFactory = sessionFactory;
//	}

//	public static void main(String... args) throws IOException, Exception, SQLException {
//		SessionFactory sessionFactory = HibernateUtil.getSessionfactory();
//		Session session = sessionFactory.openSession();
//		Transaction tx = session.beginTransaction();
//		FundingDAO fundingDAO = new FundingDAO();
//		fundingDAO.setSession(session);
//		//findByPk
//		FundingBean bean0 = fundingDAO.findByPrimaryKey(1);
//		System.out.println(bean0);		
//		
//		//findAll
//		List<FundingBean> beans = fundingDAO.findAll();
//		for(FundingBean bean1:beans) {
//			System.out.println(bean1);
//		}
//		
//		//create
//		FundingBean bean2 = new FundingBean();
//		bean2.setFunding_id(3);
//		bean2.setMember_username("Jack");
//		java.util.Date date = java.sql.Date.valueOf("2019-01-03");
//		bean2.setFunding_city("花蓮市");
//		bean2.setFunding_browseCount(15);
//		bean2.setFunding_createTime(date);
//		bean2.setFunding_currentAmount(0);
//		bean2.setFunding_description("哈囉我們是來自山上的紅葉合唱團，希望大家幫幫忙斗點資金");
//		bean2.setFunding_duration(200);
//		bean2.setFunding_goal(50000);
//		File fileIn = new File("C:/Users/User/Desktop/FarVoice/Cutekirby.jpg");
//		int length = (int)fileIn.length();
//		byte[] fileInByteArray = new byte[length];
//		Blob blob = null;;
//		FileInputStream fis = new FileInputStream(fileIn);
//		fis.read(fileInByteArray);
//		blob = new SerialBlob(fileInByteArray);
//		fis.close();
//		bean2.setFunding_image(blob);
//		bean2.setFunding_title("紅葉合唱團籌募資金");
//		FundingBean beanResult = fundingDAO.create(bean2);
//		System.out.println(beanResult);

//		//update
//		FundingBean bean3 = new FundingBean();
//		int updateInt = 3;
//		bean3.setFunding_id(updateInt);
//		bean3.setMember_username("Marry");
//		fundingDAO.update(bean3);
//		FundingBean updateTempBean = fundingDAO.findByPrimaryKey(updateInt);
//		System.out.println(updateTempBean);

//		//remove
//		boolean  remove = fundingDAO.remove(3);
//		System.out.println(remove);

//		
//		tx.commit();
//		session.close();
//		HibernateUtil.closeSessionFactory();
//	}

//	private Session session;
//	public void setSession(Session session) {
//		this.session = session;
//	}
//
//	public Session getSession() {
//		return session;
//	}
//找出審核通過並以募資金額做排序的熱門專案
	public List<FundingBean> findByPassOrderByMoney() {
		return this.getSession()
				.createQuery("from FundingBean where funding_status=1 order by funding_currentAmount desc",
						FundingBean.class)
				.setMaxResults(5).list();
	}

//找出使用者所有的募資專案
	public List<FundingBean> findByUsername(String member_username) {

		return this.getSession()
				.createQuery("from FundingBean where member_username='" + member_username + "'", FundingBean.class)
				.list();
	}

	// 找出該使用者通過審核的專案
	public List<FundingBean> findProjectByUsernamePass(String member_username) {

		return this.getSession()
				.createQuery(
						"from FundingBean where member_username='" + member_username + "'" + "and funding_status=1",
						FundingBean.class)
				.list();
	}

//找出專案byFundingId
	public FundingBean findByPrimaryKey(Integer funding_id) {
		// 0103 OK
		return this.getSession().get(FundingBean.class, funding_id);
	}

//找出全部專案
	public List<FundingBean> findAll() {
		// 0103 OK
		return this.getSession().createQuery("from FundingBean", FundingBean.class).setMaxResults(50).list();
	}

//找出審核過的專案
	public List<FundingBean> findAllByPass() {
		return this.getSession().createQuery("from FundingBean where funding_status=1", FundingBean.class)
				.setMaxResults(50).list();
	}

//創一個專案
	public FundingBean create(FundingBean bean) {
		// 0103 OK
//		if(bean!=null) {
//			FundingBean result = this.getSession().get(FundingBean.class, bean.getFunding_id());
//			if(result==null) {
		this.getSession().save(bean);
		return bean;
//			}
//		}
//		return null;
	}

//更新一筆專案
	public void update(FundingBean bean) {
		// 0103 OK
		getSession().clear();
		getSession().update(bean);
	}

//刪除一筆專案byF_IdId
	public boolean remove(Integer funding_id) {
		// 0103 OK
		FundingBean result = this.getSession().get(FundingBean.class, funding_id);
		if (result != null) {
			this.getSession().delete(result);
			return true;
		}
		return false;
	}
}
