<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="../layout/header.jsp"%>



<div class="join--form">
	<div class="container d-flex justify-content-center" id="join--main">
		<div class="container">
			<form>
				<div class="form-group ">
					<label for="username" class="d-flex m-0">아이디</label> <input
						type="text" class="form-control " id="username" name="username"
						value="minicar" required> <font id="id-feedback" size="3"></font>
				</div>
				<div class="form-group">
					<label for="password" class="d-flex m-0">비밀번호</label> <input
						type="password" class="form-control" id="password"
						value="asd123!!" required>
				</div>
				<div class="form-group">
					<label for="password-check" class="d-flex m-0">비밀번호 확인</label> <input
						type="password" class="form-control" id="password-check"
						value="asd123!!" required>
				</div>
				<div class="form-group">
					<label for="email" class="d-flex m-0">이메일</label> <input
						type="email" class="form-control" id="email" name="email"
						value="1@naver.com" required> <font
						id="email-feedback-email" size="3"></font>
				</div>
				<div class="form-group">
					<label for="phoneNumber" class="d-flex m-0">휴대전화</label> <input
						type="text" class="form-control" id="phoneNumber"
						value="010-1111-1111" required>
				</div>
			</form>

			<br>
			<div class="form-control d-flex justify-content-center"
				id="joinbutton">
				<button type="button" id="btn--save" class="d-flex" style="background-color: transparent;">회원가입</button>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="/js/user.js"></script>
</div>
<%@ include file="../layout/shortFooter.jsp"%>