<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.galgoda.common.model.vo.PageInfo"%>
<%@ page import="java.util.List"%>
<%@ page import="com.galgoda.customerService.model.vo.Inq"%>
<%@ page import="com.galgoda.hotel.model.vo.Hotel"%>
<%
	List<Inq> list = (List<Inq>)request.getAttribute("list");
	List<Hotel> list2 = (List<Hotel>)request.getAttribute("list2");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	/* 사용자_1대1문의내역페이지 스타일 */
    .sideMenubar_head {
        width: 80%;
        margin-left: 10px;
        margin-right: 50px;
        margin-top: 10px;
        border-bottom: 1px solid gray;
	}
</style>
</head>
<body>
	<div class="wrap">
        
        <%@ include file="/views/common/adminHeader.jsp" %>

        <!-- section start -->
        <section class="main_content">
			<div class="sideMenubar">
				<ul class="nav flex-column">
					<li>
						<h3 class="sideMenubar_head">고객센터 관리</h3>
					</li>

					<li><a class="nav-link" href="#">공지사항 관리</a></li>

					<li style="background-color: rgb(115, 90, 75);"><a
						class="nav-link" style="color: white;" href="">문의사항 관리</a></li>

					<li><a class="nav-link" href="#" data-toggle="collapse"
						data-target="#aaa">신고 관리</a></li>
					<li>
						<div class="collapse" id="aaa" style="margin-left: 30px;">
							<a href="">신고 계정 관리</a>
						</div>
					</li>
					<li>
						<div class="collapse" id="aaa" style="margin-left: 30px;">
							<a href="">신고 리뷰 관리</a>
						</div>
					</li>
				</ul>
			</div>

			<div class="page_content">
				<h2 class="contentName">1:1 문의내역</h2>
				<div style="margin-top: 10px; border: 2px solid lightgray;"></div>
				<div style="margin-top: 20px;">
					<select name="category" id="hotelCategory">
						<% for(int i=0; i<list2.size(); i++){ %>
						<option value="<%= list2.get(i).getHotelName() %>"><%= list2.get(i).getHotelName() %></option>
						<% } %>
					</select>
				</div>
				<div style="margin-top: 20px;">
					<table class="table">
						<thead>
							<tr align="center" class="table-active">
								<th style="width: 20%;">구분</th>
								<th style="width: 10%;">문의유형</th>
								<th style="width: 55%;">제목</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody>
							<% for(Inq inq : list){ %>
							<tr align="center">
								<td><%= inq.getCategory() %></td>
								<td><%= inq.getInqType() %></td>
								<td><a
									href="<%= contextPath %>/detail.inq?no=<%= inq.getInqNo() %>"><%= inq.getInqTitle() %></a></td>
								<td><%= inq.getRegistDate() %></td>
							</tr>
							<% } %>
						</tbody>
					</table>

					<ul class="pagination"
						style="margin-top: 50px; width: 95%; justify-content: center;">
						
						<% if(!list.isEmpty()){ %>
						
							<% if(pi.getCurrentPage() == 1){ %>
							<li class="page-item disabled"><a class="page-link" href="#">&lt;</a></li>
							<% }else { %>
							<li class="page-item"><a class="page-link"
								href="<%= contextPath %>/adminList.inq?page=<%= pi.getCurrentPage() - 1 %>&category=<%= list.get(0).getCategory() %>">&lt;</a></li>
							<% } %>
							<% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
							<% if(p == pi.getCurrentPage()){ %>
							<li class="page-item active"><a class="page-link" href="#"><%= p %></a></li>
							<% }else { %>
							<li class="page-item"><a class="page-link"
								href="<%= contextPath %>/adminList.inq?page=<%= p %>&category=<%= list.get(0).getCategory() %>"><%= p %></a></li>
							<% } %>
							<% } %>
	
							<% if(pi.getCurrentPage() == pi.getMaxPage()){ %>
							<li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
							<% }else { %>
							<li class="page-item"><a class="page-link"
								href="<%= contextPath %>/adminList.inq?page=<%= pi.getCurrentPage() + 1 %>&category=<%= list.get(0).getCategory() %>">&gt;</a></li>
	
							<% } %>
						
						<% } %>
					</ul>
				</div>

			</div>
			<% if(!list.isEmpty()){ %>
			<script>
				$(function() {
					var hotelName = '<%= list.get(0).getCategory() %>';
					$('option[value=' + hotelName + ']').attr("selected" ,true);
					
					
					$("#hotelCategory").change(function() {
						var category = $(this).val();
			            var contextPath = '<%= contextPath %>';
			            var newURL = contextPath + '/adminList.inq?page=1&category=' + category;
			            window.location.href = newURL;
					})
				})
			
				
			</script>
			<% } %>
		</section>
		
		
        <!-- section end -->

        <%@ include file="/views/common/footer.jsp" %>
        
    </div>
</body>
</html>