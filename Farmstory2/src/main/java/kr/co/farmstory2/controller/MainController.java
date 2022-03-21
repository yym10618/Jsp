package kr.co.farmstory2.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class MainController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	// ��Ʈ�ѷ��� ������ ���񽺸� ��ü �ڷᱸ��
	private Map<String, Object> instances = new HashMap<>();
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		
		// ������Ƽ ���� ��� ���ϱ�
		ServletContext ctx = config.getServletContext();
		String path = ctx.getRealPath("/WEB-INF")+"/urlMapping.properties";		
		System.out.println("path : "+path);
		
		// ������Ƽ ���� �Է½�Ʈ�� ���� �� ������Ƽ ��ü ����
		Properties prop = new Properties();
		
		try {
			FileInputStream fis = new FileInputStream(path);
			prop.load(fis);
			fis.close();
		}catch (Exception e) {
			e.printStackTrace();
		}		
		
		// ������Ƽ ��ü�� ���� ���� ��ü ����
		Iterator iter = prop.keySet().iterator();
		
		while(iter.hasNext()) {
			
			String k = iter.next().toString();
			String v = prop.getProperty(k);
			
			try {
				// Ŭ������ ��ü�� ��������
				Class obj = Class.forName(v);
				Object instance = obj.newInstance();
				
				instances.put(k, instance);
				
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
	}// init end...
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		requestProc(req, resp);
	}// doGet end...
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		requestProc(req, resp);
	}// doPost end...
	
	protected void requestProc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// ��û�ּҿ��� service ��ü�� key ���ϱ�
		String path = req.getContextPath();
		String uri = req.getRequestURI();
		String key = uri.substring(path.length());
		
		// instances���� service ��ü ��������
		CommonService service = (CommonService) instances.get(key);

		// service ��ü ���� �� view ���� �ޱ�
		String result = service.businessProc(req, resp);
		
		if(result.startsWith("redirect:")) {
			// �����̷�Ʈ
			String redirectUrl = result.substring(9);
			resp.sendRedirect(redirectUrl);
		}else if(result.startsWith("json:")) {
			// Json ���
			resp.setContentType("application/json;charset=UTF-8");
			resp.setCharacterEncoding("utf-8");
			
			PrintWriter out = resp.getWriter();
			out.print(result.substring(5));
			
		}else if(result.startsWith("file:")){
			// ��������(���� �ٿ�ε�)
			String oName = (String) req.getAttribute("oName");
			String nName = (String) req.getAttribute("nName");
			
			// ���� �ٿ�ε� response �������	
			resp.setContentType("application/octet-stream");
			resp.setHeader("Content-Disposition", "attachment; filename="+URLEncoder.encode(oName, "utf-8"));
			resp.setHeader("Content-Transfer-Encoding", "binary");
			resp.setHeader("Pragma", "no-cache");
			resp.setHeader("Cache-Control", "private");
			
			// response ��ü ��Ʈ�� �۾�
			String filePath = req.getServletContext().getRealPath("/file");
			
			File file = new File(filePath+"/"+nName);
			
			BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
			BufferedOutputStream bos = new BufferedOutputStream(resp.getOutputStream());
			
			while(true){
				int data = bis.read();
				
				if(data == -1){
					break;			
				}
				
				bos.write(data);
			}
			
			bos.close();
			bis.close();
			
		}else {
		
			// view ������
			RequestDispatcher dispatcher = req.getRequestDispatcher(result);
			dispatcher.forward(req, resp);
		}
		
	}// requestProc end...
	
	
}