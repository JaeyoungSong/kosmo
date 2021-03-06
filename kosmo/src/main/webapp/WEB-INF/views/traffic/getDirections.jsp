<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Get Directions</title>
<link rel="icon" href="resources/img/core-img/favicon.ico">
<link rel="stylesheet" href="resources/style.css">
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=u91vrld6gw&submodules=geocoder"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=5YhdM97rzIO5e2jM_nEK"></script>
<script src="resources/js/GetDirections/GetDirections.js"></script>

<style>

#gidokilsearchdiv{
	cursor: pointer;
	margin-bottom: 10px;
	border-bottom:1px solid #70c745;
}
#searchjson ul{
	width:100%;
	padding:20px;
}
#gidokilsearchspan{
	border:1px solid #70c745;
	width:25%;
	color:white;
	padding:0 5px;
	vertical-align: text-bottom;
	background-color: #70c745;
	
}
.table-striped th{
	border-top:1px solid #70c745;
	text-align:center;
}
.busCss1{
	text-align:center;
}
.busCss2{
	text-align:center;
}
.busCss3{
	text-align:center;
}
.busCss4{
	text-align:center;
}
.table{
	border:1px solid #70c745 !important;
}
.realtime{
	width:250px;
	height:60px;
	padding:2px 10px;
	font-size:25px;
	border:1px solid #70c745;
	background-color: #ffffff;
	margin-bottom: 10px;
}
.TrainTimediv table{
	border:1px solid #70c745 !important;
}
.TrainTimediv table tr td{
	vertical-align: middle;
	border:1px solid black;
}
.TrainTimediv table th{
border:1px solid black;
}
/* .cursorCustom{
	cursor: pointer;
	border: solid 3px transparent;
}.cursorCustom:hover{
	opacity: 0.8;
	border-color: #70c745;
}
 @media only screen and (max-width: 800px) {
	.page-link{
		width:22px !important;
		margin-left:3px !important;
		margin-right:3px !important;
		font-size:small !important;
	}
} */
/* The Modal (background) */
 @media only screen and (max-width: 800px) {
	#getDirectionsDiv{
		margin-left:1px !important;
	}
	#map2{
		height:400px !important;
	}
	.realtime{
	float:none !important;
	}
	#searchjson ul{
	padding:5px !important;
}
}
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}
/* Modal Content/Box */
.modal-content {
  border: solid 5px;
  border-color: #70c745;
  background-color: #fefefe;
  margin: 15% auto; /* 15% from the top and centered */
  margin-top:10%;
  padding: 20px;
  border: 1px solid #888;
  width: 100%;
  max-width:1080px;
  max-height:600px;
  overflow-y: auto;
}
/* The Close Button */
.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}
.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}
.Routeinformation p {
	margin: 0 0 3px 0;
	font-weight: bold;
}
.Routeinformation{
	padding:0 15px;
}
</style>

</head>
<body>
	<div class="preloader d-flex align-items-center justify-content-center">
		<div class="preloader-circle"></div>
		<div class="preloader-img">
			<img src="resources/img/core-img/leaf.png" alt="">
		</div>
	</div>
	<%@ include file="../setting/header01.jsp"%>

	<!-- ##### Breadcrumb Area Start ##### -->
	<div class="breadcrumb-area">
		<!-- Top Breadcrumb Area -->
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/traf.png);">
			<h2>Get Directions</h2>
		</div>
	</div>
	<!-- ##### Breadcrumb Area End ##### -->
	<br>
	<div class="row" style="margin-right:0 ;">
		<div class="col-12 col-md-3 col-lg-3" style="display:inline-block;margin: 30px 0;">
			<div class="row">
				<div id="getDirectionsDiv" align="center" style="margin-left:15px;display: block;" class="col-12 col-md-12 col-lg-12">
					<input type="text" placeholder="Please enter an Startaddress." 
						id="roadAddr_StartAddress" onclick="goPopup();" style="padding:0 5px;height: 50px; width: 100%;" readonly><br><br> 
					<input type="hidden" id="ehddnr" value="">
					<input type="button" class='btn alazea-btn' onclick="goPopup();" style="width: 100%;" value="Start Address Search"><br><br> 
					<!-- <input type="button" class='btn btn-warning' onclick="goPopup3();" style="width: 100%;" value="Start Address Search2"><br><br>  -->
					<input readonly type="text" placeholder="Please enter an Endaddress."
						id="roadAddr_EndAddress" onclick="goPopup2();" style="padding:0 5px;height: 50px; width: 100%;"><br><br>
					<input type="hidden" id="ehddnr2" value=""> 
					<input type="button" class='btn alazea-btn' onclick="goPopup2();" style="width: 100%;" value="End Address Search"><br><hr>
					<!-- <input type="button" class='btn btn-warning' onclick="goPopup4();" style="width: 100%;" value="End Address Search2"><br><hr> -->
					<input type="button" class='btn alazea-btn'
						onclick="return searchjido();" style="width: 100%;" value="Get Directions">
					
					
					<input type="hidden" value="" id="x1"> 
					<input type="hidden" value="" id="y1"> 
					<input type="hidden" value="" id="x2">
					<input type="hidden" value="" id="y2">
				</div>
				<div class="col-12 col-md-12 col-lg-12" id="searchjson" align="center" style="margin-top: 20px; " >
				</div>
			</div>
		</div>
		<div class="col-12 col-md-9 col-lg-9" style="padding:0;padding:0 15px;display:inline-block;margin: 0;" >
			<div id="map2" style="width: 100%; height: 800px;"></div>
		</div>
	</div>
		
