<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page import="java.util.Calendar"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" href="/images/favicon.ico" type="image/x-icon" />
<title>직원용</title>

</head>
<body>

	<%
		session.setAttribute("username", request.getParameter("username"));

		Calendar cal = Calendar.getInstance();

		int year = cal.get(Calendar.YEAR);
		int month1 = cal.get(Calendar.MONTH);
		int month = month1 + 1;
		int date = cal.get(Calendar.DATE);

		String strYear = request.getParameter("year");
		String strMonth = request.getParameter("month");

		if (strYear != null) {
			year = Integer.parseInt(strYear);
			int month2 = Integer.parseInt(strMonth);
			month = month2++;
		}
	%>
	<sec:authentication property="principal.username" var="username" />

	<div class="wrapper">
		<jsp:include page="boardTemplelet.jsp"></jsp:include>


		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td align="center"><a
					href="<c:url value='/board/daily' />?year=<%=year - 1%>&amp;month=<%=month%>"
					target="_self"> <b>&lt;&lt;</b> <!-- 이전해 -->
				</a> <%
 	if (month > 1) {
 %> <a
					href="<c:url value='/board/daily' />?year=<%=year%>&amp;month=<%=month - 1%>"
					target="_self"> <b>&lt;</b> <!-- 이전달 -->
				</a> <%
 	} else {
 %><a
					href="<c:url value='/board/daily' />?year=<%=year - 1%>&amp;month=<%=month + 11%>"
					target="_self"> <b>&lt;</b> <!-- 이전달 -->
				</a> <%
 	}
 %> &nbsp;&nbsp; <%=year%>년 <%=month%>월 &nbsp;&nbsp; <%
 	if (month < 12) {
 %> <a
					href="<c:url value='/board/daily' />?year=<%=year%>&amp;month=<%=month + 1%>"
					target="_self"> <!-- 다음달 --> <b>&gt;</b>
				</a> <%
 	} else {
 %> <a
					href="<c:url value='/board/daily' />?year=<%=year + 1%>&amp;month=<%=month - 11%>"
					target="_self"> <!-- 다음해 --> <b>&gt;&gt;</b>
				</a> <%
 	}
 %> <a
					href="<c:url value='/board/daily' />?year=<%=year + 1%>&amp;month=<%=month%>"
					target="_self"> <!-- 다음해 --> <b>&gt;&gt;</b>
				</a></td>
			</tr>
		</table>

		<p>
		<h4 class="title">결재할 문서</h4>
		</p>
		<table class="table table-striped">
			<thead class="thide">
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
			</thead>
			<tbody>

				<c:forEach var="signs" items="${sign}">
					<c:choose>
						<c:when test="${signs.signlevel lt user.job_id and signs.department eq user.department}">
							<tr class="trtr">
								<td class="thide" align="center" width="10%">${signs.signno }</td>
								<td class="tbold"><a
									href="/sign/check/${signs.signno }">${signs.docname }</a></td>
								<td align="center">${signs.name}</td>
								<td align="center">${signs.reg_date }</td>
								<td align="center">${signs.signlevel }</td>
							</tr>
						</c:when>
					</c:choose>
				</c:forEach>

			</tbody>
		</table>
		<div id="PAGE_NAVI"></div>
		<table width="100%" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td colspan="4" height="5"></td>
			</tr>
			<tr align="center">
				<td><input type=button value="글쓰기"
					onclick="location.href='/sign/post'" class="btn"></td>
			</tr>
		</table>


		<p>
		<h4 class="title">결재한 문서</h4>
		</p>
		<table class="table table-striped">
			<c:forEach var="signs" items="${sign}">
				<c:choose>
					<c:when
						test="${signs.checkman$1 eq user.name or signs.checkman$2 eq user.name or signs.checkman$3 eq user.name}">
						<tr class="trtr">
							<td class="thide" align="center" width="10%">${signs.signno }</td>
							<td class="tbold"><a href="/sign/check/${signs.signno }">${signs.docname }</a></td>
							<td align="center">${signs.name}</td>
							<td align="center">${signs.reg_date }</td>
							<td align="center">${signs.signlevel }</td>
						</tr>
					</c:when>
				</c:choose>
			</c:forEach>
		</table>
		
		<p>
		<h4 class="simple-text">내가 쓴 문서</h4>
		</p>
		<table class="table table-striped">
			<c:forEach var="signs" items="${sign}">
				<c:choose>
					<c:when
						test="${signs.name eq user.name}">
						<tr class="trtr">
							<td class="thide" align="center" width="10%">${signs.signno }</td>
							<td class="tbold"><a href="/sign/check/${signs.signno }">${signs.docname }</a></td>
							<td align="center">${signs.name}</td>
							<td align="center">${signs.reg_date }</td>
							<td align="center">${signs.signlevel }</td>
						</tr>
					</c:when>
				</c:choose>
			</c:forEach>
		</table>
		

	</div>
</body>
<script type="text/javascript">

$(document).ready(function(){
	fn_selectBoardList(1);
});


