package com.future.my.chatbot.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChatController {
	
	@RequestMapping("/chat")
	public String chat() {
		return "chat/chatView";
	}
}
