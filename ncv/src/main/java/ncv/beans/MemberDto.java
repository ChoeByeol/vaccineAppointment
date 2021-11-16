package ncv.beans;

import java.sql.Date;

public class MemberDto {

    private String memberId;
    private String memberPw;
    private String memberName;
    private String memberFrontRrn;
    private String memberGender;
    private String memberAddress;
    private String memberPhone;
    private Date memberJoin;
    private String memberRole;
    private String memberDetailAddress;
    private String memberPostcode;
    private String memberBackRrn;

    public String getMemberFrontRrn() {
		return memberFrontRrn;
	}
	public void setMemberFrontRrn(String memberFrontRrn) {
		this.memberFrontRrn = memberFrontRrn;
	}
	public String getMemberBackRrn() {
		return memberBackRrn;
	}
	public void setMemberBackRrn(String memberBackRrn) {
		this.memberBackRrn = memberBackRrn;
	}
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
    public String getMemberName() {
        return memberName;
    }
    public void setMemberName(String memberName) {
        this.memberName = memberName;
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
