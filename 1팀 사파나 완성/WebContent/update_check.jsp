<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import = "user.User" %>
 <%@ page import = "user.UserDAO" %>
 <%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

</style>
</head>
<body>

   <%@include file ="header.jsp" %>   
     <!--  모달 선언 -->
               <div class="modal fade" id="defaultModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h4 class="modal-title">알림</h4>
                        </div>
                        <div class="modal-body">
                            <p class="modal-contents"></p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div>
   

<%
if(UserNick == null){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('로그인을 하세요.')");
	script.println("location.href = 'index.jsp'");
	script.println("</script>");
}

User user = new UserDAO().getUser(UserNick);
if(!UserNick.equals(user.getNickname())){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('권한이 없습니다.')");
	script.println("location.href = 'index.jsp'");
	script.println("</script>");
}
%>

<br>

<div class="container" style="position:absolute;left:30%;">
	<div class="row">
		<form method="post" action="updateCheckAction.jsp">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd; width:800;height:350;">
				<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">회원정보</th>
						</tr>
				</thead>
				<tbody>
						<tr>
							<td style ="width: 20%;"> 아이디 </td>
							<td colspan ="2"><%= user.getId() %></td>
						</tr>
						<tr>
							<td style ="width: 20%;"> 이름 </td>
							<td><textarea  class="form-control onlyHangul" name="name" placeholder="한글만 입력 가능합니다." maxlength="200" style="width:400px; height: 100px; "><%=  user.getName()%></textarea></td>
						</tr>
							<tr>
							<td style ="width: 20%;"> 닉네임 </td>
							<td><textarea  class="form-control" name="nickname" placeholder="20자까지 입력 가능합니다."  data-rule-required="true" maxlength="20" style="width:400px; height: 100px; "><%=  user.getNickname()%></textarea></td>
						</tr>
							<tr>
							<td style ="width: 20%;"> 이메일 </td>
							<td><textarea  class="form-control" name="email" placeholder="이메일"  data-rule-required="true" maxlength="50" style="width:400px; height: 100px; "><%=  user.getEmail()%></textarea></td>
						</tr>
								<tr>
							<td style ="width: 20%;"> 전화번호 </td>
							<td><textarea  class="form-control onlyNumber" name="phone" placeholder="-를 제외하고 숫자만 입력하세요."  data-rule-required="true" maxlength="50" style="width:400px; height: 100px; "><%=  user.getPhone()%></textarea></td>			     
						</tr>
						<tr>
						<td style ="width: 20%;"> 성별 </td>
                        <td><input type ="radio" name ="gender" value ="M" <%if(user.getGender().equals("M")) out.print("checked"); %>>남
						<input type ="radio" name ="gender" value ="F"<%if(user.getGender().equals("F")) out.print("checked"); %>>여</td>     
                        </tr>
                        
                        		<tr>
						<td style ="width: 20%;"> 이메일 수신동의 </td>
                        <td><input type ="radio" name ="sns" value ="Y" <%if(user.getSns().equals("Y")) out.print("checked"); %>>동의합니다.
						<input type ="radio" name ="sns" value ="N"<%if(user.getSns().equals("N")) out.print("checked"); %>>동의하지 않습니다.</td>     
                        </tr>
                        
                        	<tr>
						<td style ="width: 20%;"> 이메일 수신동의 </td>
                        <td><input type ="radio" name ="sms" value ="Y" <%if(user.getSms().equals("Y")) out.print("checked"); %>>동의합니다.
						<input type ="radio" name ="sms" value ="N"<%if(user.getSms().equals("N")) out.print("checked"); %>>동의하지 않습니다.</td>     
                        </tr>
					
			</tbody>
		</table>
		<input type="submit" class="btn btn-primary  bg-info float-right" value="회원정보 수정"  style="margin:5px;">
	
		</form>
	</div>
