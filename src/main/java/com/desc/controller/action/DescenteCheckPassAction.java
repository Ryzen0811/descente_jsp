package com.desc.controller.action;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.desc.dao.DescenteDAO;
import com.desc.dto.DescenteVO;

// 게시글 비밀번호가 일치하는지 비교
public class DescenteCheckPassAction implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = null;
		String num = request.getParameter("num");
		String pass = request.getParameter("pass");
		DescenteDAO dDao = DescenteDAO.getInstance();
		DescenteVO dVo = dDao.selectOneBoardByNum(num);
		if (dVo.getPass().equals(pass)) { // 성공
			url = "/board/checkSuccess.jsp";
		} else {// 실패
			url = "/board/boardCheckPass.jsp";
			request.setAttribute("message", "비밀번호가 틀렸습니다.");
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
