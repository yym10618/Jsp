<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="sub">
    <div><img src="/Farmstory2/img/sub_top_tit3.png" alt="CROP TALK"></div>
    <section class="cate3">
        <aside>
            <img src="/Farmstory2/img/sub_aside_cate3_tit.png" alt="농작물이야기"/>
            <ul class="lnb">
                <li class="${type == 'story' ? 'on':'off'}"><a href="/Farmstory2/board/list.do?cate=croptalk&type=story">농작물이야기</a></li>
                <li class="${type == 'grow' ? 'on':'off'}"><a href="/Farmstory2/board/list.do?cate=croptalk&type=grow">텃밭가꾸기</a></li>
                <li class="${type == 'school' ? 'on':'off'}"><a href="/Farmstory2/board/list.do?cate=croptalk&type=school">귀농학교</a></li>
            </ul>
        </aside>
        <article>
            <nav>
                <img src="/Farmstory2/img/sub_nav_tit_cate3_${type}.png" alt="농작물이야기"/>
                <p>
                    HOME > 농작물이야기 > 
                    <c:if test="${type == 'story'}"><em>농작물이야기</em></c:if>
                    <c:if test="${type == 'grow'}"><em>텃밭가꾸기</em></c:if>
                    <c:if test="${type == 'school'}"><em>귀농학교</em></c:if>
                </p>
            </nav>
            <!-- 내용 시작 -->