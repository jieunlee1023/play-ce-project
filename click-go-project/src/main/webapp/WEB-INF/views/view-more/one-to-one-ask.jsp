<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

<div class="container" id="terms">

   <div id="view-more-title">
      <div>📝 1:1 문의</div>
   </div>
   <br>



   <div class="container mt-5" id="tab-menu">
      <div id="tab-btn" class="d-flex">
         <ul>
            <li class="active"><a href="#" style="text-decoration: none;">나의 문의 내역</a></li>
            <li class="active"><a href="#" style="text-decoration: none;">새 문의 작성</a></li>
         </ul>
      </div>
      <div id="tab-cont">
         <div id="tab-cont-1">
            <div class="container">
               <table class="table" id="answer-list-table">
                  <thead>
                     <tr style="text-align: center;">
                        <th>접수번호</th>
                        <th>문의제목</th>
                        <th>답변여부</th>
                        <th>작성시간</th>
                     </tr>
                  </thead>
                  <tbody>
                     <c:forEach var="askList" items="${askList }">
                        <c:choose>
                           <c:when test="${askList.user.id eq principal.user.id}">
                              <tr style="text-align: center;">
                                 <td>${askList.id }</td>
                                 <td><a style="text-decoration: none; color: gray;" href="/admin/one-to-one-answer/${askList.id }">${askList.title }</a></td>
                                 <td><c:choose>
                                       <c:when test="${askList.answer eq '0' }">
                                          <span class="badge badge-warning">답변대기</span>
                                       </c:when>
                                       <c:otherwise>
                                          <span class="badge badge-success">답변완료</span>
                                       </c:otherwise>
                                    </c:choose></td>
                                 <td>${askList.createDate }</td>
                              </tr>
                           </c:when>
                        </c:choose>
                     </c:forEach>
                  </tbody>
               </table>
            </div>
         </div>



         <div id="tab-cont-2">
            <div class="container">
               <form action="/view-more/one-to-one-ask/save" method="post">
                  <input type="hidden" id="id" value="${principal.user.id }">
                  <div class="d-flex flex-column">
                     <div class="pb-5">
                        <h4>클릭고 이용 중 불편하신 점을 문의주시면 최대한 빠른 시일내에 답변 드리겠습니다.</h4>
                     </div>
                     <hr>
                     <div class="d-flex flex-column mb-5">
                        <h5>문의유형</h5>
                        <div class="form-group" style="width: 30%;">
                           <input class="form-control" name="title" placeholder="문의하실 제목을 입력하세요" required="required"></input>
                        </div>
                     </div>
                     <hr>
                     <div class="d-flex flex-column mb-5">
                        <h5>문의내용</h5>
                        <div class="form-group">
                           <textarea name="content" id="content" rows="5" class="form-control content" cols="" required="required"></textarea>
                        </div>
                     </div>
                     <hr>
                     <div class="d-flex flex-column mb-5">
                        <ul>
                           <li>문의하실 내용을 10자 이상 입력해 주세요.</li>
                           <li>문의하시는 제휴점 이름과 예약정보를 남겨주시면 보다 빠른 상담이 가능합니다.</li>
                           <li>문의 내용 작성 시 개인정보가 입력되지 않도록 주의 부탁드립니다.</li>
                        </ul>
                     </div>
                     <div class="d-flex justify-content-center">
                        <button class="btn btn-light" type="submit">작성 완료</button>
                     </div>
                  </div>
               </form>
            </div>
         </div>
      </div>
   </div>
</div>



<script>
   $('.content').summernote({
      placeholder : '문의하실 내용을 입력해주세요',
      tabsize : 2,
      height : 300,
   });
</script>

<script type="text/javascript">
   var tabBtn = $("#tab-btn > ul > li"); //각각의 버튼을 변수에 저장
   var tabCont = $("#tab-cont > div"); //각각의 콘텐츠를 변수에 저장

   //컨텐츠 내용을 숨겨주세요!
   tabCont.hide().eq(0).show();

   tabBtn.click(function() {
      var target = $(this); //버튼의 타겟(순서)을 변수에 저장
      var index = target.index(); //버튼의 순서를 변수에 저장
      tabBtn.removeClass("active"); //버튼의 클래스를 삭제
      target.addClass("active"); //타겟의 클래스를 추가
      tabCont.css("display", "none");
      tabCont.eq(index).css("display", "block");
   });
</script>






<%-- <%@ include file="../layout/footer.jsp"%> --%>
