<%@page import="com.galgoda.hotel.model.vo.Tag"%>
<%@page import="com.galgoda.common.model.vo.Attachment"%>
<%@page import="java.util.List"%>
<%@page import="com.galgoda.hotel.model.vo.Hotel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Hotel h  = (Hotel)request.getAttribute("h");
	List<Tag> list = (List<Tag>)request.getAttribute("list");
	List<Attachment> alist = (List<Attachment>)request.getAttribute("alist");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔등록현황 상세조회</title>
<style>
.page_content {
    width: 100%; 
    padding-top: 30px;
    padding-left: 30px;
    padding-right: 30px;
}

/* 페이지컨텐츠 영역*/
.contentName{
    color: rgb(115, 90, 75);
}
#buttonColor{
    background-color: rgb(115, 90, 75); 
    color: white;
}
#buttonColor:hover{
    color: lightgray;
}
#buttonColor2{
    margin-right: 5px; 
    background-color: rgb(235, 231, 227); 
    border: none; color: black;
}
#buttonColor2:hover{
    color: gray;
}

/* 메인컨텐츠  */
#title1 {font-size: 30px; font-weight: bold;  color: rgb(115, 90, 75);}
#title2 {font-size: 25px; font-weight: bold;  color: rgb(115, 90, 75);}
#title3 {font-size: 20px; font-weight: bold; }
#btnname {background-color: #EBE7E3; font-size: 15px; border: 1px solid #D4D4D4 ; width: 85px; height: 40px; padding: 7px;  pointer-events : none;}
#btnlarge {background-color: #EBE7E3; font-size: 15px; border: 1px solid #D4D4D4 ; width: 170px; height: 40px; padding: 7px;  pointer-events : none;}
#btnbrown {background-color: #634C46; color: white; font-size: 15px; border: 1px solid #D4D4D4 ; width: 113px; height: 40px; padding: 7px; margin-left: 6px;}
#btnconfirm {background-color: #EBE7E3; font-size: 15px; border: 1px solid #D4D4D4 ; width: 85px; height: 40px; padding: 7px;  }
 #td1 {width:94px ; }
 #td2 {width:600px ;}
 #td3 {width:150px ; }
 #td4 {display: inline-block;}
 
 .hotel_content td {padding-bottom: 7px;}
 .form-controller input {width: 100%;}
 .add_content { 
    display: inline-block;
    width: 100%;
    min-height: 100px;
    padding: 20px;
    height: 100%;
    }
 #refund {
  	display: inline-block;
    width: 100%;
    min-height: 200px;
    padding: 20px;
    height: 100%;
 }
.add_content>input{ margin-right: 10px;}
.page_content label { margin-left: 10px; margin-right: 15px; }

