package model.Bean.primarykey;

import java.util.Objects;

public class MemberLikeMusicId {
	@Override
	public int hashCode() {
		return Objects.hash(getMember_username(), getMusic_id());
	}

	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (!(o instanceof FollowId))
			return false;
		MemberLikeMusicId that = (MemberLikeMusicId) o;
		return Objects.equals(getMember_username(), that.getMember_username())
				&& Objects.equals(getMusic_id(), that.getMusic_id());
	}

	private String member_username;
	private Integer music_id;
	
	public String getMember_username() {
		return member_username;
	}

	public void setMember_username(String member_username) {
		this.member_username = member_username;
	}

	public Integer getMusic_id() {
		return music_id;
	}

	public void setMusic_id(Integer music_id) {
		this.music_id = music_id;
	}


}
