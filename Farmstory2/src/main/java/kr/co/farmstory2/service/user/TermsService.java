package kr.co.farmstory2.service.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.farmstory2.controller.CommonService;

public class TermsService implements  CommonService{

	@Override
	public String businessProc(HttpServletRequest req, HttpServletResponse resp) {

		return "/user/terms.jsp";
	}

}
