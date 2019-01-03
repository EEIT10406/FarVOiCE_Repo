package model.bean;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Reward")
public class RewardBean {
@Override
	public String toString() {
		return "RewardBean [reward_id=" + reward_id + ", funding_id=" + funding_id + ", reward_amount=" + reward_amount
				+ ", reward_description=" + reward_description + ", reward_estimatedDelivery="
				+ reward_estimatedDelivery + "]";
	}
	/*	reward_id          int		primary key,
	funding_id         int      REFERENCES Funding (funding_id),
	reward_amount      int,--單筆達標金額(由發起人自訂)
	reward_description varchar(100),
	reward_estimatedDelivery datetime--(估計交貨日期)
*/	
	@Id
	private Integer reward_id;
	private Integer funding_id;
	private Integer reward_amount;
	private String reward_description;
	private java.util.Date reward_estimatedDelivery;
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
	public java.util.Date getReward_estimatedDelivery() {
		return reward_estimatedDelivery;
	}
	public void setReward_estimatedDelivery(java.util.Date reward_estimatedDelivery) {
		this.reward_estimatedDelivery = reward_estimatedDelivery;
	}
	
}