<div id="getDirectionslModal" class="modal" style="z-index:999;">
	<!-- Modal content -->
	<div class="modal-content">
		<div id="modal-content">
			
		</div>
	<button type='button' id='closeModal' class='btn alazea-btn' onclick='closeModal()' style='padding:30px !important; line-height:0px !important;'>CLOSE</button>
	</div>
</div>
<br>
<%@ include file="../setting/footer01.jsp"%>
	
	
<!-- // 길찾기기능-======================================================================= -->
<script type="text/javascript">
var markers = [];
var infoWindows = [];
var marker = new naver.maps.Marker;
var marker2 = new naver.maps.Marker;
var marker5 = new naver.maps.Marker;
var marker6 = new naver.maps.Marker;
var mapObjArray = new Array();
var nStartArray = new Array();
var nEndArray = new Array();
var markerArray = new Array();
var infoWindowArray = new Array();
var polylines = new Array();
var PoNum = 1;
var marker4 = null;
var pMarkers = [];
var pinfoWindows = [];
var checkNum = 0;


function goPopup(){
	$('#roadAddr_StartAddress').val(null);
	 marker5.setMap(null);
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrEngUrl.do)를 호출하게 됩니다.
    var pop = window.open("popStartAddress","pop","width=570,height=420, scrollbars=yes, resizable=yes");
	
    if(checkNum == 1){
		resetArray();
	}
    
}

function resetArray(){
	for(var p=0;p<polylines.length;p++){
		var poly = polylines[p];
		poly.setMap(null);
	}
	for(var h=0;h<pMarkers.length; h++){
		var markerh = pMarkers[h];
		markerh.setMap(null);
		var infoh = pinfoWindows[h];
		infoh.setMap(null);
	}
	markers = [];
	infoWindows = [];
	mapObjArray = [];
	nStartArray = [];
	nEndArray = [];
	markerArray = [];
	infoWindowArray = [];
	polylines = [];
	marker4 = null;
	pMarkers = [];
	checkNum = 0;
	$('#roadAddr_EndAddress').val(null);
	$('#searchjson').empty();
	
}
function jusoCallBack(roadFullAddr, roadAddr, addrDetail, jibunAddr, zipNo, admCd, rnMgtSn
						, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, korAddr){
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	$('#roadAddr_StartAddress').val(roadAddr);
	$('#ehddnr').val(korAddr);
	searchAddressToCoordinate(korAddr);
	
}

function goPopup2(){
	$('#roadAddr_EndAddress').val(null);
	   marker6.setMap(null);
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrEngUrl.do)를 호출하게 됩니다.
    var pop = window.open("popEndAddress","pop","width=570,height=420, scrollbars=yes, resizable=yes");
   
	if(checkNum == 1){
		resetArray();
	}
}
function jusoCallBack2(roadFullAddr, roadAddr, addrDetail, jibunAddr, zipNo, admCd, rnMgtSn
						, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, korAddr){
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	$('#roadAddr_EndAddress').val(roadAddr);
	$('#ehddnr2').val(korAddr);
	searchAddressToCoordinate2(korAddr);
}

function findDirection(start,end){
	$('#roadAddr_StartAddress').val(start);
	$('#ehddnr').val(start);
	$('#roadAddr_EndAddress').val(end);
	$('#ehddnr2').val(end);
	searchAddressToCoordinate(start);
	searchAddressToCoordinate2(end);
	console.log(start,end);
	
}

function findDirection2(name,endLat,endLng) {
       $('#roadAddr_StartAddress').val("Current Location");
       $('#roadAddr_EndAddress').val(name);
      //귀찮 하드코딩 ^^
    /*   var startx = 126.9740;
      var starty = 37.5112; */
      var startx = 126.8786512;
      var starty = 37.4788221; 
       searchAddressToCoordinate3(startx,starty);
       searchAddressToCoordinate4(endLng,endLat);
   }


