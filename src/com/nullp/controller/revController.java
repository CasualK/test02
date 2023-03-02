package com.nullp.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.nullp.model.*;


public class revController extends HttpServlet{
	int cnt=0;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//model
		RevDao dao = new RevDao();
		resp.setCharacterEncoding("utf-8");
		PrintWriter out = resp.getWriter();
//		System.out.println(req.getParameter("cnt"));
		if(req.getParameter("cnt")==null && cnt ==0) {
			cnt = 12;
		}else if(req.getParameter("cnt")!=null){
			cnt=Integer.parseInt(req.getParameter("cnt"));
		}
		System.out.println(cnt);
		try {
			out.print("{\"rev\":[");
			List<RevDto> list = dao.getList(cnt);
			for (int i = 0; i < list.size(); i++) {
				RevDto bean = list.get(i);
				if (i != 0)out.print(",");
				out.print("{\"rnum\":" + bean.getRnum() + ",\"sub\":\"" + bean.getSub() + "\",\"uname\":\""
						+ bean.getUname() + "\",\"viewCnt\":" + bean.getViewCnt() + ",\"writedate\":\""
						+ bean.getWriteDate() + "\"}");
			}
			out.print("]}");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (out != null)
				out.close();
		}
		
	}
}
