<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매상담신청</title>
<style>
	.searchArea div{
		display: inline-block;
	}
/*	
	.car_list1, .car_list2, .car_list3{
		display : none;
	} 
	
	.carSel ul {
		list-style:none;
	}
*/	
</style>
</head>
<body>
<!-- 
	
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

 -->
		
	<div class="searchArea">
		<!-- <form id="searchForm"> -->
			<div>
				<select id="si">
				  <option value="">시/도를 선택하세요</option>
					<c:forEach var="area" items="${areaList}">
				  		<option value="${area.nsi}"
				  		<c:if test="${area.nsi eq pm.cri.nsi}">selected='selected'</c:if>>
				  		${area.si}
				  		</option>
					</c:forEach>
				</select>
			</div>
			<div>
				<select id="gu">
					<option value="">구/군을 선택하세요</option>
					<c:forEach var="guGun" items="${aList}">
				  		<option value="${guGun.ngu}"
				  		<c:if test="${guGun.ngu eq pm.cri.ngu}">selected='selected'</c:if>>
				  		${guGun.gu}
				  		</option>
				  	</c:forEach>
				</select>
			</div>
			<div>
				<input type="text" id="keyword" name="keyword" value="${pm.cri.keyword}" placeholder="검색어를 입력해주세요"/>
			</div>
			<div>
				<input type="button" id="searchBtn" value="검색" />
			</div>
			<form id="readForm">
				<!-- session에 저장되어있는 회원 번호  -->
				<input type="hidden" name="uno" value="${userInfo.uno}"/>
	 			<input type="hidden" name="nsi" value="${pm.cri.nsi}"/>
	 			<input type="hidden" name="ngu" value="${pm.cri.ngu}"/>
	 			<input type="hidden" name="keyword" value="${pm.cri.keyword}"/>
			</form>
	</div>
	<br/>
	<hr/>
	<br/>
	<div>
		<table border="1">
			<tr>
				<th>지점/대리점</th>
				<th>주소</th>
				<th>전화번호</th>
				<th>위치</th>    <!-- https://triplexlab.tistory.com/155 -->
			</tr>
			<!-- 게시물 목록 출력 -->
			<c:choose>
				<c:when test="${!empty list}">
					<c:forEach var="reserve" items="${list}">
						<tr>
							<td>
								<label>
								<input type="radio" name="branch" id="brSelectBtn" value="${reserve.bno}"/>
								${reserve.bname}
								</label>
							</td>
							<td>${reserve.addr}</td>
							<td>${reserve.phoneNum}</td>
							<td></td>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<th colspan="4">검색 결과가 존재하지 않습니다.</th>
					</tr>
				</c:otherwise>
			</c:choose>
			<tr>
				<th colspan="4">
					<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}">
						<a href="reserveList${pm.search(i)}">[${i}]</a>
					</c:forEach>
				</th>
			</tr>
		</table>
			<input type="button" id="reservebtn" onclick="getValue()" value="예약"/>
			
	</div>
	
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
/* 
	// 카테고리 클릭 시 
	
	$("#All").click(function(){
		$("#All").attr("checked",true);
//		$("#truck").removeAttr("checked");
//		$("#bus").removeAttr("checked");
		
		
		$.getJSON('${path}/reservation/car',function(data){
			// data == list
			console.log(data);
			
			var str = "";
			$(data).each(function(){
				// this = CarVO / cType, car
				str += "<li data-cType='"+this.carType+"' data-car='"+this.car+"' class='carLi'>";
				str += "<label>";
				str += "<input type='radio' name='All' id='selectCar' value='"+this.car+"'/> ";
				str += this.car;
				str += "</label>";
				str += "</li>";
			});
			$(".car_u1").html(str);
		});
		
		$(".car_list1").show();
		$(".car_list2").hide();
		$(".car_list3").hide();
		
		
	});
	
	
	$("#truck").click(function(){
		$("#truck").attr("checked",true);
//		$("#All").removeAttr("checked");
//		$("#bus").removeAttr("checked");
		
		var truck = $("#truck").val();
		console.log(truck);
		
		$.getJSON('${path}/reservation/'+truck, function(data){
			// data == list
			console.log(data);
			var str = "";
			$(data).each(function(){
				// this = CarVO / cType, car
				str += "<li data-cType='"+this.carType+"' data-car='"+this.car+"' class='carLi'>";
				str += "<label>";
				str += "<input type='radio' name='truck' id='selectCar' value='"+this.car+"'/> ";
				str += this.car;
				str += "</label>";
				str += "</li>";
			});
			$(".car_u2").html(str);
		});
		
		$(".car_list2").show();
		$(".car_list1").hide();
		$(".car_list3").hide();
	});

	
	$("#bus").click(function(){
		$("#bus").attr("checked",true);
//		$("#All").removeAttr("checked");
//		$("#truck").removeAttr("checked");
		
		
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
					str += "<li data-cType='"+this.carType+"' data-car='"+this.car+"' class='carLi'>";
					str += "<label>";
					str += "<input type='radio' name='bus' id='selectCar' value='"+this.car+"'/> ";
					str += this.car;
					str += "</label>";
					str += "</li>";
				});
				$(".car_u3").html(str);
			},
			error : function(res){
				alert(res.responseText);
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
	
		
	}); 
		*/
	
	
