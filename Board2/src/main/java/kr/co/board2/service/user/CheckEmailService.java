package kr.co.board2.service.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import kr.co.board2.controller.CommonService;
import kr.co.board2.dao.UserDao;

public class CheckEmailService implements CommonService{

	@Override
	public String businessProc(HttpServletRequest req, HttpServletResponse resp) {

		String email = req.getParameter("email");
		int count = UserDao.getInstance().selectCountUid(email);
		
		// Json ������ ����
		JsonObject json = new JsonObject();
		json.addProperty("result", count);
		
		// Json ���
		return "json:"+json.toString();
	}

}
