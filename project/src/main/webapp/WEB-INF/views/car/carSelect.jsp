<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차종선택</title>
<style>

	.car_box{
		width:250px;
		height: 200px;
		margin:10px;
		border : 1px solid gray;
		float : left;
	}
	
	.car_list{
		/* display : none; */
		margin:10px;
		float : left;
		width: 900px;
		height: 500px;
	}
	
	.car_u{
		list-style:none;
	}
	
	img{
		width:240px;
		float:left;
	}
	
	a{
		text-decoration :none;
	}
	
	.car_selector{
		position:relative;
	}
	
	.btn_area{
		position:absolute;
		bottom: 5;
		right: 5;
	}
	
	
	
</style>
</head>
<body>

	<div class="car_selector">	
		<!-- 차종선택 카테고리  -->
		<div class="car_category">
			<span class="title">Category :</span>
			<div class="category">
				<span class="form_chk">
					<input type="radio" id="All" name="check01" onclick="check(1)"/>
					<label for="All" class="form_car">
						<span class="car_category1">전체</span>
					</label>
				</span>
				<span class="form_chk">
					<input type="radio" id="truck" name="check01" value="truck"/>
					<label for="truck" class="form_car">
						<span class="car_category2">트럭</span>
					</label>
				</span>
				<span class="form_chk">
					<input type="radio" id="bus" name="check01" value="bus"/>
					<label for="bus" class="form_car">
						<span class="car_category3">버스</span>
					</label>
				</span>
			</div>
		</div>
		
		<!-- 선택한 차종 목록 -->
		<div class="car_list">
			<ul class="car_u">
				<li class="car_scope">
					<!-- ajax data list -->
				
				</li>
			</ul>
		</div>
		
		<div class="btn_area">
			<a href="${path}/branch/branchSelect">
				<span class="branchBtn">
					영업점 선택
				</span>
			</a>
		</div>
		
	</div>
	
	
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	
	/* 차종선택 카테고리 클릭 이벤트 */  /*  https://byunej.tistory.com/22 */
	
	/* 전체 카테고리 클릭 */
	$("#All").click(function(){
		
		/* 차종 목록(All) */
		$.getJSON('${path}/car/carAllList',function(data){
			// data == list
			console.log(data);
			
			var str = "";
			$(data).each(function(){
				// this == carVO / cno, carType, car
				str += "<div class='car_box' data-cno='"+this.cno+"' data-carType='"+this.carType+"' data-car='"+this.car+"'  data-cno='"+this.cno+"'>";
				str += "<a href='#' class='car_a' id='"+this.carType+"'>";
				str += "<strong class='car_name'>"+this.car+"</strong>";
				str += "<span class='car_img'>";
				str += "<img src='${path}/resources/carImg/"+this.cno+".png' alt='"+this.car+"'>";
				str += "</span>";
				str += "</a>";
				str += "</div>";
			});
			$(".car_scope").html(str);
// 			$(".car_name").css("color","black");
		});
//		$(".car_list").show();
//		$(".car_list:eq(0)").show();
//		$(".car_list:not(:eq(0))").hide();
	});
	
	
	/* 트럭 카테고리 클릭 */
	$("#truck").click(function(){
		
		var carType = $("#truck").val();
		console.log(carType);
		
		getList(carType);
	});
	
	
	/* 버스 카테고리 클릭 */
	$("#bus").click(function(){
		
		var carType = $("#bus").val();
		console.log(carType);
		
		getList(carType);
	});
	
	
	/* 트럭 or 버스 - 차종 선택(클릭) 시  */
	$(".car_scope").on("click",".car_box",function(){
		
		
		var cno = $(this).attr("data-cno");
		var carType = $(this).attr("data-carType");
		var car = $(this).attr("data-car");
		
		console.log(cno);
		
//		location.href="carSelect?cno="+cno+"&carType="+carType+"&car="+car;
		
		// post로 넘겨서 CarVO 객체에 선택 값 저장 // 세션에 저장함.
		$.ajax({
			type : "POST",
			url : "${path}/car/carSelect",
			dataType : "json",
			data : {
				cno : cno,
				carType : carType,
				car : car
			},
			success : function(data){
				console.log(data);
			}
		});
	});
	
	
	/* 트럭, 버스 각각 목록 불러오는 함수 */
	function getList(carType){
		
		$.ajax({
			type : "GET",
			url : "eachList",
			dataType : "json",
			data :{
				carType : carType				
			},
			success : function(data){
				console.log(data);
				var str = "";
				$(data).each(function(){
					// this == carVO / cno, carType, car
					str += "<div class='car_box' data-cno='"+this.cno+"' data-carType='"+this.carType+"' data-car='"+this.car+"'  data-cno='"+this.cno+"'>";
					str += "<a href='#' class='car_a' id='"+this.carType+"'>";
					str += "<strong class='car_name'>"+this.car+"</strong>";
					str += "<span class='car_img'>";
					str += "<img src='${path}/resources/carImg/"+this.cno+".png' alt='"+this.car+"'>";
					str += "</span>";
					str += "</a>";
					str += "</div>";
				});
				$(".car_scope").html(str);
			},
			error : function(res){
				console.log(res.resonseText);
			}
		});
//		$(".car_list:eq(0)").show();
//		$(".car_list:not(:eq(0))").hide();

	}
	
	// a 태그 기능 막기
	$(".car_scope").on("click",".car_a",function(e){
		e.preventDefault();
	});


	// 영업점 선택 버튼 클릭 시 - session에 사용자가 선택한 차종 들어있음 CarVO
 /*	
	function nextStep1(){
		location.href="${path}/branch/branchSelect";
	}
*/
/*	
	$(".next_sel").on("click",function(e){
		e.preventDefault();
	});
*/	
 	
</script>	
	
</body>
</html>