</div>

 <script>        
            $(function(){
                //모달을 전역변수로 선언
                var modalContents = $(".modal-contents");
                var modal = $("#defaultModal");
                
                $('.onlyAlphabetAndNumber').keyup(function(event){
                    if (!(event.keyCode >=37 && event.keyCode<=40)) {
                        var inputVal = $(this).val();
                        $(this).val($(this).val().replace(/[^_a-z0-9]/gi,'')); //_(underscore), 영어, 숫자만 가능
                    }
                });
                
                $(".onlyHangul").keyup(function(event){
                    if (!(event.keyCode >=37 && event.keyCode<=40)) {
                        var inputVal = $(this).val();
                        $(this).val(inputVal.replace(/[a-z0-9]/gi,''));
                    }
                });
            
                $(".onlyNumber").keyup(function(event){
                    if (!(event.keyCode >=37 && event.keyCode<=40)) {
                        var inputVal = $(this).val();
                        $(this).val(inputVal.replace(/[^0-9]/gi,''));
                    }
                });
                
                //------- 검사하여 상태를 class에 적용
                $('#id').keyup(function(event){
                    
                    var divId = $('#divId');
                    
                    if($('#id').val()==""){
                        divId.removeClass("has-success");
                        divId.addClass("has-error");
                    }else{
                        divId.removeClass("has-error");
                        divId.addClass("has-success");
                    }
                });
                
                $('#passwd').keyup(function(event){
                    
                    var divPassword = $('#divPassword');
                    
                    if($('#passwd').val()==""){
                        divPassword.removeClass("has-success");
                        divPassword.addClass("has-error");
                    }else{
                        divPassword.removeClass("has-error");
                        divPassword.addClass("has-success");
                    }
                });
                
                $('#passwordCheck').keyup(function(event){
                    
                    var passwordCheck = $('#passwordCheck').val();
                    var password = $('#passwd').val();
                    var divPasswordCheck = $('#divPasswordCheck');
                    
                    if((passwordCheck=="") || (password!=passwordCheck)){
                        divPasswordCheck.removeClass("has-success");
                        divPasswordCheck.addClass("has-error");
                    }else{
                        divPasswordCheck.removeClass("has-error");
                        divPasswordCheck.addClass("has-success");
                    }
                });
                
                $('#name').keyup(function(event){
                    
                    var divName = $('#divName');
                    
                    if($.trim($('#name').val())==""){
                        divName.removeClass("has-success");
                        divName.addClass("has-error");
                    }else{
                        divName.removeClass("has-error");
                        divName.addClass("has-success");
                    }
                });
                
                $('#nickname').keyup(function(event){
                    
                    var divNickname = $('#divNickname');
                    
                    if($.trim($('#nickname').val())==""){
                        divNickname.removeClass("has-success");
                        divNickname.addClass("has-error");
                    }else{
                        divNickname.removeClass("has-error");
                        divNickname.addClass("has-success");
                    }
                });
                
                $('#email').keyup(function(event){
                    
                    var divEmail = $('#divEmail');
                    
                    if($.trim($('#email').val())==""){
                        divEmail.removeClass("has-success");
                        divEmail.addClass("has-error");
                    }else{
                        divEmail.removeClass("has-error");
                        divEmail.addClass("has-success");
                    }
                });
                
                $('#phoneNumber').keyup(function(event){
                    
                    var divPhoneNumber = $('#divPhoneNumber');
                    
                    if($.trim($('#phoneNumber').val())==""){
                        divPhoneNumber.removeClass("has-success");
                        divPhoneNumber.addClass("has-error");
                    }else{
                        divPhoneNumber.removeClass("has-error");
                        divPhoneNumber.addClass("has-success");
                    }
                });
                
                
                //------- validation 검사
                $( "form" ).submit(function( event ) {
                    
                    var divId = $('#divId');
                    var divPassword = $('#divPassword');
                    var divPasswordCheck = $('#divPasswordCheck');
                    var divName = $('#divName');
                    var divEmail = $('#divEmail');
                    var divPhoneNumber = $('#divPhoneNumber');
                            
                    //아이디 검사
                    if($('#id').val()==""){
                        modalContents.text("아이디를 입력하여 주시기 바랍니다.");
                        modal.modal('show');
                        
                        divId.removeClass("has-success");
                        divId.addClass("has-error");
                        $('#id').focus();
                        return false;
                    }else{
                        divId.removeClass("has-error");
                        divId.addClass("has-success");
                    }
                    
                    //패스워드 검사
                    if($('#passwd').val()==""){
                        modalContents.text("패스워드를 입력하여 주시기 바랍니다.");
                        modal.modal('show');
                        
                        divPassword.removeClass("has-success");
                        divPassword.addClass("has-error");
                        $('#passwd').focus();
                        return false;
                    }else{
                        divPassword.removeClass("has-error");
                        divPassword.addClass("has-success");
                    }
                    
                    //패스워드 확인
                    if($('#passwordCheck').val()==""){
                        modalContents.text("패스워드 확인을 입력하여 주시기 바랍니다.");
                        modal.modal('show');
                        
                        divPasswordCheck.removeClass("has-success");
                        divPasswordCheck.addClass("has-error");
                        $('#passwordCheck').focus();
                        return false;
                    }else{
                        divPasswordCheck.removeClass("has-error");
                        divPasswordCheck.addClass("has-success");
                    }
                    
                    //패스워드 비교
                    if($('#passwd').val()!=$('#passwordCheck').val() || $('#passwordCheck').val()==""){
                        modalContents.text("패스워드가 일치하지 않습니다.");
                        modal.modal('show');
                        
                        divPasswordCheck.removeClass("has-success");
                        divPasswordCheck.addClass("has-error");
                        $('#passwordCheck').focus();
                        return false;
                    }else{
                        divPasswordCheck.removeClass("has-error");
                        divPasswordCheck.addClass("has-success");
                    }
                    
                    //이름
                    if($('#name').val()==""){
                        modalContents.text("이름을 입력하여 주시기 바랍니다.");
                        modal.modal('show');
                        
                        divName.removeClass("has-success");
                        divName.addClass("has-error");
                        $('#name').focus();
                        return false;
                    }else{
                        divName.removeClass("has-error");
                        divName.addClass("has-success");
                    }
                    
                    //이메일
                    if($('#email').val()==""){
                        modalContents.text("이메일을 입력하여 주시기 바랍니다.");
                        modal.modal('show');
                        
                        divEmail.removeClass("has-success");
                        divEmail.addClass("has-error");
                        $('#email').focus();
                        return false;
                    }else{
                        divEmail.removeClass("has-error");
                        divEmail.addClass("has-success");
                    }
                    
                    //휴대폰 번호
                    if($('#phoneNumber').val()==""){
                        modalContents.text("휴대폰 번호를 입력하여 주시기 바랍니다.");
                        modal.modal('show');
                        
                        divPhoneNumber.removeClass("has-success");
                        divPhoneNumber.addClass("has-error");
                        $('#phoneNumber').focus();
                        return false;
                    }else{
                        divPhoneNumber.removeClass("has-error");
                        divPhoneNumber.addClass("has-success");
                    }
                });
            });
            
        </script>
  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>