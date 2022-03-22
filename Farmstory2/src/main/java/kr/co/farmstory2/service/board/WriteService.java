package kr.co.farmstory2.service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.farmstory2.controller.CommonService;

public class WriteService implements  CommonService{

	@Override
	public String businessProc(HttpServletRequest req, HttpServletResponse resp) {

		String cate = req.getParameter("cate");
		String type = req.getParameter("type");
		req.setAttribute("cate", cate);
		req.setAttribute("type", type);
		
		if(req.getMethod().equals("GET")) {
			return "/board/write.jsp";
		}else {
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			String fname = req.getParameter("fname");
			String uid = req.getParameter("uid");
			String regip = req.getRemoteAddr();
		}
		return "redirect:/Farmstory2/board/list.do";
	}

}
