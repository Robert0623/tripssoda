<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="/css/product/detail_product.css" rel='stylesheet' />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<div class="content">
  <!-- <div class="product-banner-wrap">11</div> -->
  <!-- <div class="detail-wrap"> -->
    <div class="right-area">
      <!-- banner생각해볼것 -->
      <p class="showCategory">${details.category}</p>
      <span class="showRating">
        <!-- 평점 : ${details.rating} &nbsp;&nbsp;|&nbsp;&nbsp; -->
        <span class="material-icons">alarm_on</span>${details.reqTime}시간 소요</span><br>
      <b class="detail-title">${details.title}</b>
      <input type="hidden" value="${details.keyword}" id="keywords">
      <div class="keywords-wrap"></div>

      <div class="detail-menu-subject"></div>
      <div class="dateList">
        <span style="float:left;">출발일이 다른 동일투어</span>
        <span style="color:rgb(119, 119, 119);float:left;">&nbsp;총 <span style="color:rgb(0, 206, 124);">${fn:length(list)}</span>건</span>
        <div style="float:right;color:rgb(119, 119, 119);"><span class="prevBtn" style="cursor:pointer;">< PREV</span><span style="font-size: 0.7em;">&nbsp;&nbsp;|&nbsp;&nbsp;</span><span class="nextBtn" style="cursor:pointer;">NEXT ></span></div>
        <br><br>
        <input id="list-length" type="hidden" value="${fn:length(list)}" >
        <c:forEach var="list" items="${list}" varStatus="statusNm">
          <a href="/product/detail?productId=${list.productId}&scheduleId=${list.scheduleId}&startDate=${list.startDate}" style="cursor:pointer;">
            <div class="date-wrapper date-wrapper-${statusNm.count}">
              <input class="list-currentMember-${statusNm.index}" type="hidden" value="${list.currentMember}" >
              <input class="list-minMember-${statusNm.index}" type="hidden" value="${list.scheduleMinMember}" >
              <input class="list-maxMember-${statusNm.index}" type="hidden" value="${list.scheduleMaxMember}" >
              <input class="list-min-current-${statusNm.index}" type="hidden" value="${list.scheduleMinMember - list.currentMember}" >
              <span><fmt:formatDate value="${list.startDate}" pattern="yyyy년 MM월 dd일 출발" /></span>
              <span class="show-list-startDate-${statusNm.index}"></span>
              <br><br>
              <span class="show-list-currentMember" style="color:rgb(0, 206, 124);">${list.currentMember}</span>
              <span style="color:rgb(119, 119, 119);">/ ${list.scheduleMaxMember}명</span>
              <progress class="currentMember" value="${list.currentMember}" min="${list.scheduleMinMember}" max="${list.scheduleMaxMember}"></progress>
              <br><br>
              <span class="show-list-min-current-${statusNm.index}"></span>
              <span class="show-list-result-${statusNm.index}" style="color:rgb(0, 206, 124);">&nbsp;투어확정</span><br>
            </div>
          </a>
        </c:forEach>
      </div>

      <!-- 상품소개 -->
      <div class="detail-menu-subject"><b class="detail-menu-subject">상품소개</b></div>
      <hr class="gray-line">
      <div class="showIntr">
        ${details.prdIntro}
      </div>

      <!-- 코스소개 -->
      <div class="detail-menu-subject"><b class="detail-menu-subject">코스소개</b></div>
      <hr class="gray-line">
      <div class="showIntr">
        ${details.courseIntro}
      </div>

      <!-- 상세안내(포함/미포함) -->
      <c:choose>
        <c:when test="${details.inclusion != '' || details.exclusion !=''}">
          <div class="detail-menu-subject"><b class="detail-menu-subject">상세안내</b></div>
          <hr class="gray-line">
          <div class="gray-rect">
            <c:choose>
              <c:when test="${details.inclusion !='' && details.inclusion != null}">
                <input type="hidden" value="${details.inclusion}" id="inclusion">
                <div class="inclusion-wrap">
                  <b>포함사항</b>
                  <div class="inclusion-content"></div>
                </div>
              </c:when>

              <c:when test="${details.inclusion != '' && details.exclusion !=''}"><br><br></c:when>

              <c:when test="${details.exclusion !='' && details.exclusion != null}">
                <input type="hidden" value="${details.exclusion}" id="exclusion">
                <div class="exclusion-wrap">
                  <b>미포함사항</b>
                  <div class="exclusion-content"></div>
                </div>
              </c:when>
            </c:choose>
          </div>
        </c:when>
      </c:choose>



      

      <!-- 추가정보 -->
      <c:if test="${details.additionalInfo != null && details.additionalInfo != ''}">
        <div class="detail-menu-subject"><b class="detail-menu-subject">추가정보</b></div>
        <hr class="gray-line">
        <div class="gray-rect">
          <input type="hidden" value="${details.additionalInfo}" id="additionalInfos">
          <div class="additionalInfo-content"></div>
        </div>
      </c:if>

      <!-- 만나는 장소 -->
      <c:if test="${details.meetingPoint != null && details.meetingPoint != ''}">
        <div class="detail-menu-subject"><b class="detail-menu-subject">만나는 장소</b></div>
        <hr class="gray-line">
        <div class="gray-rect">
          <div class="showIntr">
            ${details.meetingPoint}
          </div>
        </div>
      </c:if>

      <!-- 유의사항(필수안내, 환불정책) -->
      <c:choose>
        <c:when test="${details.mandatoryGuidance != '' || details.refundPolicy !=''}">
          <div class="detail-menu-subject"><b class="detail-menu-subject">유의사항</b></div>
          <hr class="gray-line">
          <div class="gray-rect">
            <c:choose>
              <c:when test="${details.mandatoryGuidance !='' && details.mandatoryGuidance != null}">
                <input type="hidden" value="${details.mandatoryGuidance}" id="mandatoryGuidance">
                <div class="mandatoryGuidance-wrap">
                  <b>필수안내</b>
                  <div class="mandatoryGuidance-content"></div>
                </div>
              </c:when>

              <c:when test="${details.mandatoryGuidance != '' && details.refundPolicy !=''}"><br><br></c:when>

              <c:when test="${details.refundPolicy !='' && details.refundPolicy != null}">
                <input type="hidden" value="${details.refundPolicy}" id="refundPolicy">
                <div class="refundPolicy-wrap">
                  <b>환불정책</b>
                  <div class="refundPolicy-content"></div>
                </div>
              </c:when>
            </c:choose>
          </div>
        </c:when>
      </c:choose>
    </div>

      <div id="chase">
        <input id="currentMember" type="hidden" value="${details.currentMember}" >
        <input id="minMember" type="hidden" value="${details.minMember}" >
        <input id="maxMember" type="hidden" value="${details.maxMember}" >
        <input id="min-current" type="hidden" value="${details.minMember - details.currentMember}" >

        <span class="show-currentMember" style="color:rgb(0, 206, 124);">${details.currentMember}</span>
        <span style="color:rgb(119, 119, 119);">/ ${details.maxMember}명</span>
        <progress class="currentMember" value="${details.currentMember}" min="${details.minMember}" max="${details.maxMember}"></progress>
        <span class="show-min-current"></span>
        <span style="color:rgb(0, 206, 124);">투어확정</span><br>
        <span class="show-startDate"><fmt:formatDate value="${details.startDate}" pattern="yyyy년 MM월 dd일 출발" /></span><br><br>
        <span class="show-price"><fmt:formatNumber type="number" maxFractionDigits="3" value="${details.schedulePrice}" /></span>
        <a href="/payment/reservation?productId=${details.productId}&scheduleId=${details.scheduleId}">
          <div class="reserveBtn">예약하기</div>
        </a>
        </div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/script/product/detail_product.js"></script>
