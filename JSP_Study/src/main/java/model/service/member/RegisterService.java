package model.service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.MemberDao;
import model.service.CommonService;
import vo.MemberVo;

public class RegisterService implements CommonService {

	@Override
	public String businessProc(HttpServletRequest req, HttpServletResponse resp) {
		
		if(req.getMethod().equals("GET")) {
			// Get ��û�� ���
			return "/Sub8/member/register.jsp";
		}else {
			// Post ��û�� ���
			String uid  = req.getParameter("uid");
			String name = req.getParameter("name");
			String hp   = req.getParameter("hp");
			String pos  = req.getParameter("pos");
			String dep  = req.getParameter("dep");
			
			// Dao ����
			MemberVo vo = new MemberVo();
			vo.setUid(uid);
			vo.setName(name);
			vo.setHp(hp);
			vo.setPos(pos);
			vo.setDep(dep);
			
			MemberDao.getInstance().insertMember(vo);
			
			return "redirect:/JSP_Study/Sub8/member/list.do";
		}
		
		
	}

}
