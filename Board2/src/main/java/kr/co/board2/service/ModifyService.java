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
			String no = req.getParameter("no");
			ArticleVo article = ArticleDao.getInstance().selectArticle(no);
			req.setAttribute("article", article);
			
			return "/modify.jsp";
			
		}else {
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			String no = req.getParameter("no");
			
			ArticleDao.getInstance().updateArticle(title, content, no);
			
			return "redirect:/Board2/view.do?no="+no;
		}
		
		
	}
}