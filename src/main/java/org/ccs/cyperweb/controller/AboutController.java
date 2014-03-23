package org.ccs.cyperweb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/about")
public class AboutController {
	
	@RequestMapping(value = "")
	public String index() {
		return "about";
	}
}
