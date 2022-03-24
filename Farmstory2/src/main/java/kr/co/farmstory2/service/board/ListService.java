package kr.co.farmstory2.service.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.farmstory2.dao.ArticleDao;
import kr.co.farmstory2.vo.ArticleVo;
import kr.co.farmstory2.commons.AboutPaging;
import kr.co.farmstory2.controller.CommonService;

public class ListService extends AboutPaging implements CommonService {

	@Override
	public String businessProc(HttpServletRequest req, HttpServletResponse resp) {
		
		String cate = req.getParameter("cate");
		String type = req.getParameter("type");
		String pg = req.getParameter("pg");
		
		int currentPage  = getCurrentPageNum(pg);
		int total        = ArticleDao.getInstance().selectCountTotal(type);
		int lastPageNum  = getLastPageNum(total);
		int start        = getLimitStart(currentPage);
		int pageStartNum = getPageStartNum(total, start); 
		int[] groups     = getPageGroup(currentPage, lastPageNum);
		
		List<ArticleVo> articles = ArticleDao.getInstance().selectArticles(type, start);
		
		req.setAttribute("cate", cate);
		req.setAttribute("type", type);
		req.setAttribute("articles", articles);
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("lastPageNum", lastPageNum);
		req.setAttribute("pageStartNum", pageStartNum);
		req.setAttribute("groups", groups);
		
		return "/board/list.jsp";
		
	}// businessProc end
	
}