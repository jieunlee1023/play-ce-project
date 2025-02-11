<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container">

	<div class="d-flex flex-grow-1 justify-content-center">

		<div class="seat--sample">
			<div class="">
				<div class="d-flex flex-grow-1 justify-content-center">
					<h5>💁 원하시는 방을 선택해주세요!</h5>
				</div>
				<br>

				<c:set var="done_loop" value="false" />

				<div class="d-flex flex-grow-1 justify-content-center ">
					<div class=" ml-1 mt-4">

						<div class="d-flex ml-4">
							<c:forEach var="start" begin="1" end="${totalRoomCount}">
								<c:if test="${done_loop ne true}">
									<input type="checkbox" id="${start}"
										class="d-flex justify-content-center mr-1" name="seatNumber"
										style="border: 1px solid black; width: 30px; height: 30px; accent-color: purple;"
										value="${start}">
									<c:if test="${start == firstSpace}">
				&nbsp; &nbsp; &nbsp;
				</c:if>
									<c:if test="${start == firstStandard}">
										<c:set var="done_loop" value="true" />
									</c:if>
								</c:if>
							</c:forEach>
						</div>

						<div class="d-flex ml-4 mt-1">
							<c:set var="done_loop" value="false" />
							<c:forEach var="start" begin="${firstStandard + 1}"
								end="${totalRoomCount}">
								<c:if test="${done_loop ne true}">
									<input type="checkbox" id="${start}"
										class="d-flex justify-content-center mr-1" name="seatNumber"
										style="border: 1px solid black; width: 30px; height: 30px; accent-color: purple;"
										value="${start}">
									<c:if test="${start == secondSpace}">
				&nbsp; &nbsp; &nbsp;
				</c:if>
									<c:if test="${start == secondStandard}">
										<c:set var="done_loop" value="true" />
									</c:if>
								</c:if>
							</c:forEach>
						</div>

						<br>
						<div class="d-flex ml-4">
							<c:set var="done_loop" value="false" />
							<c:forEach var="start" begin="${secondStandard + 1}"
								end="${totalRoomCount}">
								<c:if test="${done_loop ne true}">
									<input type="checkbox" id="${start}"
										class="d-flex justify-content-center mr-1" name="seatNumber"
										style="border: 1px solid black; width: 30px; height: 30px; accent-color: purple;"
										value="${start}">
									<c:if test="${start == thirdSpace}">
				&nbsp; &nbsp; &nbsp;
				</c:if>
									<c:if test="${start == thirdStandard}">
										<c:set var="done_loop" value="true" />
									</c:if>
								</c:if>
							</c:forEach>
						</div>

						<div class="d-flex ml-4 mt-1">
							<c:set var="done_loop" value="false" />
							<c:forEach var="start" begin="${thirdStandard + 1}"
								end="${totalRoomCount}">
								<c:if test="${done_loop ne true}">
									<input type="checkbox" id="${start}"
										class="d-flex justify-content-center mr-1" name="seatNumber"
										style="border: 1px solid black; width: 30px; height: 30px; accent-color: purple;"
										value="${start}">
									<c:if test="${start == foursSpace}">
				&nbsp;
				&nbsp;
				&nbsp;
						</c:if>
									<c:if test="${start == foursStandard}">
										<c:set var="done_loop" value="true" />
									</c:if>
								</c:if>
							</c:forEach>
						</div>
						<br>
						<div class="d-flex mt-2">
							<c:forEach var="start" begin="${foursStandard + 1}"
								end="${totalRoomCount}">
								<input type="checkbox" id="${start}"
									class="d-flex justify-content-center mr-1" name="seatNumber"
									style="border: 1px solid black; width: 30px; height: 30px; accent-color: purple;"
									value="${start}">
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
