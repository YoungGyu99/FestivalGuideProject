package com.future.my.chatbot1.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Chat1BotController {
	
	@RequestMapping("/chat1")
	public String chat() {
		return "chat1/chat1View";
	}
}
