<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp" />
<style>
	footer{
		bottom : 0;
	}
	
	.login_box{
		margin : 200px;
	}
</style>
</head>
<body>

	<div class="login_box">
		<form action="${path}/user/login" method="post">
			<table>
				<tr>
					<th colspan="2"><h3>LOGIN</h3></th>
				</tr>			
				<tr>
					<td>아이디</td>
					<td>
						<input type="text" name="u_id" id="u_id" placeholder="아이디를 입력하세요."/>
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td>
						<input type="password" name="u_pw" id="u_pw" placeholder="비밀번호를 입력하세요."/>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label>
							<input type="checkbox" name="remember-me" id="remember-me"/>
							로그인 정보 저장
						</label>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" class="form-control btn btn-primary" id="loginBtn" value="로그인"/> 
						<input type="button" onclick="location.href='${path}/user/join';" value="회원가입"/>
					</td>
				</tr>
			</table>
<%-- 			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> --%>
		</form>
	</div>
<jsp:include page="../common/footer.jsp" />