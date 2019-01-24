package model.bean;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Reward")
public class RewardBean {
	@Override
	public String toString() {
		return "RewardBean [reward_id=" + reward_id + ", funding_id=" + funding_id + ", reward_amount=" + reward_amount
				+ ", reward_description=" + reward_description + ",reward_image=" + reward_image
				+ ",reward_estimatedYear=" + reward_estimatedYear + ", reward_estimatedMonth=" + reward_estimatedMonth
				+ ",reward_donateCount=" + reward_donateCount + "]";
	}

	/*
	 * reward_id int primary key, funding_id int REFERENCES Funding (funding_id),
	 * reward_amount int,--單筆達標金額(由發起人自訂) reward_description varchar(100),
	 * reward_estimatedDelivery datetime--(估計交貨日期)
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer reward_id;
	private Integer funding_id;
	private Integer reward_amount;
	private String reward_description;
	private String reward_image;
	private String reward_estimatedYear;
	private String reward_estimatedMonth;
	private Integer reward_donateCount;

	public Integer getReward_id() {
		return reward_id;
	}

	public void setReward_id(Integer reward_id) {
		this.reward_id = reward_id;
	}

	public Integer getFunding_id() {
		return funding_id;
	}

	public void setFunding_id(Integer funding_id) {
		this.funding_id = funding_id;
	}

	public Integer getReward_amount() {
		return reward_amount;
	}

	public void setReward_amount(Integer reward_amount) {
		this.reward_amount = reward_amount;
	}

	public String getReward_description() {
		return reward_description;
	}

	public void setReward_description(String reward_description) {
		this.reward_description = reward_description;
	}

	public String getReward_image() {
		return reward_image;
	}

	public void setReward_image(String reward_image) {
		this.reward_image = reward_image;
	}

	public String getReward_estimatedYear() {
		return reward_estimatedYear;
	}

	public void setReward_estimatedYear(String reward_estimatedYear) {
		this.reward_estimatedYear = reward_estimatedYear;
	}

	public String getReward_estimatedMonth() {
		return reward_estimatedMonth;
	}

	public void setReward_estimatedMonth(String reward_estimatedMonth) {
		this.reward_estimatedMonth = reward_estimatedMonth;
	}

	public Integer getReward_donateCount() {
		return reward_donateCount;
	}

	public void setReward_donateCount(Integer reward_donateCount) {
		this.reward_donateCount = reward_donateCount;
	}

}
