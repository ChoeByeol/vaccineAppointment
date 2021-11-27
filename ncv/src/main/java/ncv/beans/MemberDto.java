package ncv.beans;

import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class MemberDto {

    private String memberId;
    private String memberPw;
    private String memberName;
    private String memberRrn;
    private String memberGender;
    private String memberPostcode;
    private String memberAddress;
    private String memberDetailAddress;
    private String memberPhone;
    private Date memberJoin;
    private String memberRole;


	public String getMemberRrn() {
		return memberRrn;
	}
	public void setMemberRrn(String memberRrn) {
		this.memberRrn = memberRrn;
	}
	public MemberDto() {
        super();
    }
    public String getMemberDetailAddress() {
		if(memberDetailAddress == null) {
			return "";
		}
		else {
			return memberDetailAddress;
		}
	}
	public void setMemberDetailAddress(String memberDetailAddress) {
		this.memberDetailAddress = memberDetailAddress;
	} 
	public String getMemberPostcode() {
		if(memberPostcode == null) {
			return "";
		}
		else {
			return memberPostcode;
		}
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
		if(memberAddress == null) {
			return "";
		}
		else {
			return memberAddress;
		}
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
    //만 나이 계산
    public int getAge() {
    	String memberRrn = this.memberRrn;
    	//오늘 날짜
    	LocalDate now = LocalDate.now();

    	//7번째 자리가 3이상이면 2000년대생 (1800년대는 안함)
    	boolean isOver2000 = memberRrn.charAt(6)-'0' >= 3;
    	String birth;
    	if(isOver2000) {
    		birth = "20" + memberRrn.substring(0,6);
    	}
    	else {
    		birth = "19" + memberRrn.substring(0,6);
    	}

    //문자열을 날짜로 바꿔줌
    LocalDate newDate = LocalDate.parse(birth, DateTimeFormatter.BASIC_ISO_DATE);

    // 만나이 계산
    // 1. 연도만 뽑아서 계산
    int age = now.getYear() - newDate.getYear();

    // 2. 월과 일 계산
    // 생일이 안지났으면 -1
    // 생일의 년도를 오늘의 년도로 바꿔서 계산
    // true면 지난거 false면 안지난거
        boolean isOverBirth = now.isAfter(newDate.plusYears(age));
        if (!isOverBirth) {
            age--;
        }

        return age;
    	}
    
    //주민번호에 하이픈보이게
    public String getHyphenRrn() {
    	return this.memberRrn.substring(0, 6) + "-" + this.memberRrn.substring(6, 13);
    }
    
    //전화번호에 하이픈보이게
    public String getHyphenPhone() {
    	return this.memberPhone.substring(0, 3) + "-" + this.memberPhone.substring(3, 7) + "-" + this.memberPhone.substring(7, 11);
    }
}