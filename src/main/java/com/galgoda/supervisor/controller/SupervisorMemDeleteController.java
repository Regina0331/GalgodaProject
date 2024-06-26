package com.galgoda.supervisor.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.galgoda.supervisor.model.service.SupervisorService;

/**
 * Servlet implementation class SupervisorMemDeleteController
 */
@WebServlet("/deleteMem.su")
public class SupervisorMemDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SupervisorMemDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memNo = Integer.parseInt(request.getParameter("no"));
		
		int result = new SupervisorService().deleteMem(memNo);
		
		if(result>0) {
			request.getSession().setAttribute("alertMsg", "담당자 정보 삭제에 성공하였습니다.");
			response.sendRedirect(request.getContextPath() + "/hotelList.su?page=1");
		}else {
			request.getSession().setAttribute("alertMsg", "담당자 정보 삭제에 실패하였습니다.");
			response.sendRedirect(request.getContextPath() + "/hotelList.su?page=1");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
