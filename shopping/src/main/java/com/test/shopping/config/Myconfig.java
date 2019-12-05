package com.test.shopping.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.test.shopping.interceptor.DengluInterceptor;

@Configuration
public class Myconfig implements WebMvcConfigurer{

	@Autowired
	private DengluInterceptor dengluinterceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(dengluinterceptor).addPathPatterns("/**").excludePathPatterns("/shangcheng.htm","/userdenglu.htm","/img/**", "/js/**", "/css/**");
	}
	
}
