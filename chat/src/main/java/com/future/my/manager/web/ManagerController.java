package com.future.my.manager.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ManagerController {
	
	@RequestMapping("/manager")
	public String chat() {
		return "manager/managerView";
	}
}