$(function(){
	<c:if test="${fn:length(startPoint) >0 && fn:length(endPoint) >0}">
		var start = "${startPoint}";
		var end = "${endPoint}";
		findDirection(start,end);
	</c:if>
	
	<c:if test="${fn:length(endLat) >0 && fn:length(endLng) >0 && fn:length(name) >0}">
       var endLat = "${endLat}";
       var endLng = "${endLng}";
       var name = "${name}";
       findDirection2(name,endLat,endLng);
     </c:if>
})


		/* 네이버 지도 열기 시작 */
		var mapOptions = {
			center : new naver.maps.LatLng(37.475382, 126.880625),
			zoom : 10,
			zoomControl : true,
			zoomControlOptions : {
				position : naver.maps.Position.TOP_LEFT,
				style : naver.maps.ZoomControlStyle.SMALL
			}
		};
		var map = new naver.maps.Map('map2', mapOptions);
		
		
		function initGeocoder() {
			var address2 = document.getElementById("ehddnr").value;
			searchAddressToCoordinate(address2);
		}
		
		function searchAddressToCoordinate(address) {
			marker5.setMap(null);
			var  startx, starty;
			naver.maps.Service.geocode({
					address : address
				}, function(status, response) {
					if (status === naver.maps.Service.Status.ERROR) {
						return alert('Something Wrong!');
					}
					var item = response.result.items[0], 
					addrType = item.isRoadAddress ? '[도로명 주소]': '[지번 주소]',
							point = new naver.maps.Point(item.point.x, item.point.y);
	
					map.setCenter(point);
					startx = item.point.x;
					starty = item.point.y;
					document.getElementById("x1").value = startx;
					document.getElementById("y1").value = starty;
					var start = new naver.maps.Point(startx, starty);
					marker5 = new naver.maps.Marker({
						position : new naver.maps.Point(startx,
								starty),
						map : map,
						draggable : false
					});
				});
		}
		
		function initGeocoder2() {
			var address3 = document.getElementById("ehddnr2").value;
			searchAddressToCoordinate2(address3);
		}
		
		function searchAddressToCoordinate2(address) {
			marker6.setMap(null);
			var endx2, endy2;
			naver.maps.Service.geocode(
				{
					address : address
				},
				function(status, response) {
					if (status === naver.maps.Service.Status.ERROR) {
						return alert('Something Wrong!');
					}
					var item = response.result.items[0], addrType = item.isRoadAddress ? '[도로명 주소]'
							: '[지번 주소]', point = new naver.maps.Point(
							item.point.x, item.point.y);
					
					endx2 = item.point.x;
					endy2 = item.point.y;
					
					document.getElementById("x2").value = endx2;
					document.getElementById("y2").value = endy2;
					var end = new naver.maps.Point(endx2, endy2);
					
					map.setCenter(end);
					marker6 = new naver.maps.Marker({
						position : new naver.maps.Point(endx2,
								endy2),
						map : map,
						draggable : false
					});
					
				});
			
		}
		// result by latlng coordinate
		
		
		function searchAddressToCoordinate3(startx,starty){
	        document.getElementById("x1").value = startx;
	          document.getElementById("y1").value = starty;
	          var start = new naver.maps.Point(startx, starty);
	          map.setCenter(start);
	          marker5 = new naver.maps.Marker({
	             position : new naver.maps.Point(startx,
	                   starty),
	             map : map,
	             draggable : false
	          });
	      }
	      
	      function searchAddressToCoordinate4(endLat,endLng){
	         document.getElementById("x2").value = endLat;
	          document.getElementById("y2").value = endLng;
	          var end = new naver.maps.Point(endLat, endLng);
	          map.setCenter(end);
	          marker6 = new naver.maps.Marker({
	             position : new naver.maps.Point(endLat,
	                   endLng),
	             map : map,
	             draggable : false
	          });
	      }
		
		
	
