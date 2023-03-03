package com.nullp.controller;

import java.io.IOException;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nullp.model.RevDao;

public class ListController extends HttpServlet {
	Logger log = Logger.getGlobal();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// view resolver
		resp.setHeader("Access-Control-Allow-Origin","*");

		RequestDispatcher rd = null;
		rd = req.getRequestDispatcher("review.jsp");
		rd.forward(req, resp);
	}

}
