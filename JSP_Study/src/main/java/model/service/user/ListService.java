package model.service.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.UserDao;
import model.service.CommonService;
import vo.UserVo;

public class ListService implements CommonService {

	@Override
	public String businessProc(HttpServletRequest req, HttpServletResponse resp) {
		
		// Dao ����(������ ��������)
		List<UserVo> users = UserDao.getInstance().selectUsers();
		
		// users �����ͼ��� View���� �����ϱ� ���� request ��ü�� ����
		req.setAttribute("users", users);
		
		return "/Sub8/user/list.jsp";
	}

}