</style>
</head>
<body>
	<div class="wrap">
        <%@ include file="/views/common/adminHeader.jsp" %>
		<% if(loginAdmin==null){ %>
		 	 <script>
		        location.href = "<%=contextPath %>";
		    </script>
		<%} %>

        <section class="main_content">
            
            <div class="sideMenubar">
                <ul class="nav flex-column">
                    <li >
                        <h3 style="margin-left: 10px; margin-right: 30px; margin-top: 10px; border-bottom: 1px solid black;">호텔관리</h3>
                    </li>
                    
                    <li>
                        <a class="nav-link" href="<%=contextPath %>/hotelList.su?page=1" style="background-color: rgb(115, 90, 75); color: white;" >호텔등록 현황</a>
                    </li>
                    <li>
                        <a class="nav-link" href="<%=contextPath %>/codeList.su?page=1" >호텔코드 등록</a>
                    </li>
                    <li>
                        <a class="nav-link" href="<%=contextPath %>/tag.su" >태그 관리</a>
                    </li>
                    <li>
                        <a class="nav-link" href="<%=contextPath %>/option.su" >추가옵션 관리</a>
                    </li>
                </ul>
            </div>

            <div class="page_content" style="margin-bottom: 150px;">

                <span id="title1">호텔관리</span> <span id="title2"> - 호텔 정보 수정</span>
                <div style="border : 1px solid lightgray; margin-bottom: 16px;"></div>
                
                <div class="hotel_content" style="padding-left: 20px;">
                <span id="title3">호텔정보</span>
                    <form action="<%= contextPath %>/hotelUpdate.su" method="post"  onsubmit=" updateHotel();" enctype="multipart/form-data">
                        <input type="hidden" name="no" value="<%=h.getMemNo()%>">
                        <table class="table2">
                            <tr>
                                <td id="td1"><button class="btn" id="btnname" type="button"  >호텔명</button></td>
                                <td id="td2"><input type="text" class="form-control" required readonly name="hotelName" value="<%= h.getHotelName() %>"></td>
                            </tr>
                            </table>
                            <table>
                            <tr>
                                <td id="td1"><button class="btn " id="btnname" type="button" >주소</button></td>
                                <td style="width: 480px ;">
                                	<input type="text" name="addr2" style="z-index: -1; position: absolute;" required value="<%= h.getHotelAddress() %>">
                                	<input type="text" class="form-control" name="addr2" id="addr2" disabled value="<%= h.getHotelAddress() %>"></td>
                                <td><button class="btn" id="btnbrown" type="button" onclick="execPostCode();">우편번호 찾기</button></td>
                            </tr>
                            </table>
                            <table>
                            <tr>
                                <td id="td1"></td>
                                <td id="td2"><input type="text" class="form-control" name="hotelDetailAdd" value="<%= h.getHotelDetailAdd() %>"></td>
                            </tr>
                            <tr>
                                <td id="td1"><button class="btn " id="btnname" type="button" >대표전화</button></td>
                                <td id="td2"><input type="text" class="form-control" required name="hotelTel" value="<%=h.getHotelTel() %>"></td>
                            </tr>
                            <tr>
                                <td id="td1"><button class="btn" id="btnname" type="button" >홈페이지</button></td>
                                <td id="td2"><input type="url" class="form-control" name="hotelSite" value="<%= h.getHotelSite() %>"></td>
                            </tr>
                        </table>

                        <table>
                            <tr>
                                <td id="td1"><button class="btn" id="btnlarge" type="button" >체크인/체크아웃시간</button></td>
                                <td id="td3">  <input type="number" class="form-control" min="0" max="24" step="1" name="hotelCheckin" value="<%= h.getHotelCheckin() %>" style="margin-left: 8px;" required></td><td> &nbsp; &nbsp;&nbsp;PM &nbsp;&nbsp;/ &nbsp;&nbsp; </td>    
                                              <td id="td3">  <input type="number"  class="form-control" name="hotelCheckout" min="0" max="24" step="1" value="<%= h.getHotelCheckout() %>" required></td> <td> &nbsp;&nbsp;AM </td>
                                </td>
                            </tr>
                        </table>
                        <table>
                            <tr>
                                <td id="td4"><button class="btn " id="btnname" type="button" style="vertical-align: top; display:inline-block" >중요사항</button></td>
                                <td id="td2" >
                                     <div class="form-control add_content" id="hoDetail">   
                                        <label><input type="checkbox" name="hotelDetail" value="에어컨"> &nbsp;에어컨</label>
                                        <label><input type="checkbox" name="hotelDetail" value="세탁서비스"> &nbsp;세탁서비스</label>
                                        <label><input type="checkbox" name="hotelDetail" value="공용주방"> &nbsp;공용주방</label>
                                        <label><input type="checkbox" name="hotelDetail" value="공항셔틀서비스"> &nbsp;공항 셔틀 서비스</label>
                                        <label><input type="checkbox" name="hotelDetail" value="무료wifi"> &nbsp;무료 wi-fi</label>
                                        <label><input type="checkbox" name="hotelDetail" value="조식"> &nbsp;조식</label>
                                        <label><input type="checkbox" name="hotelDetail" value="주방용"> &nbsp;주방용</label>   
                                   
                                   
                                   </div>
                                </td>
                            </tr>
                            <tr>
                                <td id="td4"><button class="btn " id="btnname" type="button" >태그</button></td>
                                <td id="td2">
                                    <div class="form-control add_content">   
                                        
                                        <% for(Tag t : list){ %>
                                        	
                                        		<label><input type="checkbox" name="hotelTag" value="<%= t.getTagNo() %>" > &nbsp;<%= t.getTagName() %></label>
                                       		
                                        <% } %>
             
                                    </div>

                                </td>
                            </tr>
                            <tr>
                                <td id="td4"><button class="btn" id="btnname" type="button" >호텔소개</button></td>
                                <td id="td2">
                                    <textarea class="form-control" name="hotelIntro" placeholder="내용 입력" 
                                    cols="35" rows="5" style="resize:none;"><%= h.getHotelIntro() %></textarea>
                                    </td>
                            </tr>
                            <tr>
                                <td id="td4"><button class="btn " id="btnname" type="button" >취소정책</button></td>
                                <td id="td2">
                                    <div class="form-control add_content" id="refund">   
                                        <label><input type="radio" name="refundpolicy" value="1" > &nbsp; 체크인 1일 전 예약 취소 시 전액 환불됩니다. 체크인 1일 이내 취소
                                                                    또는 노쇼(No-show)의 경우 전액 환불되지 않습니다.</label>
                                        <label><input type="radio" name="refundpolicy" value="2" > &nbsp; 체크인 5일 전 예약 취소 시 전액 환불됩니다. 체크인 5일 이내 취소
                                            또는 노쇼(No-show)의 경우 전액 환불되지 않습니다.</label>
                                        <label><input type="radio" name="refundpolicy" value="3" > &nbsp; 체크인 7일 전 예약 취소 시 전액 환불됩니다. 체크인 7일 이내 취소
                                            시 50% 환불되며, 노쇼(No-show)의 경우 전액 환불되지 않습니다.</label>
                                       
                                    </div>

                                </td>
                            </tr>
                            <tr>
                                <td id="td1"><button class="btn" id="btnname" type="button" >대표사진</button></td>
                                <td id="td2">
                                <input type="text" value="<%= h.getImgPath() %>" readonly class="form-control">
                                <input type="file" name="hotelImgPath"  class="form-control">
                                </td>
                            </tr>
                            <tr>
                                <td id="td4"><button class="btn" id="btnname" type="button" >사진추가</button></td>
                                <td id="td2">
                                   <div class="form-control add_content" style="height: 250px">   
                                    
                                   <% for(Attachment a : alist){ %>
                                   		<input type="text" value="<%= a.getOriginName()%>" readonly class="form-control">
                                   <% } %>
                                   <input type="file" name="upload_file1" class="form-control" >
                                    <input type="file" name="upload_file2" class="form-control">
                                    <input type="file" name="upload_file3" class="form-control">
                                   
                                   </div>
                                   
                               
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">&nbsp;</td>
                            </tr>
                            <tr style="margin-bottom: 20px;">
                                <td  colspan="2" align="right"  id="td1">
                                    <a href="<%=contextPath%>/detailMem.su?no=<%=h.getMemNo() %>" class="btn" id="buttonColor2" type="button" style="width: auto;">담당자정보 조회</a>
                                    <button class="btn" id="buttonColor" type="submit">수정하기</button>
                                    <a href="<%=contextPath%>/deleteHotel.su?no=<%=h.getHotelNo() %>" class="btn" id="buttonColor" type="button">삭제하기</a>
                                </td>
                            </tr>
                        </table>
                    </form>
					
					
					
					<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                     
                    <script>
                    
                    /* 체크박스 체크 부분 */
                    $(function(){
                    	
                    	/* 호텔디테일부분*/
                    	var hoDetail = '<%= h.getHotelDetail() %>';
                    	var  d = hoDetail.split(",");
                    	
                    	for(var i = 0; i<d.length; i++){
                    			 $('input:checkbox[name=hotelDetail][value='+d[i]+']').attr("checked", true).parent().addClass('on');
                    	}    
                    	 
                    	/* 환불규정부분 */ 
     					var repolicy = '<%= h.getRefundpolicy() %>';
                        	$('input:radio[name=refundpolicy][value='+repolicy+']').attr("checked", true).parent().addClass('on');

                        /* 태그부분 */
     	               	var taglist = '<%= h.getTagNo() %>';
     	                var  v = taglist.split(",");
     	                        	
     	                for(var j = 0; j<v.length; j++){
     	                        $('input:checkbox[name=hotelTag][value='+v[j]+']').attr("checked", true).parent().addClass('on');
     	                } 
                          
                    })
                  
                    /* 체크박스 끝 */
                    
                    
                    
                        function updateHotel(){
                            if(confirm("호텔을 수정하시겠습니까?")){
                               
                            }
                        }
                        
                        
                        /* 우편번호 찾기 api부분 */
                        function execPostCode() {
                            new daum.Postcode({
                                oncomplete: function(data) {
                                   // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                    
                                   // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                                   // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                                   var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                                   var extraRoadAddr = ''; // 도로명 조합형 주소 변수
                    
                                   // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                                   // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                                   if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                                       extraRoadAddr += data.bname;
                                   }
                                   // 건물명이 있고, 공동주택일 경우 추가한다.
                                   if(data.buildingName !== '' && data.apartment === 'Y'){
                                      extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                                   }
                                   // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                                   if(extraRoadAddr !== ''){
                                       extraRoadAddr = ' (' + extraRoadAddr + ')';
                                   }
                                   // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                                   if(fullRoadAddr !== ''){
                                       fullRoadAddr += extraRoadAddr;
                                   }
                    
                                   // 우편번호와 주소 정보를 해당 필드에 넣는다.
                                   console.log(data.zonecode);
                                   console.log(fullRoadAddr);
                                   
                                   
                                   $("[name=addr1]").val(data.zonecode);
                                   $("[name=addr2]").val(fullRoadAddr);
                                   
                                   /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
                                   document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
                                   document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
                               }
                            }).open();
                            
                           
                        }
                        /* 우편번호 찾기 부분 끝 */


                    </script>
                </div>
            </div>
        
            <!-- 메인 부분  끝 -->


        </section>

         <%@ include file="/views/common/footer.jsp" %>
    </div> 
</body>
</html>