/*
	
	// 컨트롤러로 넘기자! vo로 저장해서 페이지로 model 넘기고 또 히든으로 넘기고!!!!!!!!
	var carType;
	var car;
	
	
	// 차종 선택시
	
	$(".car_u1").on("click", ".carLi", function() {
		var carLi = $(this);
//		console.log(carLi);
		
		carType = carLi.attr("data-cType");
		car = carLi.attr("data-car");
//		console.log(carType);
//		console.log(car);
	});
	
	$(".car_u2").on("click", ".carLi", function() {
		var carLi = $(this);
//		console.log(carLi);
		
		carType = carLi.attr("data-cType");
		car = carLi.attr("data-car");
//		console.log(carType);
//		console.log(car);
	});
	
	$(".car_u3").on("click", ".carLi", function() {
		var carLi = $(this);
//		console.log(carLi);
		
		carType = carLi.attr("data-cType");
		car = carLi.attr("data-car");
//		console.log(carType);
//		console.log(car);
	});
	
	
*/	
	
	
	
	
	
	
	
	
	
	
	
	//var category = $(".category checked:checked").val();
	//console.log(category);
	
	
	// 시 - 셀렉트 박스 change
	
	$("#si").change(function(){
		
		var nsi = $(this).val();
		
		console.log(nsi);

		$("#gu").children().remove();
		
		$("#gu").append("<option>구/군을 선택하세요</option>");
		
		
		$.ajax({
			type : "POST",
			url : "selectArea",
			dataType : "json",
			data: {
				nsi : nsi
			},
			success : function(data){
				console.log(data);
//				$("#gu").append("<option value="+"n"+">구/군을 선택하세요</option>";
				
				if(data.length > 0){
					$(data).each(function(i){
						var html = "<option value="+data[i].ngu+">"+data[i].gu+"</option>";
						$("#gu").append(html);
					});
				}
			},
			error : function(res){
				alert(res.responseText);
			}
		});
		
		
	});


	$("#searchBtn").click(function(){
		
//		var formObj = $("#readForm");
		
		
		
		var nsi = $("#si option:selected").val();
		var ngu = $("#gu option:selected").val();
		
		var keyword = $("#keyword").val();
		
		
		console.log("si : " + si);
		console.log("ngu : "+ ngu);
		console.log("keyword : "+ keyword);
		
//		formObj.attr("action","reserveList");
//		formObj.submit();
//		var nsi = $("#si option").val(${pm.cri.nsi});
		
		location.href="reserveList?nsi="+nsi+"&ngu="+ngu+"&keyword="+keyword;
		
		
		/*
		$.ajax({
			type : "post",
			url : "resultSelect",
			data : {
				nsi = nsi,
				ngu = ngu,
				keyword = keyword
				
				
			},
			success : function(data){
				console.log(data);
				
				if(data.length > 0){
					$(data).each(function(i){
						$(data).attr("selected","selected");
					});
				}
			};
		});
		*/
		
		//formObj.attr("action","reserveList").submit();
	});
	
	
	function getValue(){
		// 지점/대리점 번호 bno 가져오기
		var bno = $("#brSelectBtn:checked").val();
		console.log(bno);
		
	/*	
		// 차종 선택 checkbox value 가져오기
		var cType = $("input[name='car']:checked").val();
		console.log(cType);
	*/
/*	
		console.log(carType);
		console.log(car);
*/
	}
</script>
</body>
</html>