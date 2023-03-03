<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/main.css">
<style type="text/css">
#content button{
	margin:10px auto;
	display: inline-block;
	width:100px;
	height: 35px;
	box-sizing: border-box;
	border: 2px solid grey;
	border-radius: 4px;
	text-align: center;
	line-height: 35px;
	color: rgba(0,0,0,0.5);
	background-color: rgba(122,122,0,0.3);
	text-decoration: none;
}
form{
	width: 70%;
	margin: 0px auto;
}
form div{
	margin: 10px;
}
form div>span{
	width: 150px;
	display: inline-block;
	padding-left: 10px;
}

form div>span:nth-child(2n+1){
	background-color: rgba(122,122,0,0.3);
}

form #sub>span{
	width: 300px;
	font-size: 20px;
	font-weight: bold;
	background-color: white;
}
form #innerContent>span{	
	background-color: white;
}
textarea{
	width:600px; 
	height:400px; 
    resize:none;
	border: medium solid black;
	border-radius: 10px;
	padding: 10px;
	margin: 10px;
}
</style>
<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">

var loadData=function(rnum){
	$.ajax({
		url: 'http://192.168.99.100:8888/review/one.do',
// 		type:'GET',	
		contentType:'application/x-www-form-urlencoded; charset=utf-8',
		data:{rnum:rnum},
		dataType:"json",	//보내주는 곳(OneController line21)과 받는 곳에서 데이터 타입을 일치시키는게 좋다
		success:function(data){			//성공시 success 콜백
			$('#content input')
			.eq(0).val(data.revOne[0].rnum)
			.end().eq(1).val(data.revOne[0].sub);
			$('#content span')
			.eq(1).text(data.revOne[0].rnum)
			.end().eq(3).text(data.revOne[0].writedate)
			.end().eq(5).text(data.revOne[0].uname)
			.end().eq(7).text(data.revOne[0].viewcnt);
			$("#content span textarea").val(data.revOne[0].content);


		},
		error: function() {  //실패시 error 콜백 ( success나 error 둘 중 하나만 나옴)
			console.log('------------');
		}
	});
};


$(function(){
	var rnum=location.search.substr(location.search.indexOf('=')+1);
	console.log(rnum);
	loadData(rnum);
	
	
	$('#content').find('a').last().click(function() {
		history.back();
	})
	.prev().click(function(){
		var url=$(this).attr('href');
		var param=url.substring(url.indexOf('?'+1));
		var url1=url.substring(0,url.indexOf('?'));
		console.log(url1+"\n"+param);
		if(confirm("삭제하시겠습니까?")){
		$.post(url,param,function(){
			location.replace('list.do');
		})
		}
		return false;
	});
	$('#content')
	.find('button')
		.last().click(function(){
			history.back();
		})
;

});
</script>
</head>
<body>
	
	<jsp:include page="../template/header.jsp">
				<jsp:param value=".." name="path"/>
	</jsp:include>

		<div id="content">
		<form method="post">
		<input type="hidden" name="rnum" >
			
			<div id="sub"><input name="sub"/></div>
			<div>
				<span>글 번호</span>
				<span></span>				
				<span>작성일</span>
				<span></span>				
			</div>
			<div>
				<span>작성자</span>
				<span></span>				
				<span>조회수</span>
				<span></span>				
			</div>
			<div id="innerContent">
				<span><textarea name="content"></textarea></span>
			</div>
			
			<div>
					<button>수정</button>
					<button type="reset">취소</button>
					<button type="button">뒤로</button>
			</div>
		</form>
		
		</div>
	<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>
