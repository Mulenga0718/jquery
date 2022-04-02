<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <script src="../js/jquery.serializejson.min.js"></script>
  <style type="text/css">

	#dong{
		margin-left : 20px;
	}
	.ziptr:hover{
		background : grey;
	}
	
</style>
  <script type="text/javascript">
  	$(function(){
  		//아이디 중복체크 
  		$('#idcheck').on('click', function(){
  			event.preventDefault();
  			
  			//입력한 값을 가져온다. 
  			idvalue = $('#id').val().trim();
  			//서버로 전송한다. 
  			
  			$.ajax({
  				url : '<%=request.getContextPath()%>/IdCheck.do',
  				type : 'get',
  				data : {'id' : idvalue},
  				success : function(res){
  					//alert(res.flag);
  					$('#idspan').html(res.flag).css('color','red');
  				},
  				error : function(xhr){
  				alert("상태 : "+xhr.status);
  				},
  				dataType : 'json'
  				
  			})
  			
  		})
  		
  		//우편번호 검색 
  		$('#zipsearch').on('click', function(){
  			event.preventDefault();
  			window.open("zipsearch.html", "우편번호", "width=500 height=400");
  		})
  	})
  	
  	$(function(){
  		//우편번호 찾기
	$('#btn1').on('click', function(){
			//입력한 값을 가져온다.
			dongvalue = $('#dong').val().trim();
			//서버로 전송
			$.ajax({
				url: '/jqpro/ZipSearch.do',
				type: 'get',
				data: {'dong' : dongvalue},
				success : function(res){
					str = "<table border ='1'>";
					str += "<tr><td>우편번호</td>";
					str += "<td>주소</td>";
					str += "<td>번지</td></tr>";
					
					$.each(res, function(i, v){
					str += "<tr class ='ziptr'><td>"+v.zipcode+"</td>";
					str += "<td>"+v.sido+v.gugun+v.dong+"</td>";
					
					if(typeof v.bunji != 'undefined'){
					str += "<td>"+v.bunji+"</td></tr>";}
					else{str+="<td></td></tr>"}
					})
					str+="</table>"
					$('#result1').html(str);
					
				},
				error : function(xhr){
					alert("상태 : "+xhr.status);
				},
				dataType: 'json'
			})

	})
	// 검색결과에서 선택하여 부모창에 입력 
	$(document).on('click', '.ziptr', function(){
		zipcode = $('td:eq(0)', this).text();
		addr = $('td:eq(1)',this).text();
		
		$('#zcode').val(zipcode);
		$('#addr').val(addr);
		
		
		$('#dong').val("");
		$('#result1').empty();
		$('#myModal').modal('hide');
	})
	
	$('form').on('submit',function(){
		//입력한 모든 값을 가져온다. 
		
		fdata = $('form').serialize();
		fdata2 = $('form').serializeArray();
		fdata3 = $('form').serializeJSON();
		console.log(fdata);
		console.log(fdata2);
		console.log(fdata3);
		
		
 		
		$.ajax({
			url : '<%=request.getContextPath() %>/Insert.do',
			data : fdata3,
			type : 'post',
			success : function(res){
				$('#joinspan').html(res.flag).css('color','red');s
			},
			error : function(xhr){
				alert("상태 : "+xhr.status);
			},
			dataType: 'json'
		
		}) 
		return false;
	})
	
})
  	
  </script>
</head>
<body>

<div class="container">
  <h2>회원 가입 </h2>
  <form class="needs-validation" novalidate>
    <div class="form-group">
      <label for="id">아이디</label>
      <button type="button" id ="idcheck" class="btn btn-info mb-2 mr-sm-2">중복검사</button><br>
      <input type="text" class="form-control col-sm-3" id="id" name="mem_id" required>
      <span id="idspan"></span>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    <div class="form-group">
        <label for="uname">이름</label>
      <input type="text" class="form-control col-sm-3" id="name" name="mem_name" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    <div class="form-group">
      <label for="birth">생년월일</label>
      <input type="date" class="form-control col-sm-3" id="birth" placeholder="Enter birth" name="mem_bir" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    <div class="form-group">
      <label for="pwd">비밀번호</label>
      <input type="password" class="form-control col-sm-3" id="pwd" name="mem_pass" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
	<div class="form-group">
      <label for="ph">휴대폰 번호 </label>
      <input type="text" class="form-control col-sm-3" id="hp" name="mem_hp" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    <div class="form-group">
      <label for="email">이메일 </label>
      <input type="text" class="form-control col-sm-3" id="email" placeholder="Enter email" name="mem_mail" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    <div class="form-group">
      <label for="zcode">우편번호</label>
      <button type="button" id ="zipsearch" class="btn btn-info mb-2 mr-sm-2">번호검색</button><br>
	<button type = "button" class="btn btn-info mb-2 mr-sm-2"  data-toggle="modal" data-target="#myModal">번호검색modal</button><br>
      <input type="text" class="form-control col-sm-3" id="zcode" name="mem_zip" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
     <div class="form-group">
      <label for="addr">주소</label>
      <input type="text" class="form-control col-sm-8" id="addr" name="mem_add1" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
     <div class="form-group">
      <label for="addr2">상세주소</label>
      <input type="text" class="form-control col-sm-8" id="addr2" name="mem_add2" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    <div class="form-group form-check">
      <label class="form-check-label">
        <input class="form-check-input" type="checkbox" name="remember" required> I agree on Join.
        <div class="valid-feedback">Valid.</div>
        <div class="invalid-feedback">Check this checkbox to continue.</div>
      </label>
    </div>
    <button type="submit" class="btn btn-primary btn-lg">제출</button>
    <button type="reset" class="btn btn-primary btn-lg">초기화</button>
    <span id ="joinspan"></span>
    
  </form>
</div>
<div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">우편번호 찾기</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          
     동입력 <input type="text" id="dong">
	 <input type="button" value="확인" id ="btn1">
	 <div id="result1"></div>
         
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
  </div>
  </div>
<script>
// Disable form submissions if there are invalid fields
(function() {
  'use strict';
  window.addEventListener('load', function() {
    // Get the forms we want to add validation styles to
    var forms = document.getElementsByClassName('needs-validation');
    // Loop over them and prevent submission
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    });
  }, false);
})();
</script>

</body>
</html>
