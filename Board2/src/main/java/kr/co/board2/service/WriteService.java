package kr.co.board2.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.board2.controller.CommonService;
import kr.co.board2.dao.ArticleDao;
import kr.co.board2.vo.ArticleVo;

public class WriteService implements CommonService {

	@Override
	public String businessProc(HttpServletRequest req, HttpServletResponse resp) {
		
		if(req.getMethod().equals("GET")) {
			return "/write.jsp";
		}else {
			
			// Multipart ���� ������ ����
			String path = req.getServletContext().getRealPath("/file"); // ���ε� ������ ����� �ý��� ���
			int maxsize = 1024 * 1024 * 10; // �ִ� ���� ��뷮 10MB
			
			MultipartRequest mr = null;
			
			try {
				mr = new MultipartRequest(req, path, maxsize, "UTF-8", new DefaultFileRenamePolicy());
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			String title   = mr.getParameter("title");	
			String content = mr.getParameter("content");	
			String fname   = mr.getFilesystemName("fname");	
			String uid     = mr.getParameter("uid");	
			String regip   = req.getRemoteAddr();
			
			
			ArticleVo vo = new ArticleVo();
			vo.setTitle(title);
			vo.setContent(content);
			vo.setFile(fname == null ? 0 : 1);
			vo.setUid(uid);
			vo.setRegip(regip);
			
			int no = ArticleDao.getInstance().insertArticle(vo);
			
			// ���� ÷��������
			if(fname != null) {
				
				// ����� ���ϸ� ����
				String nName = renameFile(path, fname, uid);
				
				// ���� ���̺� Insert
				ArticleDao.getInstance().insertFile(no, fname, nName);
			}
			
			return "redirect:/Board2/list.do";
		}
		
	}// businessProc end...
	
	public String renameFile(String path, String fname, String uid) {
		
		int i = fname.lastIndexOf(".");
		String ext = fname.substring(i);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss_");
		String now = sdf.format(new Date());
		String newName = now+uid+ext;
		
		File oriFile = new File(path+"/"+fname);
		File newFile = new File(path+"/"+newName);
		
		oriFile.renameTo(newFile);
		
		return newName;
	}
	
	

}