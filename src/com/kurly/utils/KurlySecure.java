package com.kurly.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

public class KurlySecure {
	private static final int SALT_SIZE = 16;
	
	public static String hashing(byte[] password) throws NoSuchAlgorithmException {
		
		MessageDigest md = MessageDigest.getInstance("SHA-256");
		
		// key-stretching: 10000번 실행
		for(int i=0; i<10000; i++) {
			String temp = byteToString(password);
			md.update(temp.getBytes());
			password = md.digest();
		}
		
		return byteToString(password);		
	}
	
	private static String byteToString(byte[] temp) {
		StringBuilder sb = new StringBuilder();
		
		// byte를 string으로 변환한다.(16진수)
		for(byte a : temp) {
			sb.append(String.format("%02x", a));
		}
		
		return sb.toString();
	}
	
	public static String getSalt() {
		SecureRandom sr = new SecureRandom();
		
		byte[] salt = new byte[SALT_SIZE];
		
		// nextBytes(): SecureRandom에서 난수를 생성하는 메서드, 
		// 파라미터에는 생성된 난수를 담을 byte 배열을 입력한다.
		sr.nextBytes(salt);
		
		return byteToString(salt);
	}
}
