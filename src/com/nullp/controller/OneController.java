package com.nullp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nullp.model.RevDao;
import com.nullp.model.RevDto;

public class OneController extends HttpServlet {
   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	   resp.setCharacterEncoding("utf-8");
		resp.setHeader("Access-Control-Allow-Origin","*");

	   int rnum=Integer.parseInt(req.getParameter("rnum"));
	   PrintWriter out = resp.getWriter();
		RevDao dao = new RevDao();
		 resp.setContentType("application/json");
		 try {
			 RevDto bean = dao.getOne(rnum);
				out.println("{\"revOne\":[");
				out.println(
				"{\"sub\": \"" + bean.getSub()
				+ "\", \"rnum\":" + bean.getRnum() 
				+ ", \"writedate\":\"" + bean.getWriteDate() 
				+ "\", \"uname\":\"" + bean.getUname() 
				+ "\", \"viewcnt\":" + bean.getViewCnt()
				+ ", \"content\":\"" + bean.getContent() 
				+ "\", \"ref\":" + bean.getRef() 
				+ ", \"seq\":" + bean.getSeq() 
				+ ", \"lvl\":" + bean.getLvl()
				+ "}");
				out.println("]}");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}  finally {
				if (out != null)
					out.close();
			}
   }
}