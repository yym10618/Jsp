package kr.co.board2.service;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.board2.controller.CommonService;
import kr.co.board2.dao.ArticleDao;

public class DeleteService implements CommonService {

	@Override
	public String businessProc(HttpServletRequest req, HttpServletResponse resp) {
		
		String no = req.getParameter("no");
		String fid = req.getParameter("fid");
		String file = req.getParameter("file");
		
		if(req.getParameter("file") > 0) {
			
		}else {
			
		}
		
		return "redirect:/Board2/list.do?no="+no;
	}
	

}