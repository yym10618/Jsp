package ch17.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MessageProcess implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		request.setAttribute("message", "��û �Ķ���ͷ� ��ɾ ����");
		
		return "/Ch17/process.jsp";
	}

}
