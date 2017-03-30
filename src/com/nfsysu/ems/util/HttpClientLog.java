package com.nfsysu.ems.util;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpMethod;
import org.apache.commons.httpclient.URIException;

public class HttpClientLog
{
	public void printRequestLog(HttpServletRequest request)
	{
		System.out.println();
		System.out.println("======================Cookie信息：======================");
		if(request.getCookies()!=null)
		{
			for(javax.servlet.http.Cookie cookie : request.getCookies())
	  		{
	  			System.out.println(cookie.getName()+":"+cookie.getValue());
	  		}
		}
		System.out.println("======================请求"+request.getRemoteAddr()+"的头部信息：");
		Enumeration<String> headers = request.getHeaderNames();
		while(headers.hasMoreElements())
		{
			String name = headers.nextElement();
			System.out.println(name+":"+request.getHeader(name));
		}
		
		System.out.println();
	}
	
	public void printRequestHeadersLog(HttpMethod method) throws URIException
	{
		System.out.println();
		System.out.println("======================请求"+method.getURI()+"的头部（Header）==================");
		for(Header header :method.getRequestHeaders())
		{
			System.out.println(header.getName()+":"+header.getValue());
		}
		System.out.println();
	}
	
	
	public void printResponseLog(HttpMethod method) throws IOException
	{
		System.out.println();
		System.out.println("======================请求"+method.getURI()+"的响应==================");
		System.out.println("======================响应的Header===================");
		for(Header header : method.getResponseHeaders())
		{
			System.out.println(header.getName()+"="+header.getValue());
		}
		System.out.println("======================响应的Body=====================");
		System.out.print(method.getResponseBodyAsString());
		System.out.println();
	}
	
	
	public void printResponseHeadersLog(HttpMethod method) throws IOException
	{
		System.out.println();
		System.out.println("======================请求"+method.getURI()+"的头部（Header）==================");
		for(Header header :method.getResponseHeaders())
		{
			System.out.println(header.getName()+":"+header.getValue());
		}
		System.out.println();
	}
}
