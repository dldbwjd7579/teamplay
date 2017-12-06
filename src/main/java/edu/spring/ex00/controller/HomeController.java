package edu.spring.ex00.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		//메인페이지로 이동
		return "home";
	}
	
	@RequestMapping(value="/login-post", method=RequestMethod.POST)
	public void login_post() {
		//TODO : 로그인 버튼 눌렀을때 처리하는 메소드
		
	}
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public String go_register() {
		//회원가입 페이지로 이동
		return "podo/register";
	}
	
	@RequestMapping(value="/member_detail", method=RequestMethod.GET)
	public String go_mypage(Model model/*,String userid*/) {
		//TODO: 로그인된 사용자의 아이디 정보를 가지고 가야해서 userid 파라미터로 넘김
		
		return "podo/member_detail"/* + "/userid="+userid*/;
	}
}
