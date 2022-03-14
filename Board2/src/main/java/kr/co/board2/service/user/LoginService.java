package kr.co.board2.service.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.board2.controller.CommonService;
import kr.co.board2.dao.UserDao;
import kr.co.board2.vo.UserVo;

public class LoginService implements CommonService {

	@Override
	public String businessProc(HttpServletRequest req, HttpServletResponse resp) {
		
		if(req.getMethod().equals("GET")) {
			return "/user/login.jsp";
		}else {
			
			String uid = req.getParameter("uid");
			String pass = req.getParameter("pass");
			
			UserVo user = UserDao.getInstance().selectUser(uid, pass);
			
			if(user == null) {
				// ȸ���� �ƴ�
				return "redirect:/Board2/user/login.do?success=100";
			}else {
				// ȸ���� ����
				HttpSession sess =  req.getSession(); // ���� ���� ��������
				sess.setAttribute("sessUser", user);
				
				return "redirect:/Board2/list.do";
			}
		}
		
		
	}

}