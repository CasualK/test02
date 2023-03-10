package com.nullp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nullp.model.RevDao;
import com.nullp.model.RevDto;


public class EditController extends HttpServlet{
	Logger log = Logger.getLogger("com.bit.controller.DetailController");
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setHeader("Access-Control-Allow-Origin","*");

		String viewName="detail.jsp";
		if(req.getRequestURI().contains("edit"))
			viewName="edit.jsp";	
		RequestDispatcher rd = null;
		rd=req.getRequestDispatcher(viewName);
		rd.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setHeader("Access-Control-Allow-Origin","*");
		String sub = req.getParameter("sub");
		String content = req.getParameter("content");
		int rnum=Integer.parseInt(req.getParameter("rnum"));
		RevDao dao = new RevDao();
		try {
			dao.editOne(sub, content, rnum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		resp.sendRedirect("detail.do?rnum="+rnum);
	}
}
