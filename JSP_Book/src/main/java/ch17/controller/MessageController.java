package ch17.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/MessageController")
public class MessageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MessageController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response); // 1.���������� ��û�� ����(get)
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response); // 1.���������� ��û�� ����(post)
	}
	
	private void requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		// 2. ���������� �䱸�ϴ� �۾��� �м�
		String message = request.getParameter("message");
		
		// 3. ��û�� �۾��� ó��
		Object result = null;
		if(message == null || message.equals("base")) {
			result = "������";
		}else if(message.equals("name")) {
			result = "ȫ�浿�Դϴ�.";
		}else {
			result = "Ÿ���� ���� �ʽ��ϴ�.";
		}
		
		// 4. ���� ó�� ����� request ��ü�� �Ӽ��� ����
		request.setAttribute("result", result);
		
		// 5. ������ �並 ���� �� �ش� ��� ������
		RequestDispatcher dispatcher = request.getRequestDispatcher("/Ch17/messageView.jsp");
		dispatcher.forward(request, response);
	}

}
