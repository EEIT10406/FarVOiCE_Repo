package model.Bean.primarykey;

import java.io.Serializable;
import java.util.Objects;

public class FollowId implements Serializable{
 
	@Override
	public int hashCode() {
		return Objects.hash(getMember_usernameS(), getMember_usernameM());
	}

	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (!(o instanceof FollowId))
			return false;
		FollowId that = (FollowId) o;
		return Objects.equals(getMember_usernameS(), that.getMember_usernameS())
				&& Objects.equals(getMember_usernameM(), that.getMember_usernameM());
	}

	private String member_usernameS;
	private String member_usernameM;

	public String getMember_usernameS() {
		return member_usernameS;
	}

	public void setMember_usernameS(String member_usernameS) {
		this.member_usernameS = member_usernameS;
	}

	public String getMember_usernameM() {
		return member_usernameM;
	}

	public void setMember_usernameM(String member_usernameM) {
		this.member_usernameM = member_usernameM;
	}
}
