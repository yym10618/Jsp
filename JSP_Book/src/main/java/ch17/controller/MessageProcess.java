package ch17.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MessageProcess implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		request.setAttribute("message", "요청 파라미터로 명령어를 전달");
		
		return "/Ch17/process.jsp";
	}

}
