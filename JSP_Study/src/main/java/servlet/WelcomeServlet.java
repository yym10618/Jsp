package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WelcomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void init() throws ServletException {
		System.out.println("WelcomeServlet init ����...");
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/html;charset=UTF-8");
		
		PrintWriter writer = resp.getWriter();
		
		writer.println("<html>");
		writer.println("<head>");
		writer.println("<meta charset='utf-8'>");
		writer.println("<title>WelcomeServlet</title>");		
		writer.println("</head>");
		writer.println("<body>");
		writer.println("<h3>WelcomeServlet</h3>");
		writer.println("<p>");
		writer.println("WelcomeServlet ������Ʈ ����Ϸ�...<br/>");
		writer.println("<a href='/JSP_Study/Sub8/HelloServlet.do'>HelloServlet ��û</a><br/>");
		writer.println("<a href='/JSP_Study/Sub8/1.Servlet.jsp'>Servlet.jsp ��û</a><br/>");
		writer.println("</p>");		
		writer.println("</body>");		
		writer.println("</html>");
		
		writer.close();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	}
	
}