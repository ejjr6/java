<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.car_list1, .car_list2, .car_list3{
		display : none;
	} 
/* 	
	.carSel ul {
		list-style:none;
	}
 */
	img{
		width:240px;
		float:left;
	}
 	 
	.car_u1, .car_u2, .car_u3{
		width:900px;
		height: 400px;
		margin:10px;
	}
	
	#carLi{
		width:240px;
		float:left;
		margin : 5px;
		border : 1px solid gray;
	}
	
	#carLi:hover{
		background-color : black;
		cursor : pointer;
		color: white;
	}
	

	.car_a div{
		background-color: black;
		color : white;
	} 
	
	

</style>
</head>
<body>
	<div class="carBox">
		<span class="title">Category : </span>
		<div class="category">
			<span class="car_chk">
				<input type="radio" id="All" name="car" value="All"/>
				<label for="All" class="check_box">전체</label>		
			</span>
			<span class="car_chk">
				<input type="radio" id="truck" name="car" value="truck"/>
				<label for="truck" class="check_box">트럭</label>		
			</span>
			<span class="car_chk">
				<input type="radio" id="bus" name="car" value="bus"/>
				<label for="bus" class="check_box">버스</label>		
			</span>
		</div>
	</div>

	<div class="carSel">
		<div class="car_list1">			
			<h5 class="subT">▶ALL</h5> 
			<div class="car_u1">
				<!-- <li></li> ajax로 넣기!-->
			</div>
		</div>
		<div class="car_list2">			
			<h5 class="subT">▶트럭</h5>
			<div class="car_u2">
				<!-- <li></li> ajax로 넣기! if(selectedCar == 'All'){}-->
			</div>
		</div>
		<div class="car_list3">			
			<h5 class="subT">▶버스</h5> 
			<div class="car_u3">
				<!-- <li></li> ajax로 넣기! if(selectedCar == 'All'){}-->
			</div>
		</div>
	</div>
	
	<form id="carInfo">
		<input type="hidden" name="carIn" value="${data-car}" />	
	</form>
	
	<div>
		<input type="button" id="branchBtn" value="영업점 선택"/>
	</div>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	// 카테고리 클릭 시 

	$("#All").click(function(){
		$("#All").attr("checked",true);
	//	$("#truck").removeAttr("checked");
	//	$("#bus").removeAttr("checked");
		
		
		$.getJSON('${path}/reservation/car',function(data){
			// data == list
			console.log(data);
			
			var str = "";
			$(data).each(function(){
				// this = CarVO / cType, car
				str += "<div id='carLi' data-cType='"+this.carType+"' data-car='"+this.car+"'  data-cno='"+this.cno+"'>";
				str += "<div>";
				str += "<img src='${path}/resources/carImg/"+this.cno+".png'>";
				str += "<span class='cName'>"+this.car+"</span>";
				str += "</div>";
				str += "</div>";
			});
			$(".car_u1").html(str);
		});
		
		$(".car_list1").show();
		$(".car_list2").hide();
		$(".car_list3").hide();
		
		
	});
	
	
	$("#truck").click(function(){
		$("#truck").attr("checked",true);
	//	$("#All").removeAttr("checked");
	//	$("#bus").removeAttr("checked");
		
		var truck = $("#truck").val();
		console.log(truck);
		
		$.getJSON('${path}/reservation/'+truck, function(data){
			// data == list
			console.log(data);
			var str = "";
			$(data).each(function(){
				// this = CarVO / cType, car
				str += "<div id='carLi' data-cType='"+this.carType+"' data-car='"+this.car+"' data-cno='"+this.cno+"'>";
				str += "<div>";
				str += "<img src='${path}/resources/carImg/"+this.cno+".png'>";
				str += "<span class='cName'>"+this.car+"</span>";
				str += "</div>";
				str += "</div>";
			});
			$(".car_u2").html(str);
		});
		
		$(".car_list2").show();
		$(".car_list1").hide();
		$(".car_list3").hide();
	});
	
	
	$("#bus").click(function(){
		$("#bus").attr("checked",true);
	//	$("#All").removeAttr("checked");
	//	$("#truck").removeAttr("checked");
		
		
		var bus = $("#bus").val();
		console.log(bus);
		
	
		$.ajax({
			type : "GET",
			url : "bus",
			dataType : "json",
			data: {
				carType : bus
			},
			success : function(data){
				console.log(data);
				var str = "";
				$(data).each(function(){
					// this = CarVO / cType, car
					str += "<div id='carLi' data-cType='"+this.carType+"' data-car='"+this.car+"' data-cno='"+this.cno+"'>";
					str += "<div>";
					str += "<img src='${path}/resources/carImg/"+this.cno+".png'>";
					str += "<span class='cName'>"+this.car+"</span>";
					str += "</div>";
					str += "</div>";
				});
				$(".car_u3").html(str);
			},
			error : function(res){
				console.log(res.responseText);
			}
		});
		
		$(".car_list3").show();
		$(".car_list1").hide();
		$(".car_list2").hide();
		
		
		
	/*	
		$.postJSON('${path}/reservation/'+bus, function(data){
			// data == list
			console.log(data);
			var str = "";
			$(data).each(function(){
				// this = CarVO / cType, car
				str += "<li data-cType='"+this.carType+"' data-car='"+this.car+"' class='carLi'>";
				str += "<label>";
				str += "<input type='checkbox' id='selectCar' value='"+this.car+"'/> ";
				str += this.car;
				str += "</label>";
				str += "</li>";
			});
			$(".car_u3").html(str);
		});
	
	
	*/
	
	});
	
	// 컨트롤러로 넘기자! vo로 저장해서 페이지로 model 넘기고 또 히든으로 넘기고!!!!!!!!
	//var carType;
	var car;
	
	
	// 차종 선택시
	
	$(".car_u1").on("click", "#carLi", function() {
		var carLi = $(this);
	//	console.log(carLi);
		
		carType = carLi.attr("data-cType");
		car = carLi.attr("data-car");
//		console.log(carType);
//		console.log(car);
		
//		$(this).css("background-color","black");
//		$(this).css("color","white");

		cno = carLi.attr("data-cno");
		console.log(cno);
		
		
		$(this).toggleClass('car_a');
		
		
	});
	
	
	$(".car_u2").on("click", "#carLi", function() {
		var carLi = $(this);
	//	console.log(carLi);
		
		carType = carLi.attr("data-cType");
		car = carLi.attr("data-car");
	//	console.log(carType);
	//	console.log(car);

		
		$(this).toggleClass('car_a');
		
	
	});
	
	$(".car_u3").on("click", "#carLi", function() {
		var carLi = $(this);
	//	console.log(carLi);
		
		carType = carLi.attr("data-cType");
		car = carLi.attr("data-car");
	//	console.log(carType);
	//	console.log(car);
	
		$(this).toggleClass('car_a');
	});

	
	
	//var category = $(".category checked:checked").val();
	//console.log(category);
/*
	$(function(){
		$(".carLi").click(function(){
			$("img").css("border","none");
			$(this).css("border","5px solid blue");
		});
	});
*/


	
	$("#branchBtn").click(function(){
		
		var car = $("#carLi").attr("data-car");
		
		location.href="reserveList?car="+car;
	});

</script>
</body>
</html>