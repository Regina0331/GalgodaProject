<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.galgoda.hotel.model.vo.Report" %>
<%
	Report r = (Report)request.getAttribute("r");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	/* 관리자_신고계정상세페이지 스타일 */
    .page_content th{
        background-color: lightgray;
        width: 20%;
    }
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

                    <li>
                        <a class="nav-link" href="<%= contextPath %>/list.no?page=1">공지사항 관리</a>
                    </li>

                    <li>
                        <a class="nav-link" href="<%= contextPath %>/list.inq?page=1">문의사항 관리</a>
                    </li>

                    <li style="background-color: rgb(115, 90, 75);">
                        <a class="nav-link" style="color: white;" data-toggle="collapse" data-target="#aaa">신고 관리</a>
                    </li>
                    <li style="background-color: rgb(191, 180, 176);">
                        <div class="collapse show" id="aaa" style="margin-left: 30px;">
                            <a href="<%= contextPath %>/userList.rep?page=1">신고 계정 관리</a>
                        </div>
                    </li>
                    <li>
                        <div class="collapse show" id="aaa" style="margin-left: 30px;">
                            <a href="<%= contextPath %>/reviewList.rep?page=1">신고 리뷰 관리</a>
                        </div>
                    </li>
                </ul>
            </div>

            <div class="page_content">
                <h2 class="contentName">신고 계정 관리</h2>
                <div style="margin-top: 10px; border: 2px solid lightgray;"></div>
                <h4 style="margin-top: 10px;">신고계정상세</h4>
                <div style="width: 85%; margin: auto; margin-top: 20px;">
                    <table class="table">
                        <tr align="center">
                            <th>아이디</th>
                            <td><%= r.getUserId() %></td>
                        </tr>
                        <tr align="center">
                            <th>예약번호</th>
                            <td><%= r.getResNo() %></td>
                        </tr>
                        <tr align="center">
                            <th>신고사유</th>
                            <td><%= r.getRepReason() %></td>
                        </tr>
                        <tr align="center">
                            <th style="vertical-align: middle;">신고 내용</th>
                            <% if(r.getRepContent() != null){ %>
                            <td style="height: 300px; vertical-align: middle; overflow-y: auto;">
                            	<%= r.getRepContent() %>
                            </td>
                            <% }else { %>
                            <td style="height: 300px; vertical-align: middle; overflow-y: auto;">
                            </td>
                            <% } %>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <a href="<%= contextPath %>/userDelete.rep?userId=<%= r.getUserId() %>" class="btn" style="background-color: rgb(115, 90, 75); color: white;" onclick="deleteUser();">사용자 삭제</a>
                                <a href="<%= contextPath %>/cancel.rep?no=<%= r.getRepNo() %>&type=<%= r.getRepType() %>" class="btn" style="background-color: rgb(235, 231, 227);" onclick="cancelRep();">신고 취소</a>
                            </td>
                            
                        </tr>
                    </table>
                </div>
            </div>
            <script>
                // 신고계정삭제하는 메소드
                function deleteUser(){
                    if(!confirm("해당 사용자의 계정을 삭제하시겠습니까?")){
                    	event.preventDefault();
                    }
                }
                // 신고취소하는 메소드
                function cancelRep(){
                    if(!confirm("해당 사용자에 대한 신고를 취소시키시겠습니까?")){
                    	event.preventDefault();
                    }
                }
            </script>

        </section>
        <!-- section end -->

        <%@ include file="/views/common/footer.jsp" %>
        
    </div>
</body>
</html>