var gfv_ajaxCallback = "";
function ComAjax(opt_formId){
	this.url = "";
	this.formId = gfn_isNull(opt_formId) == true? "commonForm":opt_formId;
	this.param = "";
	
	if(this.formId == "commonForm"){
		var frm = $("#commonForm");
		if(frm.length > 0){
			frm.remove();
		}
		var str = "<form id = 'commonForm' name='commonform'></form>";
		$('body').append(str);
	}
	this.setUrl = function setUrl(url){
		this.url = url;
	};
	
	this.setCallback = function setCallback(callback){
		gfv_ajaxCallback = callback;
	};
	
	this.addParam = function addParam(key,value){
		this.param = this.param + "&" + key + "=" + value;
	};
	
	this.ajax = function ajax(){
		if(this.formId != "commonForm"){
			this.param += "&" + $("#" + this.formId).serialize();
		}
		$.ajax({
			url = this.url,
			type : "POST",
			data : this.param,
			async : false,
			success : function(data, status){
				alert("통신은 된다");
				if(typeof(gfv_ajaxCallback) == "function"){
					gfv_ajaxCallback(data);
				}
				else{
					eval(gfv_ajaxCallback + "(data);");
				}
			}
			error:function(status,error){
				alert("통신도 안됨")
			}
		});
	};
}

 var gfv_pageIndex = null;
 var gfv_eventName = null;
 function gfn_renderPaging(params){
	 var divId = params.divId;
	 gfv_pageIndex = params.pageIndex;
	 var totalCount = params.totalCount;
	 var currentIndex = $("#"+params.pageIndex).val();
	 if($("#"+params.pageIndex).length ==0 || gfn_isNull(currentIndex) == true){
		 currentIndex = 1;
	 }
	 
	 var recordCount = params.recordCount;
	 if gfn_isNull(recordCount) == true){
		 recordCount = 20;
	 }
	 var totalIndexCount = Math.ceil(totalCount / recordCount);
	 gfv_eventName = params.eventName;
	 
	 $("#"+divID).empty();
	 var preStr = "";
	 var postStr = "";
	 var str = "";
	 
	 var first = (parseInt((currentIndex-1)/10)*10)+1;
	 var last = (parseInt(totalIndexCount/10) == parseInt(currentIndex/10)) ? totalIndexCount%10 : 10;
	 var prev = (parseInt((currentIndex-1)/10)*10) - 9 > 0 ? (parseInt((currentIndex-1)/10) * 10) - 9 : 1;
	 var next = (parseInt((currentIndex-1)/10)+1) * 10 + 1 < totalIndexCount ? (parseInt((currentIndex-1)/10)+1) * 10 + 1 : totalIndexCount;
	 
	 if(totalIndexCount > 10){
		preStr += "<a href='#this' onclick='_movePage(1)'>[<<]</a>" +
		"<a href='#this' onclick='_movePage("+prev+")'>[<]</a>";
		
		postStr += "<a href='#this' onclick='_movePage("+next+")'>[>>]</a>" +
		"<a href='#this' onclick='_movePage("+totalIndexCount+")'>[>]</a>";
	 }else if(totalIndexCount <=10 && totalIndexCount > 1){
		 preStr += "<a href='#this' onclick='_movePage(1)'>[<<]</a>";
		 postStr += "<a href='#this' onclick='_movePage("+totalIndexCount+")'>[>>]</a>";
	 }
	 
	 for(var i=first; i<first+last); i++){
		 if(i != currentIndex){
			 str += "<a href='#this' onclick='_movePage("+i+")'>"+i+"</a>";
		 }else{
			 str += "<b><a href='#this' onclick='_movePage("+i+")'>"+i+"</a></b>";
		 }
	 }
	 $("#"+divId).append(preStr + str + postStr);
	 
 }
 
 function _movePage(value){
	 $("#"+gfv_pageIndex).val(value);
	 if(typeof(gfv_eventName) == "function"){
		 gfv_eventName(value);
	 }else{
		 eval(gfv_eventName + "(value);");
	 }
 }
 
 
 function fn_selectBoardList(pageNo){
	 var comAjax = new ComAjax();
	 comAjax.setUrl("<c:url value='/sign'/>");
	 comAjax.setCallback("fn_selectBoardListCallback");
	 comAjax.addParam("PAGE_INDEX",pageNo);
	 comAjax.addParam("PAGE_ROW",15);
	 comAjax.ajax();
 }
 
 function fn_selectBoardListCallback(data){
	 var total = data.TOTAL;
	 var body = $("table>tbody");
	 body.empty();
	 if(total == 0){
		 var str = "<tr><td colspan='4'>조회된 결과가 없습니다.</td></tr>";
		 body.append(str);
	 }else{
		 var params = {
				 divId : "PAGE_NAVI",
				 pageIndex : "PAGE_INDEX",
				 totalCount : total,
				 eventName : "fn_selectBoardList"
		 };
		 gfn_renderPaging(paramas);
		 
		 var str = "";
		 $.each(data.list, function(key,value){
			 str += "<tr class='trtr'>"+
						"<td class='thide' align='center' width='10%'>${signs.signno }</td>"+
						"<td class='tbold'>"+
						"<a href='/sign/check/${signs.signno }'>${signs.docname }</a></td>"+
						"<td align='center'>${signs.name}</td>"+
						"<td align='center'>${signs.reg_date }</td>"+
						"<td align='center'>${signs.signlevel }</td>"+
					"</tr>"
		 });
		 body.append(str);
	 }
	 
 }
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 

</script>

</html>
