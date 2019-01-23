package model.bean;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "CustomerService")
public class CustomerServiceBean {

public Date getCustomerService_time() {
		return CustomerService_time;
	}

	public void setCustomerService_time(Date customerService_time) {
		CustomerService_time = customerService_time;
	}

@Override
public String toString() {
	return "CustomerServiceBean [CustomerService_id=" + CustomerService_id + ", CustomerService_email="
			+ CustomerService_email + ", CustomerService_title=" + CustomerService_title + ", CustomerService_content="
			+ CustomerService_content + ", CustomerService_time=" + CustomerService_time + ", CustomerService_fixed="
			+ CustomerService_fixed + ", CustomerService_fixedTime=" + CustomerService_fixedTime + "]";
}

	// CustomerService_id int identity primary key,
	//	CustomerService_email			varchar(100),
	//	CustomerService_title			varchar(300),
	//	CustomerService_content			varchar(500),
	//	CustomerService_time			datetime,
	//	CustomerService_fixed			bit,
	//	CustomerService_fixedTime		datetime
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer CustomerService_id;
	private String CustomerService_email;
	private String CustomerService_title;
	private String CustomerService_content;
	private Date   CustomerService_time;
	private Boolean CustomerService_fixed;
	private Date   CustomerService_fixedTime;

	public Integer getCustomerService_id() {
		return CustomerService_id;
	}

	public void setCustomerService_id(Integer customerService_id) {
		CustomerService_id = customerService_id;
	}

	public String getCustomerService_email() {
		return CustomerService_email;
	}

	public void setCustomerService_email(String customerService_email) {
		CustomerService_email = customerService_email;
	}

	public String getCustomerService_title() {
		return CustomerService_title;
	}

	public void setCustomerService_title(String customerService_title) {
		CustomerService_title = customerService_title;
	}

	public String getCustomerService_content() {
		return CustomerService_content;
	}

	public void setCustomerService_content(String customerService_content) {
		CustomerService_content = customerService_content;
	}

	public Boolean getCustomerService_fixed() {
		return CustomerService_fixed;
	}

	public void setCustomerService_fixed(Boolean customerService_fixed) {
		CustomerService_fixed = customerService_fixed;
	}

	public Date getCustomerService_fixedTime() {
		return CustomerService_fixedTime;
	}

	public void setCustomerService_fixedTime(Date customerService_fixedTime) {
		CustomerService_fixedTime = customerService_fixedTime;
	}

}
