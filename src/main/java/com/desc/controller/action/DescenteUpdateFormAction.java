package com.desc.controller.action;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.desc.dao.DescenteDAO;
import com.desc.dto.DescenteVO;

// 게시글 수정 페이지로 이동
public class DescenteUpdateFormAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "/board/boardUpdate.jsp";
		String num = request.getParameter("num");
		DescenteDAO dDao = DescenteDAO.getInstance();
		dDao.updateReadCount(num);
		DescenteVO dVo = dDao.selectOneBoardByNum(num);
		request.setAttribute("board", dVo);
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
