<%@ page import="com.nullp.model.RevDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/main.css">
<style type="text/css">
#content h2 {
	width: 30%;
}

#revBtn>a {
	margin: 10px auto;
	display: block;
	width: 100px;
	height: 35px;
	box-sizing: border-box;
	border: 2px solid grey;
	border-radius: 4px;
	text-align: center;
	line-height: 35px;
	color: rgba(0, 0, 0, 0.5);
	background-color: rgba(122, 122, 0, 0.3);
	text-decoration: none;
}

#content table {
	margin: 0px auto;
}

#content thead>tr>th {
	margin-bottom: 10px;
	padding-bottom: 10px;
	border-bottom: 3px solid rgba(122, 122, 0, 0.3);
}

#content tbody {
	
}

#content tbody>tr {
	height: 50px;
}

#content tbody>tr>td {
	text-align: center;
	border-bottom: 1px, dashed, rgba(122, 122, 0, 0.2);
}

#content tbody>tr>td>a {
	color: black;
	text-decoration: none;
}
</style>
<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
<jsp:useBean id="login" class="com.user.UserBean" scope="session" />
<jsp:setProperty property="*" name="login" />
<script type="text/javascript">

var first=false;

var cnt = 12;

var morelist = function(){
	cnt=cnt+5;
	$.ajax({
	        url : "http://192.168.99.100:8888/review/revList.do",
        	type : 'GET',
        	data : {cnt:cnt},
        	success : function(data) {
        				
             },
        	error : function() {
        		alert("error");
        	}
});
}

$(function() {
	cnt=12;
	console.log("reload");
	$.ajax({
        url : "http://192.168.99.100:8888/review/revList.do",
    	type : 'GET',
    	data : {cnt:cnt},
    	success : function(data) {
    				
         },
    	error : function() {
    		alert("error");
    	}
	});	
	listLoading();
});




var listLoading=function(){
	
	$.getJSON('http://192.168.99.100:8888/review/revList.do', function(data){
		data.rev.forEach(function(ele) {
			$('<tr/>')
				.append($('<td/>').html('<a href="detail.do?rnum='+ele.rnum+'">'+ele.uname+'</a>'))
				.append($('<td/>').html('<a href="detail.do?rnum='+ele.rnum+'">'+ele.sub+'</a>'))
				.append($('<td/>').html('<a href="detail.do?rnum='+ele.rnum+'">'+ele.writedate+'</a>'))
				.append($('<td/>').html('<a href="detail.do?rnum='+ele.rnum+'">'+ele.viewCnt+'</a>'))
				.appendTo('tbody');
		});
	})
}

$(window).scroll(function(){
    if(($(window).scrollTop()/($(document).height()-window.innerHeight)*100)==100){
		console.log("100");
		setTimeout(morelist(), 5000);
		listLoading();
    }
});
if(performance.navigation.type==1){
	
}
</script>
</head>
<body>

	<jsp:include page="../template/header.jsp">
		<jsp:param value=".." name="path" />
	</jsp:include>

	<div id="content">
		<h2>?????? ??????</h2>
		<p id="revBtn">
			<a href="add.do">?????? ??????</a>
		</p>
		<table>
			<thead>
				<tr>
					<th>?????????</th>
					<th width="60%">??????</th>
					<th width="10%">??????</th>
					<th width="10%">?????????</th>
				</tr>
			</thead>
			<tbody>

			</tbody>
		</table>
	</div>
	<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>
