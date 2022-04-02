<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="http://localhost/jqpro/js/jquery-3.6.0.min.js"></script>
<style type="text/css">
select{
	margin : 20px;
	
}	
p{
	text-align: center;
}
table{
	margin : 50px auto;
	text-align: center;
}
.ziptr:hover{
	background : grey;
	}
</style>
</head>
<body>
<p><select id='sido' class="form-select form-select-lg mb-8"></select>
<select id='gugun' class="form-select form-select-lg mb-8"></select>
<select id='dong' class="form-select form-select-lg mb-8"></select><p>
<div id ="result" class="form-control"></div>
</body>
<script type="text/javascript">
	$.ajax({
		url : '/jqpro/ZipTableServlet.do',
		data : {"gubun" : '1'},
		type : 'get',
		success : function(res){
			str = "<option value='0'>시도</option>";
			$.each(res, function(i, v){
				str += "<option value = '" +v+ "'>"+v+"</option>";
			})
			$('#sido').html(str);
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
	
	$('#sido').on('change',function(){
		sido = $('option:selected', this).val();
		
		$.ajax({
			url : '/jqpro/ZipTableServlet.do',
			data : {"gubun" : '2',
					"sido" : sido	
			},
			type : 'get',
			success : function(res){
				str = "<option value='0'>구군</option>";
				$.each(res, function(i, v){
					str += "<option value = '" +v+ "'>"+v+"</option>";
				})
				$('#gugun').html(str);
			},
			error : function(xhr){
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'
	})
	})
		$('#gugun').on('change',function(){
		gugun = $('option:selected', this).val();
		
		$.ajax({
			url : '/jqpro/ZipTableServlet.do',
			data : {"gubun" : '3',
					"sido" : sido,
					"gugun": gugun
			},
			type : 'get',
			success : function(res){
				str = "<option value='0'>동</option>";
				$.each(res, function(i, v){
					str += "<option value = '" +v+ "'>"+v+"</option>";
				})
				$('#dong').html(str);
			},
			error : function(xhr){
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'
	})
	})
		$('#dong').on('change',function(){
		dong = $('option:selected', this).val();
		
		$.ajax({
			url : '/jqpro/ZipTableServlet.do',
			data : {"gubun" : '4',
					"sido" : sido,
					"gugun": gugun,
					"dong" : dong
			},
			type : 'get',
			success : function(res){
				str = "<table border='1' class = 'table table-dark table-hover'>";
				str +="<tr><td>우편번호</td>"
				str +="<td>시도</td>"
				str +="<td>구군</td>"
				str +="<td>동</td>"
				str +="<td>번지</td></tr>"
				$.each(res, function(i , v){
				str += "<tr class ='ziptr'><td>"+v.zipcode+"</td>";
				str += "<td>"+v.sido+"</td><td>"+v.gugun+"</td><td>"+v.dong+"</td>";	
				if(v.bunji != null){
					str += "<td>"+v.bunji+"</td></tr>";}
					else{str+="<td></td></tr>"}
					})
					str+="</table>"
					$('#result').html(str);
			},
			error : function(xhr){
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'
	})
	})
</script>
</html>