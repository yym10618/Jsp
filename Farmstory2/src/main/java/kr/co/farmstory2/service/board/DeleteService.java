package kr.co.farmstory2.service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.farmstory2.controller.CommonService;
import kr.co.farmstory2.dao.ArticleDao;

public class DeleteService implements  CommonService{

	@Override
	public String businessProc(HttpServletRequest req, HttpServletResponse resp) {

		String no = req.getParameter("no");
		String cate = req.getParameter("cate");
		String type = req.getParameter("type");
		
		ArticleDao.getInstance().deleteArticle(no);
		
		return "redirect:/Farmstory2/board/list.do?cate="+cate+"&type="+type;
	}

}
