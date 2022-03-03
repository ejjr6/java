<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../includes/header.jsp"%>

<style>
	.row{
		margin : 100px;
		height: 700px;
	}
	
	footer{
		bottom : 0px;
	}

</style>


<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Basic Form Elements</div>
			<div class="panel-body">

				<form role="form" action="register" method="POST">
					<div class="form-group">
						<label>Title</label> <input class="form-control" name="title">

					</div>
					<div class="form-group">
						<label>Text area</label>
						<textarea class="form-control" rows="3" name="content"></textarea>

					</div>
					<div class="form-group">
						<label>Writer</label> <input class="form-control" name="writer"
							value="${userInfo.uname}" readonly="readonly">

					</div>
					<div class="form-group">

						<div class="checkbox">
							<label> <input type="checkbox" name="secret" >비밀글 설정
								
							</label>
						</div>
						</div>
						<button type="submit" class="btn btn-default">Submit
							Button</button>
						<button type="reset" class="btn btn-default">Reset Button</button>
				</form>
			</div>
		</div>
	</div>
</div>


<%@include file="../common/footer.jsp"%>