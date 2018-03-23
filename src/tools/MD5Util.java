package tools;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5Util {
	public static String makeMD5(String plainText) {  
        try {  
            MessageDigest md = MessageDigest.getInstance("MD5");  
            md.update(plainText.getBytes());  
           byte b[] = md.digest();  
           int i;  
           StringBuffer buf = new StringBuffer("");  
           for (int offset = 0; offset < b.length; offset++) {  
               i = b[offset];  
               if (i < 0)  
                   i += 256;  
               if (i < 16)  
                   buf.append("0");  
               buf.append(Integer.toHexString(i));  
           }  
           //32位加密  
           return buf.toString();  
           // 16位的加密  
           //return buf.toString().substring(8, 24);  
       } catch (NoSuchAlgorithmException e) {  
           e.printStackTrace();  
           return null;  
       }  
   }  
	public static void main(String[] args) {
		System.out.println(makeMD5("21").equals("3c59dc048e8850243be8079a5c74d079"));
	}
}
