package com.ymq.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HelloController {
	
	@ResponseBody
	@RequestMapping("/hello")
	public String hello() {
		return "hello world!";
	}
	
	@RequestMapping("/hello2")
	public String tohello() {
		return "hello";
	}
}
