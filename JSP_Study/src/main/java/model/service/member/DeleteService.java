package model.service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.MemberDao;
import model.dao.UserDao;
import model.service.CommonService;
import vo.UserVo;

public class DeleteService implements CommonService {

	@Override
	public String businessProc(HttpServletRequest req, HttpServletResponse resp) {

		String uid = req.getParameter("uid");
		
		MemberDao.getInstance().deleteMember(uid);
		
		return "redirect:/JSP_Study/Sub8/member/list.do";
		
	}

}