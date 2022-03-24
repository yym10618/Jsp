package kr.co.farmstory2.service.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.farmstory2.commons.AboutPaging;
import kr.co.farmstory2.controller.CommonService;
import kr.co.farmstory2.dao.ArticleDao;
import kr.co.farmstory2.vo.ArticleVo;
import kr.co.farmstory2.vo.FileVo;
import kr.co.farmstory2.vo.UserVo;

public class ViewService extends AboutPaging implements CommonService {

	@Override
	public String businessProc(HttpServletRequest req, HttpServletResponse resp) {

		// 로그인 체크
		HttpSession sess = req.getSession();
		UserVo userVo = (UserVo) sess.getAttribute("sessUser");
		
		if(userVo == null) {
			return "redirect:/Farmstory2/user/login.do?success=103";
		}else {
			String no = req.getParameter("no");
			String fid = req.getParameter("fid");
			String cate = req.getParameter("cate");
			String type = req.getParameter("type");
			String pg = req.getParameter("pg");
			
			int currentPage = getCurrentPageNum(pg);
			
			ArticleDao dao = ArticleDao.getInstance();
			
			ArticleVo article = dao.selectArticle(no);
			List<ArticleVo> comments = dao.selectComments(no);
			req.setAttribute("article", article);
			req.setAttribute("comments", comments);
			req.setAttribute("cate", cate);
			req.setAttribute("type", type);
			req.setAttribute("currentPage", currentPage);
			return "/board/view.jsp";
		}
	}
}