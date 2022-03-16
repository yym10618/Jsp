package kr.co.board2.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.board2.controller.CommonService;
import kr.co.board2.dao.ArticleDao;
import kr.co.board2.vo.ArticleVo;

public class ModifyService implements CommonService {

	@Override
	public String businessProc(HttpServletRequest req, HttpServletResponse resp) {
		
		if(req.getMethod().equals("GET")) {
			return "/modify.jsp";
		}else {
			
			ArticleVo vo = new ArticleVo();
			
			String no = req.getParameter("no");
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			
			vo.setNo(no);
			vo.setTitle(title);
			vo.setContent(content);
			
			ArticleDao.getInstance().updateArticle(vo);
		}
		return "redirect:/Board2/list.do";
	}

}