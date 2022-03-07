package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void init() throws ServletException {
		// ������ ���� ��û�� ���� �ʱ�ȭ �޼���
		System.out.println("HelloServlet init ����...");
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// get ��û�� ���� ���� �޼���
		resp.setContentType("text/html;charset=UTF-8");
		
		PrintWriter writer = resp.getWriter();
		
		writer.println("<html>");
		writer.println("<head>");
		writer.println("<meta charset='utf-8'>");
		writer.println("<title>HelloServlet</title>");		
		writer.println("</head>");
		writer.println("<body>");
		writer.println("<h3>HelloServlet</h3>");
		writer.println("<p>");
		writer.println("HelloServlet ������Ʈ ����Ϸ�...<br/>");
		writer.println("<a href='/JSP_Study/Sub8/WelcomeServlet.do'>WelcomeServlet ��û</a><br/>");
		writer.println("<a href='/JSP_Study/Sub8/1.Servlet.jsp'>Servlet.jsp ��û</a><br/>");
		writer.println("</p>");		
		writer.println("</body>");		
		writer.println("</html>");
		
		writer.close();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// post ��û�� ���� ���� �޼���
	}
	
}