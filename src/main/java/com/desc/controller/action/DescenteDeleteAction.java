package com.desc.controller.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.desc.dao.DescenteDAO;

public class DescenteDeleteAction implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String num=request.getParameter("num");
		DescenteDAO dDao=DescenteDAO.getInstance();
		dDao.deleteBoard(num);
		new DescenteListAction().execute(request, response);
	}
}
