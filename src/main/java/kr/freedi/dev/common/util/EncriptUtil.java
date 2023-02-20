package kr.freedi.dev.common.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class EncriptUtil {

	public static String encript(String str) {
		return encript(str, "SHA-256");
	}
	
	private static String encript(String str, String encType) {

		String encStr = "";

		try {
			MessageDigest md = MessageDigest.getInstance(encType);

			md.update(str.getBytes());
			byte byteData[] = md.digest();
			StringBuffer sb = new StringBuffer();

			for (int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
			}

			encStr = sb.toString();

		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			encStr = null;
		}

		return encStr;
	}
}
