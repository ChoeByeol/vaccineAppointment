package ncv.beans;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class SHA256 {
	//솔팅이랑 키스트레칭은 안했음...
	public static String encrypt(String memberPw) throws NoSuchAlgorithmException {
	    MessageDigest md = MessageDigest.getInstance("SHA-256");
	    md.update(memberPw.getBytes());
	    StringBuilder sb = new StringBuilder();
	    
	    for (byte b: md.digest()) {
	    	sb.append(String.format("%02x", b));
	    }
	    return sb.toString();
	}
}
