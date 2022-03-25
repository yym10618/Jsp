package kr.co.farmstory2.service.board;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.farmstory2.controller.CommonService;
import kr.co.farmstory2.dao.ArticleDao;
import kr.co.farmstory2.vo.FileVo;

public class DeleteService implements  CommonService{

	@Override
	public String businessProc(HttpServletRequest req, HttpServletResponse resp) {

		String no = req.getParameter("no");
		String cate = req.getParameter("cate");
		String type = req.getParameter("type");
		String file = req.getParameter("file");
		
		ArticleDao.getInstance().deleteArticle(no);
		ArticleDao.getInstance().deleteCommentsByParent(no);
		
		if(Integer.parseInt(file) > 0) {
			FileVo vo = new FileVo();
			vo = ArticleDao.getInstance().deleteFile(no, file);
			String nName = vo.getnName();
			String path = req.getServletContext().getRealPath("/file");
			File dfile = new File(path+"/"+nName);
			dfile.delete();
		}
		
		return "redirect:/Farmstory2/board/list.do?cate="+cate+"&type="+type;
	}

}
