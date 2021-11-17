package ncv.beans;

import java.sql.Date;

public class MemberDto {

    private String memberId;
    private String memberPw;
    private String memberName;
    private String memberRrn;
    private String memberGender;
    private String memberAddress;
    private String memberPhone;
    private Date memberJoin;
    private String memberRole;
    private String memberDetailAddress;
    private String memberPostcode;

    public MemberDto() {
        super();
    }
    public String getMemberDetailAddress() {
		return memberDetailAddress;
	}
	public void setMemberDetailAddress(String memberDetailAddress) {
		this.memberDetailAddress = memberDetailAddress;
	} 
	public String getMemberPostcode() {
		return memberPostcode;
	}
	public void setMemberPostcode(String memberPostcode) {
		this.memberPostcode = memberPostcode;
	}
	public String getMemberId() {
        return memberId;
    }
    public void setMemberId(String memberId) {
        this.memberId = memberId;
    }
    public String getMemberPw() {
        return memberPw;
    }
    public void setMemberPw(String memberPw) {
        this.memberPw = memberPw;
    }
    public String getMemberPw2() {
        return memberPw;
    }
    public void setMemberPw2(String memberPw) {
        this.memberPw = memberPw;
    }
    public String getMemberName() {
        return memberName;
    }
    public void setMemberName(String memberName) {
        this.memberName = memberName;
    }
    public String getMemberRrn() {
        return memberRrn;
    }
    public void setMemberRrn(String memberRrn) {
        this.memberRrn = memberRrn;
    }
    public String getMemberGender() {
        return memberGender;
    }
    public void setMemberGender(String memberGender) {
        this.memberGender = memberGender;
    }
    public String getMemberAddress() {
        return memberAddress;
    }
    public void setMemberAddress(String memberAddress) {
        this.memberAddress = memberAddress;
    }
    public String getMemberPhone() {
        return memberPhone;
    }
    public void setMemberPhone(String memberPhone) {
        this.memberPhone = memberPhone;
    }
    public Date getMemberJoin() {
        return memberJoin;
    }
    public void setMemberJoin(Date memberJoin) {
        this.memberJoin = memberJoin;
    }
    public String getMemberRole() {
        return memberRole;
    }
    public void setMemberRole(String memberRole) {
        this.memberRole = memberRole;
    }

}
