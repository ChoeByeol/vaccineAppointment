package ncv.beans;

public class TemporaryPassword {

	private static final int SIZE = 10; //자리수
	
	//임시비밀번호 생성
	public static String create() {
	   char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 
				   'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 
				   'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 
				   'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 
				   'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 
				   'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x',
				   'y', 'z' }; 
	   StringBuffer sb = new StringBuffer(); 
	   int index = 0; 
	   int length = charSet.length; 
	   for (int i=0; i<SIZE; i++) {
		   index = (int) (Math.random()*length); 
		   sb.append(charSet[index]);
		   }
	   
	   return sb.toString();
	}
}