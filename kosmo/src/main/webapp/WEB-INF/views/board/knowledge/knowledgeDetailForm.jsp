<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- Title -->
<title>Helper - Foriener &amp; Help HTML Template</title>

<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/favicon.ico">

<!-- Core Stylesheet -->
<link rel="stylesheet" href="resources/style.css">


</head>
<div class="preloader d-flex align-items-center justify-content-center">
	<div class="preloader-circle"></div>
	<div class="preloader-img">
		<img src="resources/img/core-img/leaf.png" alt="">
	</div>
</div>

<jsp:include page="../../setting/header01.jsp" flush="false" />

<!-- ##### Breadcrumb Area Start ##### -->
<div class="breadcrumb-area">
	<!-- Top Breadcrumb Area -->
	<div
		class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
		style="background-image: url(img/bg-img/24.jpg);">
		<h2>CONTENT</h2>
	</div>
</div>
<!-- ##### Breadcrumb Area End ##### -->
<!-- ##### Header Area End ##### -->
<div class="container" style="margin-bottom: 50px;margin-top: 30px;">
<div style="width:800px; margin:auto;">

<!-- 동욱이 css -->
<link rel="stylesheet" href="resources/ehddnr.css">
<script type="text/javascript" src="resources/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	function knowledgeCommentFormchk(){
		if(!$('#kCommentContent').val()){
			$('#kCommentContent').focus();
			$('#kCommentContent').attr('placeholder',"내용을 입력하세요.");
			$('#kCommentContent').focus().fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500);
			return false;
		} 
	}
		$(function() {
			$('textarea.content').keyup(function() {
				bytesHandler(this);
			});
		});

		function getTextLength(str) {
			var len = 0;

			for (var i = 0; i < str.length; i++) {
				if (escape(str.charAt(i)).length == 6) {
					len++;
				}
				len++;
			}
			return len;
		}

		function bytesHandler(obj) {
			var text = $(obj).val();
			$('p.bytes').text(getTextLength(text));
		}

		function knowledge() {
			window.location = "knowledge";
		}
		function thbackground(Reward_th) {
			var Reward_th2 = $(Reward_th).text();
			$('.knowledgeWriteForm_Reward_th').css('background-color', '#fff');
			$(Reward_th).css('background-color', 'green');
			$('#addReward').val(Reward_th2);
		}
		function knowledgeWriteForm_Reward_block() {
			$('.knowledgeWriteForm_Reward').css('display', 'block')
			
		}
		function knowledgeWriteForm_Reward_none() {
			$('.knowledgeWriteForm_Reward').css('display', 'none')
			$('#addReward').val('0');
		}
		function knowledgeWriteForm_addReward(){
			
			var addReward = $('#addReward').val();
			if(!$.isNumeric(addReward)){
				$('#addReward').focus();
				$('#addReward').val(null);
				$('#addReward').attr('placeholder',"숫자를 입력하세요.");
				$('#addReward').focus().fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500);
				return false;
			} 
			$('p.class_addReward').text('포인트 '+addReward+'을 채택자에게 드립니다.');
			$('.knowledgeWriteForm_Reward').css('display', 'none')
		}
	</script>
		<ul>
			<li>
				<p>
				 <img src="resources/img/knowledgeDetailForm.png"> 
				 	<span>&nbsp;${dtos.knowledgeReward}&nbsp;</span>
				 	<span style="font-size:20px;font-weight: bold;">${dtos.knowledgeSubject}</span>
				 	<span style="float:right;"><input type="button" class="knowledgeWriteForm_button3" value="신고하기" onclick=""></span>
				</p>
			</li>
			<li style="width: 100%; margin: 0 0 20px 0;">
				${dtos.knowledgeContent}
			</li>
			<li>
			<c:if test="${dtos.knowledgeOpenCheck=='Y'}">
			<span style="">${dtos.memberId}</span>
			</c:if>
			<c:if test="${dto.sknowledgeOpenCheck=='N'}">
			<span >비공개</span>
			</c:if>
			<span style="margin-left:50px;">${dtos.knowledgeCategory}</span>
			<span style="margin-left:50px;">${dtos.knowledgeRegdate}</span>
			</li>	
		</ul>
	</div>

