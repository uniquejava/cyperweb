package org.ccs.cyperweb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/hello")
public class HelloController {
	
	@RequestMapping(value = "")
	public String index() {
		return "index";
	}
}
