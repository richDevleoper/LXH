package kr.freedi.dev.common.util;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.DecoderException;
import org.apache.commons.codec.binary.Base64;
import org.apache.commons.codec.binary.Hex;

public class AESUtil {

	private static final String IV = "127D5C9927726BCEFE752eB1BDD3E138";

	private SecretKey keySpec;
	private Cipher cipher;

	public AESUtil(String sEncKey) throws UnsupportedEncodingException {
		init(sEncKey);
	}

	/**
	 * 16자리의 키값을 입력하여 객체를 생성한다.
	 * @param key 암/복호화를 위한 키값
	 * @return
	 * @throws UnsupportedEncodingException 키값의 길이가 16이하일 경우 발생
	 */
	private void init(String key) throws UnsupportedEncodingException {
		try {
			cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
		} catch (NoSuchAlgorithmException e) {
			throw fail(e);
		} catch (NoSuchPaddingException e) {
			throw fail(e);
		}

		byte[] keyBytes = new byte[16];
		byte[] b = key.getBytes("UTF-8");
		int len = b.length;
		if (len > keyBytes.length) {
			len = keyBytes.length;
		}
		System.arraycopy(b, 0, keyBytes, 0, len);
		SecretKeySpec keySpec = new SecretKeySpec(keyBytes, "AES");

		this.keySpec = keySpec;
	}

	/**
	 * AES256 으로 암호화 한다.
	 * @param str 암호화할 문자열
	 * @return
	 * @throws NoSuchAlgorithmException
	 * @throws GeneralSecurityException
	 * @throws UnsupportedEncodingException
	 */
	public String encrypt(String str) throws NoSuchAlgorithmException, GeneralSecurityException, UnsupportedEncodingException {
		byte[] encrypted = doFinal(Cipher.ENCRYPT_MODE, keySpec, IV, str.getBytes("UTF-8"));
		return hex(encrypted);
	}

	/**
	 * AES256으로 암호화된 txt 를 복호화한다.
	 * @param str 복호화할 문자열
	 * @return
	 * @throws NoSuchAlgorithmException
	 * @throws GeneralSecurityException
	 * @throws UnsupportedEncodingException
	 */
	public String decrypt(String str) throws NoSuchAlgorithmException, GeneralSecurityException, UnsupportedEncodingException {
		byte[] byteStr = doFinal(Cipher.DECRYPT_MODE, keySpec, IV, hex(str));
		return new String(byteStr, "UTF-8");
	}

	private byte[] doFinal(int encryptMode, SecretKey key, String iv, byte[] bytes) {
		try {
			cipher.init(encryptMode, key, new IvParameterSpec(hex(iv)));
			return cipher.doFinal(bytes);
		} catch (InvalidKeyException e) {
			throw fail(e);
		} catch (InvalidAlgorithmParameterException e) {
			throw fail(e);
		} catch (IllegalBlockSizeException e) {
			throw fail(e);
		} catch (BadPaddingException e) {
			throw fail(e);
		}
	}

	public static String base64(byte[] bytes) {
		return Base64.encodeBase64String(bytes);
	}

	public static byte[] base64(String str) {
		return Base64.decodeBase64(str);
	}

	public static String hex(byte[] bytes) {
		return Hex.encodeHexString(bytes);
	}

	public static byte[] hex(String str) {
		try {
			return Hex.decodeHex(str.toCharArray());
		} catch (DecoderException e) {
			throw new IllegalStateException(e);
		}
	}

	private IllegalStateException fail(Exception e) {
		return new IllegalStateException(e);
	}
}
