<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../layout/header.jsp"%>
<br>
<div class="container" id="store-update">
	<div id="view-more-title">
		<div>✨ 매장 설정하기</div>
	</div>
	<span style="color: #6478ff">: 수정 후 아래의 수정 완료 버튼을 눌러보세요 !</span>
	<hr>
	<br>
</div>

<div class="d-flex justify-content-center">
	<c:choose>
		<c:when test="${empty store}">
			<h2 class="" style="font-weight: bold;">엥.. 관리자에게 문의해주세요.</h2>
		</c:when>

		<c:otherwise>
			<div class="container">
				<form action="/care-store/detail/update" method="POST"
					enctype="multipart/form-data" class="dropzone">
					<input type="hidden" value="${store.id}" name="id">

					<div class="form-group ">
						<div class="d-flex">
							<span class="d-flex mr-2" style="font-size: 12px">가맹점 이름 </span>

							<button type="button" data-toggle="tooltip"
								data-placement="right"
								title="가맹점 이름은 신청하신 사업자 등록증의 이름과 같아야 하므로 변경이 불가능합니다."
								id="seat--que">?</button>
						</div>

						<input type="text" class="form-control" id="storeName"
							name="storeName" value="${store.storeName}" readonly>

					</div>

					<div class="form-group ">

						<div class="d-flex">
							<span class="d-flex mr-2" style="font-size: 12px">가맹점 주소 </span>

							<button type="button" data-toggle="tooltip"
								data-placement="right"
								title="가맹점 주소는 사업자 등록증의 업장과 같아야 하므로 변경이 불가능합니다." id="seat--que">?</button>
						</div>


						<input type="text" class="form-control" id="storeAddress"
							name="storeAddress" value="${store.storeAddress}" readonly>
					</div>



					<div class="form-group ">
						<label for="storeTEL" class="d-flex m-0" style="font-size: 13px">가맹점
							번호</label> <input type="text" class="form-control" id="storeTEL"
							name="storeTEL" value="${store.storeTEL}" required>
					</div>

					<div class="form-group ">

						<div class="d-flex">
							<span class="d-flex mr-2" style="font-size: 12px">총 자리수 </span>
							<button type="button" data-toggle="tooltip"
								data-placement="right" title="숫자만 입력 가능합니다." id="seat--que">?</button>
						</div>

						<input type="number" class="form-control" id="price" name="price"
							value="${store.storeTotalRoomCount}">

					</div>

					<div class="form-group ">


						<div class="d-flex">
							<span class="d-flex mr-2" style="font-size: 12px">10분당 이용
								금액 </span>
							<button type="button" data-toggle="tooltip"
								data-placement="right" title="숫자만 입력 가능합니다." id="seat--que">?</button>
						</div>

						<input type="number" class="form-control" id="price" name="price"
							value="${store.price}">
					</div>

					<div class="d-flex" id="store--licence--text">
						<span class="d-flex mr-2" style="font-size: 13px">매장 사진</span>
					</div>

					<!-- 			<div class="custom-file">
						<input type="file" name="file" class="custom-file-input"
							id="customFile" required="required" id="storeLicense" multiple="multiple"> 
							<label
							class="custom-file-label" for="customFile">업로드 할 파일을
							선택해주세요</label>
					</div>
					
 -->

					<div id="dropzone">
						<div class="dz-message needsclick"></div>
					</div>

					<c:forEach var="image" items="${images}">
						<c:if test="${store.id eq image.store.id}">
							<img src="http://localhost:7777/storeImage/${image.imageUrl}"
								style="width: 200px; height: 200px; margin: 10px; border-radius: 10px;">
						</c:if>
					</c:forEach>
					<br> <br>
					<div class="d-flex justify-content-end">
						<button type="submit" class="btn" id="franchise--apply">수정완료!</button>
					</div>
				</form>

			</div>

		</c:otherwise>
	</c:choose>

</div>

<br>

<script>
	$(".custom-file-input").bind(
			"change",
			function() {
				console.log("test code:" + $(this).val());
				var fileName = $(this).val().split("\\").pop();
				$(this).siblings(".custom-file-label").addClass("selected")
						.html(fileName);
			});

	$(function() {
		$('[data-toggle="tooltip"]').tooltip()
	});
</script>

<!-- <script type="text/javascript" src="/js/dropZone.js"></script> -->

<%@ include file="../../../layout/footer.jsp"%>