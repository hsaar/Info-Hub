<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<<<<<<< HEAD
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>누림 — 최신기사</title>
  <!-- 고운바탕/고운돋움 (상황에 따라 교체 가능) -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@700&family=Gowun+Dodum&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="<c:url value='/resources/css/main.css' />">
</head>
<body>
  <!-- ===== Header ===== -->
  <header class="topbar">
    <div class="container inner">
      <div class="brand">
        <div class="site-title">누림</div>
        <nav class="menu" aria-label="주요 메뉴">
          <a href="#">최신뉴스</a>
          <a href="#">뉴스검색</a>
          <a href="#">타임라인</a>
          <a href="#">게시판</a>
        </nav>
      </div>
      <div class="actions">
        <button class="icon-btn" aria-label="검색">
          <svg viewBox="0 0 24 24"><path d="M10 2a8 8 0 105.293 14.293l4.707 4.707 1.414-1.414-4.707-4.707A8 8 0 0010 2zm0 2a6 6 0 110 12A6 6 0 0110 4z"/></svg>
        </button>
        <button class="icon-btn" aria-label="로그인">
          <svg viewBox="0 0 24 24"><path d="M12 12a5 5 0 100-10 5 5 0 000 10zm-7 9a7 7 0 0114 0v1H5v-1z"/></svg>
        </button>
        <button class="icon-btn" aria-label="마이페이지">
          <svg viewBox="0 0 24 24"><path d="M3 5h18v2H3V5zm0 6h18v2H3v-2zm0 6h18v2H3v-2z"/></svg>
        </button>
      </div>
    </div>
  </header>

  <!-- ===== Page Head ===== -->
  <div class="container page-head">
    <h1 class="page-title">최신뉴스</h1>
    <div class="eyebrow">2025년 9월 18일 수요일</div>
  </div>

  <!-- ===== Main Layout ===== -->
  <main class="container layout">
    <!-- 좌: 기사 리스트 -->
    <section aria-label="최신 뉴스" class="list col" style="padding:16px; background:linear-gradient(135deg, rgba(192,204,230,.18), rgba(201,225,249,.18));">
      <!-- 아이템 반복 샘플 -->
      <article class="item">
        <div>
          <h3><a href="#">[오늘의 언론동향] 2025년 9월 17일 요일</a></h3>
          <div class="meta">09-17 13:02 · 미디어정책 · 3분 읽기</div>
          <p class="meta" style="margin-top:8px">요약 텍스트가 들어갑니다. 기관·단체 동향, 정책 브리핑, 주요 이슈 한눈에 보기.</p>
        </div>
        <div class="thumb" role="img" aria-label="썸네일"></div>
      </article>

      <article class="item">
        <div>
          <h3><a href="#">“AI와 함께 일하는 시대… 기자의 격차 더 벌어진다”</a></h3>
          <div class="meta">09-17 09:52 · 저널리즘 · 4분 읽기</div>
          <p class="meta" style="margin-top:8px">협회 회의실 초청연사 세션 요약. 구글 뉴스랩, 팩트체크, 편집 정책 변화.</p>
        </div>
        <div class="thumb" role="img" aria-label="썸네일"></div>
      </article>

      <article class="item">
        <div>
          <h3><a href="#">[오늘의 언론동향] 2025년 9월 16일 화요일</a></h3>
          <div class="meta">09-16 13:38 · 미디어산업 · 2분 읽기</div>
          <p class="meta" style="margin-top:8px">결산: 지역신문 지원, 구독 모델, 크리에이터 협업 기사 모음.</p>
        </div>
        <div class="thumb" role="img" aria-label="썸네일"></div>
      </article>
      <article class="item">
        <div>
          <h3><a href="#">[오늘의 언론동향] 2025년 9월 16일 화요일</a></h3>
          <div class="meta">09-16 13:38 · 미디어산업 · 2분 읽기</div>
          <p class="meta" style="margin-top:8px">결산: 지역신문 지원, 구독 모델, 크리에이터 협업 기사 모음.</p>
        </div>
        <div class="thumb" role="img" aria-label="썸네일"></div>
      </article>
      <article class="item">
        <div>
          <h3><a href="#">[오늘의 언론동향] 2025년 9월 16일 화요일</a></h3>
          <div class="meta">09-16 13:38 · 미디어산업 · 2분 읽기</div>
          <p class="meta" style="margin-top:8px">결산: 지역신문 지원, 구독 모델, 크리에이터 협업 기사 모음.</p>
        </div>
        <div class="thumb" role="img" aria-label="썸네일"></div>
      </article>
      <article class="item">
        <div>
          <h3><a href="#">[오늘의 언론동향] 2025년 9월 16일 화요일</a></h3>
          <div class="meta">09-16 13:38 · 미디어산업 · 2분 읽기</div>
          <p class="meta" style="margin-top:8px">결산: 지역신문 지원, 구독 모델, 크리에이터 협업 기사 모음.</p>
        </div>
        <div class="thumb" role="img" aria-label="썸네일"></div>
      </article>
      <article class="item">
        <div>
          <h3><a href="#">[오늘의 언론동향] 2025년 9월 16일 화요일</a></h3>
          <div class="meta">09-16 13:38 · 미디어산업 · 2분 읽기</div>
          <p class="meta" style="margin-top:8px">결산: 지역신문 지원, 구독 모델, 크리에이터 협업 기사 모음.</p>
        </div>
        <div class="thumb" role="img" aria-label="썸네일"></div>
      </article>
      <article class="item">
        <div>
          <h3><a href="#">[오늘의 언론동향] 2025년 9월 16일 화요일</a></h3>
          <div class="meta">09-16 13:38 · 미디어산업 · 2분 읽기</div>
          <p class="meta" style="margin-top:8px">결산: 지역신문 지원, 구독 모델, 크리에이터 협업 기사 모음.</p>
        </div>
        <div class="thumb" role="img" aria-label="썸네일"></div>
      </article>
      <article class="item">
        <div>
          <h3><a href="#">[오늘의 언론동향] 2025년 9월 16일 화요일</a></h3>
          <div class="meta">09-16 13:38 · 미디어산업 · 2분 읽기</div>
          <p class="meta" style="margin-top:8px">결산: 지역신문 지원, 구독 모델, 크리에이터 협업 기사 모음.</p>
        </div>
        <div class="thumb" role="img" aria-label="썸네일"></div>
      </article>

      <!-- 페이지네이션 -->
      <nav class="pager" aria-label="페이지">
        <a class="pill" href="#prev">이전</a>
        <a class="pill" href="#" aria-current="page">1</a>
        <a class="pill" href="#2">2</a>
        <a class="pill" href="#3">3</a>
        <a class="pill" href="#next">다음</a>
      </nav>
    </section>

    <!-- 우: 많이 본 기사 -->
    <aside class="sidebar"role="complementary" aria-label="사이드바">

      <div class="stack">
            <div class="box col" style="padding:18px">
        <h2>많이 본 기사</h2>
        <ol class="rank">
          <li><a class="dot-link" href="#">인더스트리뉴스, 제7회 인터넷신문 대상 수상</a></li>
          <li><a class="dot-link" href="#">[오늘의 언론동향] 9월 5일 금요일</a></li>
          <li><a class="dot-link" href="#">청년플러스포럼: ‘NEW Green Generation’</a></li>
          <li><a class="dot-link" href="#">[신연수 칼럼] 누가 누구를 개혁하는가</a></li>
        </ol>
      </div>
      </div>
      <div class="box col" style="margin-top:14px; padding:0; overflow:hidden;">
        <div style="padding:16px 18px; border-bottom:1px solid var(--mist-200); background:linear-gradient(90deg, var(--panel-left), var(--panel-right));">
          <h2>포토·영상</h2>
        </div>
        <div style="padding:14px 18px; display:grid; gap:10px">
          <div class="thumb" style="aspect-ratio:16/9"></div>
          <div class="thumb" style="aspect-ratio:16/9"></div>

        </div>
      </div>
    </aside>

  </main>

  <footer class="container">© 2025 Num — Mist Blue Theme</footer>
</body>
</html>
