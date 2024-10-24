package com.desc.controller.action;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.desc.dao.DescenteDAO;
import com.desc.dto.DescenteVO;



public class DescenteListAction implements Action {
	 @Override
		public void execute(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			String url = "/board/boardList.jsp";
			DescenteDAO dDao = DescenteDAO.getInstance();
			List<DescenteVO> boardList = dDao.selectAllBoards();
			request.setAttribute("boardList", boardList);
			RequestDispatcher dispatcher = request.getRequestDispatcher(url);
			dispatcher.forward(request, response);
		}

}