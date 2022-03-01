<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp" />

<style>
	footer{
		bottom : 0;
	}
	
	.join_box{
		margin : 200px;
	}
	
	span.text_danger{
		display:block;
		color: red;
		font-size: 10px;
		padding:5px;
	}
	
	input{
		margin: 5px;
	}
</style>

	<div class="join_box">
		<form id="joinForm" action="${path}/user/joinPost" method="post">
			<table>
				<tr>
					<th colspan="2"><h2>JOIN</h2></th>
				</tr>
				<tr>
					<td>아이디</td>
					<td>
						<input type="text" name="u_id" id="u_id" autocomplete="off"/>
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td>
						<input type="password" name="u_pw" id="u_pw" autocomplete="off"/>
					</td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td>
						<input type="password" name="u_repw" id="u_repw"/>
					</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>
						<input type="text" name="u_name" id="u_name"/>
					</td>
				</tr>
				<tr>
					<td>전화번호(-제외 숫자만)</td>
					<td>
						<input type="text" name="u_phone" id="u_phone"/>
					</td>
				</tr>
				<tr>
					<td>생년월일(-제외)</td>
					<td>
						<input type="text" name="u_birth" id="u_birth" autocomplete="off"/>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" id="joinBtn" value="회원가입"/>
					</td>
				</tr>
			</table>
<%-- 			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> --%>	
		</form>
	</div>

<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.3/dist/jquery.validate.js"></script>	
<script>
	$("#u_birth").datepicker({
		changeMonth : true,
		changeYear : true,
		showMonthAfterYear: true,
		dateFormat : "yymmdd",
		dayNames : ['월요일','화요일','수요일','목요일','금요일','토요일','일요일'],
		dayNamesMin : ['월','화','수','목','금','토','일'],
		monthNamesShort : ['1','2','3','4','5','6','7','8','9','10','11','12'],
		monthNames : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] 
	});
	
	// 규칙 추가
	$.validator.addMethod("regex",function(value,element,regexpr){
		return regexpr.test(value);
	});
	
	var regexPass = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
	var regexMobile = /^[0-9]{2,3}?[0-9]{3,4}?[0-9]{4}$/;
	
	// 유효성 검사
	$("#joinForm").validate({
		rules : {
			u_id : {
				required : true,
				remote : {
					type : "POST",
					url : "${path}/user/uidCheck"
				}
			},
			u_pw : {
				required : true,
				minlength : 8,
				maxlength : 16,
				regex : regexPass
			},
			u_repw : {
				required : true,
				minlength :8,
				maxlength : 16,
				equalTo : "#u_pw"
			},
			u_name : {
				required : true,
				rangelength : [2,6]
			},
			u_phone : {
				required : true,
				regex : regexMobile
			},
			u_birth : {
				required : true
			}
		},
		messages :{
			u_id : {
				required: "아이디를 작성해주세요.",
				remote : "이미 존재하는 ID입니다."
			},
			u_pw :{
				required : "비밀번호를 작성해주세요.",
				minlength : "비밀번호는 최소 8글자 이상입니다.",
				maxlength : "비밀번호는 최대 16글자만 가능합니다.",
				regex : "비밀번호는 특수문자와 숫자를 포함해야합니다."
			},
			u_repw :{
				required : "비밀번호를 작성해주세요.",
				minlength : "비밀번호는 최소 8글자 이상입니다.",
				maxlength : "비밀번호는 최대 16글자만 가능합니다.",
				equalTo : "비밀번호가 일치하지 않습니다."
			},
			u_name :{
				required : "이름을 작성해주세요.",
				rangelength : $.validator.format(
					"문자 길이가 {0}에서 {1}사이의 값을 입력하세요."
				)
			},
			u_phone:{
				required : "전화번호를 작성해주세요.",
				regex : "올바른 전화번호 형식이 아닙니다."
			},
			u_birth:{
				required : "생년월일을 작성해주세요.",
			}
			
		},
//		debug : true,
		errorElement: "span",
		errorClass : "text_danger"
	});
	
	$.validator.setDefaults({
		submitHandler : function(){
			$("#joinForm").submit();
		}
	});
/*  	
	$(document).ajaxSend(function(e, xhr, option){
		xhr.setRequestHeader(
				"${_csrf.headerName}",
				"${_csrf.token}");
	});
 */
</script>	
<jsp:include page="../common/footer.jsp" />