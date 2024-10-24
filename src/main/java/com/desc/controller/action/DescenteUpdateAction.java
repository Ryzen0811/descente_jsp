package com.desc.controller.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.desc.dao.DescenteDAO;
import com.desc.dto.DescenteVO;

// 입력한 정보로 DB 게시글 수정
public class DescenteUpdateAction implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		DescenteVO dVo = new DescenteVO();
		dVo.setNum(Integer.parseInt(request.getParameter("num")));
		dVo.setUsername(request.getParameter("username"));
		dVo.setPass(request.getParameter("pass"));
		dVo.setEmail(request.getParameter("email"));
		dVo.setTitle(request.getParameter("title"));
		dVo.setContent(request.getParameter("content"));
		DescenteDAO dDao = DescenteDAO.getInstance();
		dDao.updateBoard(dVo);
		new DescenteListAction().execute(request, response);
	}
}
