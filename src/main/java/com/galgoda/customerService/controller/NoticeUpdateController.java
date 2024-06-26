package com.galgoda.customerService.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.galgoda.customerService.model.service.NoticeService;
import com.galgoda.customerService.model.vo.Notice;

/**
 * Servlet implementation class NoticeUpdateController
 */
@WebServlet("/update.no")
public class NoticeUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String noticeTitle = request.getParameter("title");
		String noticeContent = request.getParameter("content");
		int noticeNo = Integer.parseInt(request.getParameter("no"));
		
		Notice n = new Notice(noticeTitle, noticeContent);
		n.setNoticeNo(noticeNo);
		
		int result = new NoticeService().updateNotice(n);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "공지사항이 수정되었습니다");
			response.sendRedirect(request.getContextPath() + "/list.no?page=1");
		}else {
			request.getSession().setAttribute("alertMsg", "공지사항 수정에 실패했습니다");
			response.sendRedirect(request.getContextPath() + "/list.no?page=1");
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
