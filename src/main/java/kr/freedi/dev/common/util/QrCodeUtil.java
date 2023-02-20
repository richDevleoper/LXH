package kr.freedi.dev.common.util;

import java.nio.charset.Charset;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

public class QrCodeUtil {
	public static String sign(String keyHex, String message) throws Exception {
		final byte[] keyBytes = new byte[16];
		
		for (int i = 0; i < 16; i++){
			keyBytes[i] = (byte) Integer.parseInt(keyHex.substring(i * 2, i * 2 + 2), 16);
		}

		final Charset ascii = Charset.forName("US-ASCII");
		final Mac mac = Mac.getInstance("HmacSHA256");
		final SecretKeySpec key = new SecretKeySpec(keyBytes, "HmacSHA256");
		mac.init(key);

		final byte[] sign = mac.doFinal(ascii.encode(message).array());
		String result = "";

		for (final byte b : sign) {
			String hex = Integer.toHexString(0xFF & b);
			if (hex.length() == 1){
				result += "0";
			}
			result += hex;
		}

		return result;
	}
}