//===============길찾기 API 호출===========================================================================
		// 상세보기 클릭시 폴리레인 다시 표시
		function searchjido() {
			if(!document.getElementById("roadAddr_StartAddress").value){
				alert('Please enter your address.');
				document.getElementById("roadAddr_StartAddress").focus();
				return false;
			} else if(!document.getElementById("roadAddr_EndAddress").value){
				alert('Please enter your address.');
				document.getElementById("roadAddr_EndAddress").focus();
				return false;
			}
			if(checkNum == 1){
				return false;
			}
			checkNum = 1;
				
			getDirectionStart();
			setTimeout(function () {
				callMapObjApiAJAX(mapObjArray[0]);
			}, 2000);
		}
		
		
		function getDirectionStart(){
			$(function() {
				var obj = new Object();
				var x1 = document.getElementById("x1").value;
				var y1 = document.getElementById("y1").value;
				var x2 = document.getElementById("x2").value;
				var y2 = document.getElementById("y2").value;
				nStartArray.push(new naver.maps.Point(x1,y1));
				nEndArray.push(new naver.maps.Point(x2, y2));
				
				var url2 = 'AddressJson?x1=' + x1 + '&y1=' + y1 + '&x2=' + x2+ '&y2=' + y2;
				$.ajax({
							url : url2,
							type : 'GET',
							dataType : 'json',
							success : function(obj) {
								
								if(obj.result != undefined){
									var addres2 = document.getElementById("roadAddr_EndAddress").value;
									var addres = document.getElementById("roadAddr_StartAddress").value;
									var result = obj.result;
									var path = result.path;
									var subpath1 = path[0].subPath;
									var pathType = path[0].pathType;
									var str;
									var c_num = 0;
									
									for (var i = 0; i < subpath1.length; i++) {
										if (subpath1[i].startExitX != null) {
											document.getElementById("x1").value = subpath1[i].startExitX;
											document.getElementById("y1").value = subpath1[i].startExitY;
										}
										if (subpath1[i].endExitX != null) {
											document.getElementById("x2").value = subpath1[i].endExitX;
											document.getElementById("y2").value = subpath1[i].endExitY;
										}
									}
									
									str = '<ul  >';
									for (var i = 0; i < path.length; i++) {
										markers = [];
										infoWindows = [];
										var info = path[i].info;
										var subPath = path[i].subPath;
										var a = parseInt(info.totalTime / 60);
										var b = parseInt(info.totalTime % 60);
										var totalDistance = 0;
										mapObjArray[i] = info.mapObj;
										
											var contentString = [
												  '<div class="iw_inner" style="padding: 10px;">',
											        '   <h4 align="center">Start Address</h2>',
											        '   <p>'+addres+'</p></div>'
										    ].join('');
											var infoWindow = new naver.maps.InfoWindow({
											    content: contentString,
											    maxWidth: 300,
											    backgroundColor: "#eee",
											    borderColor: "#2db400",
											    borderWidth: 2,
											    anchorSize: new naver.maps.Size(30, 30),
											    anchorSkew: true,
											    anchorColor: "#eee",
											    pixelOffset: new naver.maps.Point(20, -20)
											});
											markers.push(new naver.maps.Point(x1,y1));
											infoWindows.push(infoWindow);
											
											var contentString2 = [
										        '<div class="iw_inner" style="padding: 10px;">',
										        '   <h4 align="center">End Address</h2>',
										        '   <p>'+addres2+'</p></div>'
										    ].join('');
											var infoWindow2 = new naver.maps.InfoWindow({
											    content: contentString2,
											    maxWidth: 300,
											    backgroundColor: "#eee",
											    borderColor: "#2db400",
											    borderWidth: 2,
											    anchorSize: new naver.maps.Size(30, 30),
											    anchorSkew: true,
											    anchorColor: "#eee",
											    pixelOffset: new naver.maps.Point(20, -20)
											});
											markers.push(new naver.maps.Point(x2,y2));
											infoWindows.push(infoWindow2);
										for(var np = 0; np<subPath.length;np++){
											if(subPath[np].trafficType==1 || subPath[np].trafficType==2 ){
												var passStop = subPath[np].passStopList;
												var stat = passStop.stations; 
												markers.push(new naver.maps.Point(stat[0].x,stat[0].y));
												markers.push(new naver.maps.Point(stat[(stat.length-1)].x,stat[(stat.length-1)].y));
												if(subPath[np].trafficType==1){
													var lane2 = subPath[np].lane;
													var Type2 = parseInt(lane2[0].subwayCode);
													var contentString3 = [
														  '<div class="iw_inner" style="padding: 10px;">',
													        '  <p onclick="getDirectionModal('+stat[0].stationID+','+1+');">'+subwayType[Type2]+'('+ subPath[np].startName+'station)</p></div>'
												    ].join('');
													
													var contentString4 = [
														  '<div class="iw_inner" style="padding: 10px;">',
													        '  <p onclick="getDirectionModal('+stat[(stat.length-1)].stationID+','+1+');">'+subwayType[Type2]+'('+ subPath[np].endName+'station)</p></div>'
												    ].join('');
												} else{
													var lane2 = subPath[np].lane;
													var Type2 = parseInt(lane2[0].type);
													var contentString3 = [
														  '<div class="iw_inner" style="padding: 10px;">',
													        '  <p onclick="getDirectionModal('+stat[0].stationID+','+2+');">Bus' + 'No.'+ lane2[0].busNo+'('+subPath[np].startName+')</p></div>'
												    ].join('');
													
													var contentString4 = [
														  '<div class="iw_inner" style="padding: 10px;">',
													        '  <p onclick="getDirectionModal('+stat[(stat.length-1)].stationID+','+2+');">Bus' + 'No.'+ lane2[0].busNo+'('+subPath[np].endName+')</p></div>'
												    ].join('');
												}
												var infoWindow3 = new naver.maps.InfoWindow({
												    content: contentString3,
												    maxWidth: 300,
												    backgroundColor: "#eee",
												    borderColor: "#2db400",
												    borderWidth: 2,
												    anchorSize: new naver.maps.Size(30, 30),
												    anchorSkew: true,
												    anchorColor: "#eee",
												    pixelOffset: new naver.maps.Point(20, -20)
												});
												var infoWindow4 = new naver.maps.InfoWindow({
												    content: contentString4,
												    maxWidth: 300,
												    backgroundColor: "#eee",
												    borderColor: "#2db400",
												    borderWidth: 2,
												    anchorSize: new naver.maps.Size(30, 30),
												    anchorSkew: true,
												    anchorColor: "#eee",
												    pixelOffset: new naver.maps.Point(20, -20)
												});
												infoWindows.push(infoWindow3);
												infoWindows.push(infoWindow4);
											}
										 }   
										 markerArray.push(markers);
										 infoWindowArray.push(infoWindows);
										 
										 
										if (info.totalDistance > 1000) {
											totalDistance = parseInt(info.totalDistance / 1000);
											str += '<div id="gidokilsearchdiv" onclick="gidokilsearch('+i+');">';
											str += '<li style="margin-top:10px;border-top:1px solid black;padding-top:5px;display:inline;position:relative;">';
											str += '<p style="width:100%;margin:0;" align="left"><span id="gidokilsearchspan" align="left">Route'
													+ (i + 1)+ '</span><span style="width:50%;color:red;font-size:20px;margin-left:5px;">&nbsp;&nbsp; ';
											if (a > 0) {
												str += a + ' Hours '
											}
											str += b+ ' Minute&nbsp;&nbsp;</span><span style="width:30%;color:black;font-size:18px;margin-left:5px;">';
											if(info.payment==0){		
												str +=	'Unidentified</span></p>';
											} else{
												str += info.payment + '원</span></p>';
											}
											str += '<div style="border:1px solid black;position:absolute;top:-35px;right:-175px;"><a  id="styleblock'+ i
													+ '" onclick="Detail(Detailedpath'+ i+ ',stylenone'+ i+ ',styleblock'+ i+ ');">&nbsp;<img style="width:25px;height:25px;" src="resources/img/gido/gidosearch.png"></a></div>';
											str += '<div style="border:1px solid black;position:absolute;top:-35px;right:-175px;"><a id="stylenone'
													+ i+ '" onclick="Detailnone(Detailedpath'+ i+ ',styleblock'+ i+ ',stylenone'+ i+ ');" style="display:none">&nbsp;<img style="width:22px;height:25px;" src="resources/img/gido/gidosearch2.png">&nbsp;</a></div>';
											str += '</li>';
											// subPath for문 길찾기 노선 바뀌는 구간 표시 시작
											str += '<li width:100%;><p style="margin:0; font-weight:bold;word-break: normal;padding-right:20px;" align="left">';
											
											
											for (var j = 0; j < subPath.length; j++) {
												if (subPath[j].trafficType == 2) {
													var lane = subPath[j].lane;
													var Type = parseInt(lane[0].type);
													str += 'Bus' + 'No.'+ lane[0].busNo + '('+ subPath[j].startName+ ')   ';
												} else if (subPath[j].trafficType == 1) {
													var lane = subPath[j].lane;
													var Type = parseInt(lane[0].subwayCode);
													str += subwayType[Type] + '('+ subPath[j].startName+ 'station)   ';
												}
												if (subPath[j].trafficType != 3) {
													if ((j + 2) != subPath.length)
														str += ' -> ';
												}
											}
											str += '</p></li>';
											str += '<li style="width:100%;border-buttom:1px solid black;"><p style="margin:0;" align="left">';
											if (path[i].pathType == 2) {
												str += info.busTransitCount+ 'buses&nbsp;&nbsp;&nbsp;Total distance   :   '+ totalDistance;
												if (info.totalDistance > 1000) {
													str += "Km   ";
												} else {
													str += "M   ";
												}
											} else if (path[i].pathType == 1) {
												str += info.subwayTransitCount+ 'subways&nbsp;&nbsp;&nbsp;Total distance : '+ totalDistance;
												if (info.totalDistance > 1000) {
													str += "Km   ";
												} else {
													str += "M   ";
												}
											} else {
												str += info.busTransitCount+ '   buses&nbsp;  + &nbsp; '+ info.subwayTransitCount+ '   subways&nbsp;&nbsp;&nbsp;Total distance : '+ totalDistance;
												if (info.totalDistance > 1000) {
													str += "Km   ";
												} else {
													str += "M   ";
												}
											}
											str += '</p></li>';
											str += '<li class="Routeinformation" id="Detailedpath'+i+'" style="display:none;" align="left">';
											var StartAddress = document.getElementById("roadAddr_StartAddress").value;
											var EndAddress = document.getElementById("roadAddr_EndAddress").value;
											str += '<p style="margin-top:5px;">'+ 'Start : ' + StartAddress+ '</p>';
											var ca = '';
											var pOldNum = 0;
											for (var p = 0; p < subPath.length; p++) {
												var pnewNum = parseInt(subPath[p].trafficType);
												if (pOldNum == 0) {
													if (pnewNum == 3) {
														pOldNum = pnewNum;
														if ((p + 1) == subPath.length) {
															if (subPath[p].distance > 1000) {
																var pNum = subPath[p].distance / 1000;
																pNum = Number(pNum).toFixed(2);
																str += 'Walk About   '+ pNum+ 'Km   '+ EndAddress;
															} else {
																str += 'Walk About   '+ subPath[p].distance+ 'M   '+ EndAddress;
															}
														}
														if (subPath[p].distance > 1000) {
															var pNum = subPath[p].distance / 1000;
															pNum = Number(pNum).toFixed(2);
															ca = 'Walk About   '+ pNum + 'Km   ';
														} else {
															ca = 'Walk About '+ subPath[p].distance+ 'M   ';
														}
													} else if (pnewNum == 2) {
														var lane = subPath[p].lane;
														var Type = parseInt(lane[0].type);
														str += '<p>'+ 'Bus'+ 'No.'+ lane[0].busNo+ '('+ subPath[p].startName+ ')   After boarding,   ';
														str += subPath[p].endName+ '   Get off at the stop   ';
														pOldNum = pnewNum;
													} else {
														var lane = subPath[p].lane;
														var Type = parseInt(lane[0].subwayCode);
														str += '<p>'+ subwayType[Type]+ '   '+ subPath[p].startName+ '   station After boarding   '+ subPath[p].endName+ '   Get off at the stop   ';
														pOldNum = pnewNum;
													}
												} else {
													if (pOldNum == 3
															&& pnewNum != 3) {
														if (pnewNum == 1) {
															var lane = subPath[p].lane;
															var Type = parseInt(lane[0].subwayCode);
															if (subPath[p].distance != 0) {
																str += '<p>'+ ca+ subwayType[Type]+ '   '+ subPath[p].startName+ '   station   </p>';
															}
															str += '<p>'+ subwayType[Type]+ '   '+ subPath[p].startName+ '   station After boarding   '+ subPath[p].endName+ '   Get off at the stop   </p>';
															pOldNum = pnewNum;
														} else {
															var lane = subPath[p].lane;
															var Type = parseInt(lane[0].type);
															if (subPath[p].distance != 0) {
																str += '<p>'+ ca+ subPath[p].startName+ '   Bus Stop   </p>';
															}
															str += '<p>'+ 'Bus'+ 'No.'+ lane[0].busNo+ '('+ subPath[p].startName+ ')   After boarding,   ';
															str += subPath[p].endName+ '   Get off at the stop</p>   ';
															pOldNum = pnewNum;
														}
													} else if (pOldNum == 2
															&& pnewNum != 3) {
														if (pnewNum == 1) {
															var lane = subPath[p].lane;
															var Type = parseInt(lane[0].subwayCode);
															if (subPath[p].distance != 0) {
																str += '<p>'+ ca+ subwayType[Type]+ '   '+ subPath[p].startName+ '   station   </p>';
															}
															str += '<p>'+ subwayType[Type]+ '   '+ subPath[p].startName+ '   station After boarding   '+ subPath[p].endName+ '   Get off at the stop   ';
															pOldNum = pnewNum;
														}
													} else if (pnewNum == 2) {
														var lane = subPath[p].lane;
														var Type = parseInt(lane[0].type);
														if (subPath[p].distance != 0) {
															str += '<p>'+ ca+ subPath[p].startName+ '   Bus Stop   </p>';
														}
														str += '<p>'+ 'Bus'+ 'No.'+ lane[0].busNo+ '('+ subPath[p].startName+ ')   After boarding,   ';
														str += subPath[p].endName+ '   Get off at the stop   ';
														pOldNum = pnewNum;
													} else if (pOldNum == 1
															&& pnewNum != 3) {
														if (pnewNum == 1) {
															var lane = subPath[p].lane;
															var Type = parseInt(lane[0].subwayCode);
															if (subPath[p].distance != 0) {
																str += '<p>'+ ca+ subwayType[Type]+ '   '+ subPath[p].startName+ '   station   </p>';
															}
															str += '<p>'+ subwayType[Type]+ '   '+ subPath[p].startName+ '   station After boarding   '+ subPath[p].endName+ '   Get off at the stop   ';
															pOldNum = pnewNum;
														} else if (pnewNum == 2) {
															var lane = subPath[p].lane;
															var Type = parseInt(lane[0].type);
															if (subPath[p].distance != 0) {
																str += '<p>'+ ca+ subPath[p].startName+ '   Bus Stop </p>';
															}
															str += '<p>'+ 'Bus'+ 'No.'+ lane[0].busNo+ '('+ subPath[p].startName+ ')   After boarding,   ';
															str += subPath[p].endName+ '   Get off at the stop   ';
															pOldNum = pnewNum;
														}
													} else if (pnewNum == 3
															&& subPath[p].distance != 0) {
														pOldNum = pnewNum;
														if ((p + 1) == subPath.length) {
															if (subPath[p].distance > 1000) {
																var pNum = subPath[p].distance / 1000;
																pNum = Number(pNum).toFixed(2);
																str += '<p>Walk   About   '+ pNum+ 'Km   '+ EndAddress+ '</p>';
															} else {
																str += '<p>Walk   About   '+ subPath[p].distance+ 'M   '+ EndAddress+ '</p>';
															}
														}
														if (subPath[p].distance > 1000) {
															var pNum = subPath[p].distance / 1000;
															pNum = Number(pNum).toFixed(2);
															ca = 'Walk   About   '+ pNum + 'Km   ';
														} else {
															ca = 'Walk   About '+ subPath[p].distance+ 'M   ';
														}
													}
												}
												// subPath for문 길찾기 노선 바뀌는 구간 표시 종료
											}
											str += '<p>' + 'End: ' + EndAddress+ '</p>';
											str += '</li>';
										}
										c_num += c_num + 1;
										str+='</div>';
									}
									if (c_num == 0) {
										str += '<li>If the straight line distance between the place of departure and destination is less than 700m, no results will be provided.</li>';
									}
									str += '</ul>';
									
									$('#searchjson').css('height','400px');
									$('#searchjson').css('overflow', 'auto');
									$('#searchjson').html(str);
									
								} else{
									alert('The distance is correct.');
									window.location='getDirections';
								}
								
								if(obj.result != undefined){
									var path = result.path;
									for (var i = 0; i < path.length; i++) {
										var subPath = path[i].subPath;
										StartEndXY(subPath,i);
									}
								}
							},
							error : function() {
								alert('잠시 후 다시 시도해주세요.');
							}
						});
				
			});
		
		}
		
		// 경로 방법 선택시 맵에 이벤트 재시작
		function gidokilsearch(mapobjnum){
			
			if(checkNum == 1){
				for(var p=0;p<polylines.length;p++){
					var poly = polylines[p];
					poly.setMap(null);
				}
				
				for(var h=0;h<pMarkers.length; h++){
					var markerh = pMarkers[h];
					markerh.setMap(null);
					var infoh = pinfoWindows[h];
					infoh.setMap(null);
				}
			} 
			pMarkers = [];
			polylines = [];
			var nym = parseInt(mapobjnum+1);
			PoNum = nym;
			var mapnameObj = mapObjArray[mapobjnum];
			callMapObjApiAJAX(mapnameObj);
			
		} 
		
		function StartEndXY(subPath,i){
			for(var kr = 0; kr<subPath.length;kr++){
				if(subPath[kr].trafficType==1 || subPath[kr].trafficType==2 ){
					if(subPath.length == 3){
						var passStop = subPath[kr].passStopList;
						var stat = passStop.stations; 	
						 nEndArray.push(new naver.maps.Point(stat[(stat.length-1)].x,stat[(stat.length-1)].y));
						 nStartArray.push(new naver.maps.Point(stat[0].x,stat[0].y));
					} else if(kr==(subPath.length-2)){
						var passStop = subPath[kr].passStopList;
						var stat = passStop.stations; 	
						 nEndArray.push(new naver.maps.Point(stat[(stat.length-1)].x,stat[(stat.length-1)].y));
					} else if(nStartArray[(i+1)] == undefined){
						var passStop = subPath[kr].passStopList;
						var stat = passStop.stations; 
						nStartArray.push(new naver.maps.Point(stat[0].x,stat[0].y));
					}  
				}
			} 
			
		}
		/* 노선그래픽 데이터 호출 시작 */
		function searchPubTransPathAJAX() {
			var xhr = new XMLHttpRequest();
			//ODsay apiKey 입력
			var sx = document.getElementById("x1").value;
			var sy = document.getElementById("y1").value;
			var ex = document.getElementById("x2").value;
			var ey = document.getElementById("y2").value;
			var url = "https://api.odsay.com/v1/api/searchPubTransPath?SX="+ sx+ "&SY="+ sy+ "&EX="+ ex+ "&EY="+ ey
					+ "&apiKey=hnsqv%2Bnl81sOEEMyauqSk2DiKsoH%2BY2VTPN4c2%2FhmB0";
			xhr.open("GET", url, true);
			xhr.send();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					console.log(JSON.parse(xhr.responseText)); // <- xhr.responseText 로 결과를 가져올 수 있음
					//노선그래픽 데이터 호출
					if((JSON.parse(xhr.responseText))["result"] != undefined){
						callMapObjApiAJAX((JSON.parse(xhr.responseText))["result"]["path"][0].info.mapObj);
					} 
				}
			}
		}
		
		function callMapObjApiAJAX(mabObj) {
			var sx = document.getElementById("x1").value;
			var sy = document.getElementById("y1").value;
			var ex = document.getElementById("x2").value;
			var ey = document.getElementById("y2").value;
			
			var xhr = new XMLHttpRequest();
			//ODsay apiKey 입력
			var url = "https://api.odsay.com/v1/api/loadLane?mapObject=0:0@"
					+ mabObj
					+ "&apiKey=hnsqv%2Bnl81sOEEMyauqSk2DiKsoH%2BY2VTPN4c2%2FhmB0";
			xhr.open("GET", url, true);
			xhr.send();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					var resultJsonData = JSON.parse(xhr.responseText);
					var lineArray = new Array();
					var walkingArray = new Array();
					for (var i = 0; i < resultJsonData.result.lane.length; i++) {
						for (var j = 0; j < resultJsonData.result.lane[i].section.length; j++) {
							lineArray = null;
							lineArray = new Array();
							walkingArray = null;
							walkingArray = new Array();
							for (var k = 0; k < resultJsonData.result.lane[i].section[j].graphPos.length; k++) {
								lineArray.push(new naver.maps.LatLng(
										resultJsonData.result.lane[i].section[j].graphPos[k].y,resultJsonData.result.lane[i].section[j].graphPos[k].x));
								if((resultJsonData.result.lane[i].section[j].graphPos.length-1)==k){
									if(resultJsonData.result.lane[(i+1)] != undefined){
									walkingArray.push(new naver.maps.LatLng(
											resultJsonData.result.lane[i].section[j].graphPos[k].y,resultJsonData.result.lane[i].section[j].graphPos[k].x));
									walkingArray.push(new naver.maps.LatLng(
											resultJsonData.result.lane[(i+1)].section[j].graphPos[0].y,resultJsonData.result.lane[(i+1)].section[j].graphPos[0].x));
									var walkingline1 = new naver.maps.Polyline({
										map : map,
										path : walkingArray, 
										strokeWeight : 4,
										strokeStyle : 'shortdash',
										strokeColor : '#003499'
									});
									polylines.push(walkingline1);
									
									}
								}
							}
							if(resultJsonData.result.lane[i].class == 2){
								if(resultJsonData.result.lane[i].type == 1){
									var polyline1 = new naver.maps.Polyline({
										map : map,
										path : lineArray, 
										strokeWeight : 4,
										strokeColor : '#0d3692'
									});
								} else if(resultJsonData.result.lane[i].type == 2){
									var polyline1 = new naver.maps.Polyline({
										map : map,
										path : lineArray, 
										strokeWeight : 4,
										strokeColor : '#33a23d'
									});
								} else if(resultJsonData.result.lane[i].type == 3){
									var polyline1 = new naver.maps.Polyline({
										map : map,
										path : lineArray, 
										strokeWeight : 4,
										strokeColor : '#fe5b10'
									});
								} else if(resultJsonData.result.lane[i].type == 4){
									var polyline1 = new naver.maps.Polyline({
										map : map,
										path : lineArray, 
										strokeWeight : 4,
										strokeColor : '#32a1c8'
									});
								} else if(resultJsonData.result.lane[i].type == 5){
									var polyline1 = new naver.maps.Polyline({
										map : map,
										path : lineArray, 
										strokeWeight : 4,
										strokeColor : '#8b50a4'
									});
								} else if(resultJsonData.result.lane[i].type == 6){
									var polyline1 = new naver.maps.Polyline({
										map : map,
										path : lineArray, 
										strokeWeight : 4,
										strokeColor : '#c55c1d'
									});
								} else if(resultJsonData.result.lane[i].type == 7){
									var polyline1 = new naver.maps.Polyline({
										map : map,
										path : lineArray, 
										strokeWeight : 4,
										strokeColor : '#54640d'
									});
								} else if(resultJsonData.result.lane[i].type == 8){
									var polyline1 = new naver.maps.Polyline({
										map : map,
										path : lineArray, 
										strokeWeight : 4,
										strokeColor : '#f51361'
									});
								} else if(resultJsonData.result.lane[i].type == 9){
									var polyline1 = new naver.maps.Polyline({
										map : map,
										path : lineArray, 
										strokeWeight : 4,
										strokeColor : '#aa9872'
									});
								} else if(resultJsonData.result.lane[i].type == 100){
									var polyline1 = new naver.maps.Polyline({
										map : map,
										path : lineArray, 
										strokeWeight : 4,
										strokeColor : '#ffb300'
									});
								} else {
									var polyline1 = new naver.maps.Polyline({
										map : map,
										path : lineArray, 
										strokeWeight : 4,
										strokeColor : '#0d3692'
									});
								}
							} else {
								var polyline1 = new naver.maps.Polyline({
									map : map,
									path : lineArray, 
									strokeWeight : 4,
									strokeColor : '#0d3692'
								});
							}
							polylines.push(polyline1);
						}
					}
					drawNaverPolyLine(resultJsonData); // 노선그래픽데이터 지도위 표시
					// boundary 데이터가 있을경우, 해당 boundary로 지도이동
					if (resultJsonData.result.boundary) {
						var boundary = new naver.maps.LatLngBounds(
								new naver.maps.LatLng(
										resultJsonData.result.boundary.top,
										resultJsonData.result.boundary.left),
								new naver.maps.LatLng(
										resultJsonData.result.boundary.bottom,
										resultJsonData.result.boundary.right));
						map.panToBounds(boundary);
					}
				}
			}
		}
		
		// 노선그래픽 데이터를 이용하여 지도위 폴리라인 그려주는 함수
		function drawNaverPolyLine(resultJsonData) {
			
			var polyline2 = new naver.maps.Polyline({
				map : map,
				path : [nStartArray[0],nStartArray[PoNum]], 
				strokeWeight : 4,
				strokeStyle : 'shortdash',
				strokeColor : '#003499'
			});
			polylines.push(polyline2);
			
			var polyline3 = new naver.maps.Polyline({
				map : map,
				path : [nEndArray[0],nEndArray[PoNum]], 
				strokeWeight : 4,
				strokeStyle : 'shortdash',
				strokeColor : '#003499'
			});
			polylines.push(polyline3);
			
			var gidoMk = PoNum-1;
			gidomarker(gidoMk);
		}
		/* 노선그래픽 데이터 호출 종료 */
		
		
		
		
		function gidomarker(agidoMk){
			markers = markerArray[agidoMk];
			var Smarkers = [];
			for(var h=0;h<markers.length;h++){
				marker = new naver.maps.Marker({
					position : markers[h],
					map : map,
					draggable : false
				});
				Smarkers.push(marker);
			}
			markers = Smarkers;	
			infoWindows = infoWindowArray[agidoMk] ;
			pMarkers = Smarkers;
			pinfoWindows = infoWindows;
			
			naver.maps.Event.addListener(map, 'idle', function() {
			    updateMarkers(map, markers);
			});
			
			function updateMarkers(map, markers) {
			    var mapBounds = map.getBounds();
			    var marker3, position;
			    for (var i = 0; i < markers.length; i++) {
			        marker3 = markers[i];
			        position = marker3.getPosition();
			        if (mapBounds.hasLatLng(position)) {
			            showMarker(map, marker3);
			        } else {
			            hideMarker(map, marker3);
			        }
			    }
			}
			function showMarker(map, marker) {
			    if (marker.setMap()) return;
			    marker.setMap(map);
			}
			function hideMarker(map, marker) {
			    if (!marker.setMap()) return;
			    marker.setMap(null);
			}
			// 해당 마커의 인덱스를 seq라는 클로저 변수로 저장하는 이벤트 핸들러를 반환합니다.
			function getClickHandler(seq) {
			    return function(e) {
			        var marker3 = markers[seq],
			            infoWindow = infoWindows[seq];
			        if (infoWindow.getMap()) {
			            infoWindow.close();
			        } else {
			            infoWindow.open(map, marker3);
			        }
			    }
			}
			for (var i=0, ii=markers.length; i<ii; i++) {
			    naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i));
			}
		}
		
		
		
		
		
		var busType = new Array(); 
		busType[1] = '일반'; 	busType[2] = '좌석'; 	busType[3] = '마을'; busType[4] = '직행좌석'; 	busType[5] = '공항';
		busType[6] = '간선급행'; busType[10] = '외곽'; busType[11] = '간선'; 	busType[12] = '지선';
		busType[13] = '순환'; busType[14] = '광역'; busType[15] = '급행'; busType[20] = '농어촌'; busType[21] = '제주도시외';
		busType[22] = '경기도시외'; 	busType[26] = '급행간선';
	
		var subwayType = new Array();
		subwayType[1] = '1호선'; subwayType[2] = '2호선'; subwayType[3] = '3호선'; subwayType[4] = '4호선';
		subwayType[5] = '5호선'; subwayType[6] = '6호선'; subwayType[7] = '7호선'; 	subwayType[8] = '8호선';
		subwayType[9] = '9호선'; 	subwayType[100] = '분당선'; 	subwayType[101] = '공항'; 	subwayType[104] = '경의선';
		subwayType[107] = '에버라인'; 	subwayType[108] = '경춘선'; 	subwayType[102] = '자기부상'; 	subwayType[109] = '신분당선';
		subwayType[110] = '의정부'; 		subwayType[111] = '수인선'; 		subwayType[112] = '경강선';
		subwayType[113] = '우이신설선'; 	subwayType[114] = '서해선'; 			subwayType[21] = '인천1호선'; 		subwayType[22] = '인천2호선';
		subwayType[31] = '대전1호선'; 		subwayType[41] = '대구1호선'; 		subwayType[42] = '대구2호선';
		subwayType[43] = '대구3호선'; subwayType[51] = '광주1호선'; 			subwayType[71] = '부산1호선';
		subwayType[72] = '부산2호선'; 	subwayType[73] = '부산3호선'; 	subwayType[74] = '부산4호선'; 		subwayType[78] = '동해선';
		subwayType[79] = '부산-김해경';		
	</script>
	
	<script>
	function Detail(Detailid, style, style2) {
		var name = Detailid;
		$(style).css('display', 'block');
		$(style2).css('display', 'none');
		$(Detailid).css('display', 'block');
	}
	function Detailnone(Detailid, style, style2) {
		var name = Detailid;
		$(style).css('display', 'block');
		$(style2).css('display', 'none');
		$(Detailid).css('display', 'none');
	}
	
	function TrainTime(TrianName){
		var Selectid = event.srcElement.id;
		$('.TrainTimediv').css('display','none');
		var Atablebackcolor = '#70c745';
		var Btablebackcolor = '#ffffff';
		$('.realtime').css('background-color',Btablebackcolor);
		$('#'+Selectid).css('background-color',Atablebackcolor);
		$('.realtime').css('color','black');
		$('#'+Selectid).css('color','white');
		TrianName.style.display = 'block';
	}
	</script>
</body>
</html>