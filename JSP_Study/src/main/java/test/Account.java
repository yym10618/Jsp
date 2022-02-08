package test;

import java.io.IOException;

import javax.servlet.jsp.JspWriter;

public class Account {
	
	private String bank;
	private String id;
	private String name;
	private int balance;
	
	public Account(String bank, String id, String name, int balance) {
		this.bank = bank;
		this.id = id;
		this.name = name;
		this.balance = balance;
	}
	
	public void deposit(int money) {
		this.balance += money;
	}
	
	public void withdraw(int money) {
		this.balance -= money;
	}
	
	public void show(JspWriter out) throws IOException {
		out.println("<p>");
		out.println("����� : "+this.bank+"</br>");
		out.println("���¹�ȣ : "+this.id+"</br>");
		out.println("�Ա��� : "+this.name+"</br>");
		out.println("�����ܾ� : "+this.balance+"</br>");
		out.println("</p>");
	}
}