</div>
<div align="center" style="background-color:#c0c0c0;padding:30px 0">
	<sec:authorize access="isAuthenticated()">
		<div style="width:800px;background-color:#fff;">
			<form action="knowledgeCommentPro" method="post" name="knowledgeCommentForm" onsubmit="return knowledgeCommentFormchk()">
				<ul>
					<li style="border-bottom:1px solid black;">
						<p align="left" style="padding:10px 50px 0 50px;">
							<span style="font-size:18px;">${userVO.memberId}님, 답변해주세요!</span><br>
							<span>답변하시면 포인트 10점을 답변이 채택되면 포인트 25점을 드립니다.</span>
						</p>
					</li>
					<li style="width: 100%; height: 300px; margin: 0 0 0 0;">
						<textarea style="border:none;width: 100%; height: 100%; padding:3px 10px;margin:0; border-top:1px solid black;" name="kCommentContent" id="kCommentContent"></textarea>
					</li>
					<li align="center" style="padding:30px 0; border-top:1.5px solid black;">
						<p align="left">
						<input style="margin-left:30px;"class="knowledgeWriteForm_button3" type="button" value="ID 공개여부">
						<input type="radio" name="kCommentTemp1" value="Y" checked="checked">공개
						<input type="radio" name="kCommentTemp1" value="N" >비공개
						</p>
						<input type="hidden" name="knowledgeNumber" value="${dtos.knowledgeNumber}">
						<input type="hidden" name="knowledgememberId" value="${dtos.memberId}">
						<input class="knowledgeDetailForm_button2" type="submit" value="답변등록">
						<input class="knowledgeDetailForm_button2" type="button" value="목록보기" onclick="window.location='knowledgeBoardList'">
					</li>
				</ul>
			</form>
		</div>
	</sec:authorize>
<sec:authorize access="isAnonymous()">
	<div style="width:800px;height:60px;margin:auto auto;background-color:#fff;">
		<ul>
			<li style="padding:13px 10px 0 0;display:inline-block;">
				<span style="font-size:20px;">
				답변하시면 포인트 10점을 답변이 채택되면 포인트 25점을 드립니다.</span>
			</li>
			<li style="display:inline;padding-top:2.5px;">
				<input class="knowledgeDetailForm_button2" style="font-weight: bold;display:inline;font-size:15px;" type="button" value="답변등록" onclick="window.location='loginCheck'">
			</li>
		</ul>
	</div>
</sec:authorize>
	
	<c:if test="${kCommentVO != null}">
		<div style="width:800px;background-color:#fff;margin-top:30px;padding:3px 10px">
			<c:forEach var="kc" items="${kCommentVO}">
				<ul align="left" style="padding:0;margin:0" id="${kc.kCommentNumber}">
					<li>
						<c:if test="${kc.kCommentTemp1=='N'}">
						<span>비공개</span>
						</c:if>
						<c:if test="${kc.kCommentTemp1=='Y'}">
						<span>${kc.memberId}</span>
						</c:if>
						<c:if test="${dtos.memberId==userVO.memberId && kc.memberId!=userVO.memberId}">
						<span style="float:right;margin-left:10px;"><a href="">채택</a></span>
						</c:if>
						<c:if test="${kc.memberId==userVO.memberId}">
						<span style="float:right;margin-left:10px;"><a href="kCommentdelete?kCommentNumber=${kc.kCommentNumber}&knowledgeNumber=${kc.knowledgeNumber}">삭제</a></span>
						<span style="float:right;margin-left:10px;"><a href="">수정</a></span>
						</c:if>
					</li>
					<li>
						<span>${kc.kCommentContent}</span>
					</li>
					<li>
						<span>${kc.kCommentRegdate}</span>
					</li>
				</ul>
				<hr style="margin:3px 0;">
			</c:forEach>
		</div>
	</c:if>
</div>

<!-- ##### Contact Area End ##### -->

<jsp:include page="../../setting/footer01.jsp" flush="false" />
<!-- ##### Footer Area End ##### -->

</body>
</html>