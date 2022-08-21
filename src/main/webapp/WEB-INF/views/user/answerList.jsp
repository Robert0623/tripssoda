<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<title>내 QnA</title>
<link rel="stylesheet" href="<c:url value="/css/user/qnaList.css"/>">

<div class="main">
    <div class="contents">
        <h2 class="title">내 QnA</h2>
        <div class="question">
            <div class="menu">
                <div class="show-question">작성한 질문 (${totalQuestionCnt})</div>
                <div class="show-answer">작성한 답변 (${totalAnswerCnt}) </div>
            </div>
            <c:forEach var="answerDto" items="${answerDtoList}">
                <div class="answer">
                    <div class="nickname">${nickname}</div>
                    <div class="reg-date"><fmt:formatDate value="${answerDto.createdAt}" pattern="yyyy-MM-dd HH:ss"/></div>
                    <div class="answer-text">${answerDto.content}</div>
                </div>
            </c:forEach>

            <div class="paging-container">
                <div class="paging">
                    <c:if test="${totalAnswerCnt==null || totalAnswerCnt==0}">
                        <div> 게시물이 없습니다. </div>
                    </c:if>
                    <c:if test="${totalAnswerCnt!=null && totalAnswerCnt!=0}">
                        <c:if test="${ph.showPrev}">
                            <a class="page" href="<c:url value="/mypage/answerList${ph.sc.getQueryString(ph.beginPage-1)}"/>">&lt;</a>
                        </c:if>
                        <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                            <a class="page ${i==ph.sc.page? "paging-active" : ""}" href="<c:url value="/mypage/answerList${ph.sc.getQueryString(i)}"/>">${i}</a>
                        </c:forEach>
                        <c:if test="${ph.showNext}">
                            <a class="page" href="<c:url value="/mypage/answerList${ph.sc.getQueryString(ph.endPage+1)}"/>">&gt;</a>
                        </c:if>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(".show-answer").on("click", function() {
        location.href="/mypage/answerList";
    });

    $(".show-question").on("click", function() {
        location.href="/mypage/qnaList";
    });
</script>

