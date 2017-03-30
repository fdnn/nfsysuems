package com.nfsysu.ems.util;

import org.apache.shiro.crypto.hash.Md5Hash;

/**
 * 加密工具
 * @author 小海
 * @date   2016-7-6下午3:25:24
 */
public class CryptographyUtil {

	/**
	 * Md5加密
	 * @param str
	 * @param salt
	 * @return
	 */
	public static String md5(String str,String salt){
		return new Md5Hash(str,salt).toString();
		//return new Md5Hash(str,salt).toBase64();
	}
	
	public static void main(String[] args) {
		String password="1";
		//MD5加盐加密
		System.out.println("Md5加密:"+CryptographyUtil.md5(password, ""));
	}
}
