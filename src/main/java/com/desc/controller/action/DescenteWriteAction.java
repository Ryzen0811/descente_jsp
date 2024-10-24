package com.desc.controller.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.desc.dao.DescenteDAO;
import com.desc.dto.DescenteVO;

// 입력한 게시글 정보를 DB추가
public class DescenteWriteAction implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		DescenteVO dVo = new DescenteVO();
		dVo.setUsername(request.getParameter("username"));
		dVo.setPass(request.getParameter("pass"));
		dVo.setEmail(request.getParameter("email"));
		dVo.setTitle(request.getParameter("title"));
		dVo.setContent(request.getParameter("content"));
		DescenteDAO bDao = DescenteDAO.getInstance();
		bDao.insertBoard(dVo);
		new DescenteListAction().execute(request, response);
	}
}
