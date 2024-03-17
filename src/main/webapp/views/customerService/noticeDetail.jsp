<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.galgoda.notice.model.vo.Notice" %>
<%
	Notice n = (Notice)request.getAttribute("n");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	/* 사용자_공지사항상세페이지 스타일 */
        .space {
            padding: 10px;
        }

        .page_content table {
            margin-top: 30px;
            width: 90%;
        }

        .page_content th {
            background-color: rgb(235, 231, 227);
            width: 100px;
            text-align: center;
        }
        .sideMenubar_head {
            width: 80%;
            margin-left: 10px;
            margin-right: 30px;
            margin-top: 10px;
            border-bottom: 1px solid gray;
        }
</style>
</head>
<body>
	<div class="wrap">
        
        <%@ include file="/views/common/header.jsp" %>

        <!-- section start -->
        <section class="main_content">
			<% if(loginCustomer != null || loginCustomer == null && loginHotel == null && loginAdmin == null) { %>
            <div class="sideMenubar">
                <ul class="nav flex-column">
                    <li>
                        <h3 class="sideMenubar_head">고객센터</h3>
                    </li>

                    <li style="background-color: rgb(115, 90, 75);">
                        <a class="nav-link" style="color: white;" href="#" data-toggle="collapse" data-target="#demo">공지사항</a>
                    </li>

                    <li>
                        <a class="nav-link" href="#" data-toggle="collapse" data-target="#demo2">자주 묻는 질문</a>
                    </li>

                    <li>
                        <a class="nav-link" href="#aaa" data-toggle="collapse">1:1문의</a>
                    </li>
                    <li>
                        <div class="collapse" id="aaa" style="margin-left: 30px;">
                            <a href="">문의하기</a>
                        </div>
                    </li>
                    <li>
                        <div class="collapse" id="aaa" style="margin-left: 30px;">
                            <a href="">문의내역</a>
                        </div>
                    </li>


                </ul>
            </div>

            <div class="page_content">

                <h2 class="contentName">공지사항</h2>
                <div style="margin-top: 10px; border: 2px solid lightgray;"></div>

                <div style="margin-bottom: 50px;">
                    <table align="center">
                        <tr>
                            <th>제목</th>
                            <td colspan="2">
                                <input type="text" name="title" style="width: 100%; text-align: center;" value="<%= n.getNoticeTitle() %>" readonly>
                            </td>
                        </tr>
                        <tr>
                            <td class="space" colspan="3"></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="margin-top: 20px;">
                                <textarea name="" rows="20" style="resize: none; width: 100%;" readonly><%= n.getNoticeContent() %></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th>작성일</th> 
                            <td style="border: 1px solid gray; width: 100px; text-align: center;"><%= n.getRegistDate() %></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td colspan="3" class="space"></td>
                        </tr>
                    </table>
                </div>
            </div>
            <% }else if(loginHotel != null) { %>
            <div class="sideMenubar">
                <ul class="nav flex-column">
                    <li >
                        <h3 style="margin-left: 10px; margin-right: 30px; margin-top: 10px; border-bottom: 1px solid black;">마이페이지</h3>
                    </li>
                    
                    <li>
                        <a class="nav-link "  href="" data-toggle="collapse" data-target="#demo">호텔관리</a>
                    </li>
                    <li > <div id="demo" class="collapse " style="margin-left: 30px;"><a href="">호텔등록</a></div> </li> 
                    <li > <div id="demo" class="collapse " style="margin-left: 30px;"><a href="">호텔 정보 수정</a></div> </li>  
                    <li > <div id="demo" class="collapse " style="margin-left: 30px;"><a href="">객실등록</a></div> </li>  
                    <li> <div id="demo"  class="collapse " style="margin-left: 30px;"><a href="">객실수정</a></div> </li>  
                    <li > <div id="demo" class="collapse " style="margin-left: 30px;"><a href="">리뷰 관리</a></div> </li>   
                    
                    
                    <li>
                        <a class="nav-link"  href="#">예약관리</a>
                    </li>
                  
                    <li>
                        <a class="nav-link" style="color: black;" href="#" data-toggle="collapse" data-target="#demo3">담당자 정보 수정</a>
                    </li>
                        
                    
                    <li>
                         <a class="nav-link" style="color: white; background-color: rgb(115, 90, 75);" href="#" data-toggle="collapse" data-target="#demo4">고객센터</a>
                    </li>
                    <li style="background-color: #BFB4B0;"> <div id="demo4" class="collapse show" style="margin-left: 30px;"><a href="">공지사항</a></div> </li>   
                    <li> <div id="demo4" class="collapse show" style="margin-left: 30px;"><a href="">문의사항</a></div> </li>   
                </ul>
            </div>
            <div class="page_content">

                <h2 class="contentName">공지사항</h2>
                <div style="margin-top: 10px; border: 2px solid lightgray;"></div>

                <div style="margin-bottom: 50px;">
                    <table align="center">
                        <tr>
                            <th>제목</th>
                            <td colspan="2">
                                <input type="text" name="title" style="width: 100%; text-align: center;" value="<%= n.getNoticeTitle() %>" readonly>
                            </td>
                        </tr>
                        <tr>
                            <td class="space" colspan="3"></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="margin-top: 20px;">
                                <textarea name="" rows="20" style="resize: none; width: 100%;" readonly><%= n.getNoticeContent() %></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th>작성일</th> 
                            <td style="border: 1px solid gray; width: 100px; text-align: center;"><%= n.getRegistDate() %></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td colspan="3" class="space"></td>
                        </tr>
                        <% if(loginHotel.getMemNo() == n.getMemNo()) { %>
                        <tr>
                            <td colspan="3" align="right">
                                <a class="btn" style="background-color: rgb(115, 90, 75); color: white;">수정</a>
                                <button type="button" class="btn" style="background-color: rgb(235, 231, 227);" onclick="deleteNotice();">삭제</button>
                            </td>
                        </tr>
                        <% } %>
                    </table>
                </div>
            </div>
            
            <% }else if(loginAdmin != null) { %>
            <div class="sideMenubar">
                <ul class="nav flex-column">
                    <li>
                        <h3 class="sideMenubar_head">고객센터 관리</h3>
                    </li>

                    <li style="background-color: rgb(115, 90, 75);">
                        <a class="nav-link" style="color: white;" href="#">공지사항 관리</a>
                    </li>

                    <li>
                        <a class="nav-link" href="#">문의사항 관리</a>
                    </li>

                    <li>
                        <a class="nav-link" href="#" data-toggle="collapse" data-target="#aaa">신고 관리</a>
                    </li>
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

                <h2 class="contentName">공지사항</h2>
                <div style="margin-top: 10px; border: 2px solid lightgray;"></div>

                <div style="margin-bottom: 50px;">
                    <table align="center">
                        <tr>
                            <th>제목</th>
                            <td colspan="2">
                                <input type="text" name="title" style="width: 100%; text-align: center;" value="<%= n.getNoticeTitle() %>" readonly>
                            </td>
                        </tr>
                        <tr>
                            <td class="space" colspan="3"></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="margin-top: 20px;">
                                <textarea name="" rows="20" style="resize: none; width: 100%;" readonly><%= n.getNoticeContent() %></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th>작성일</th> 
                            <td style="border: 1px solid gray; width: 100px; text-align: center;"><%= n.getRegistDate() %></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td colspan="3" class="space"></td>
                        </tr>
                        <% if(loginAdmin.getAdminNo() == n.getAdminNo()){ %>
                        <tr>
                            <td colspan="3" align="right">
                                <a class="btn" style="background-color: rgb(115, 90, 75); color: white;">수정</a>
                                <button type="button" class="btn" style="background-color: rgb(235, 231, 227);" onclick="deleteNotice();">삭제</button>
                            </td>
                        </tr>
                        <% } %>
                    </table>
                </div>
            </div>
            
            <% } %>
      		<script>
                function deleteNotice(){

                    if(confirm("해당 공지사항을 삭제하시겠습니까?")){
                        alert("공지사항이 삭제되었습니다.");
                    }
                }
            </script>
            
        </section>
        <!-- section end -->

        <%@ include file="/views/common/footer.jsp" %>
        
    </div>
</body>
</html>