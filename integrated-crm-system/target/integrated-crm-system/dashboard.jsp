<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Hypermedia CRM Dashboard</title>
    <script src="https://unpkg.com/htmx.org@2.0.0"></script>
    <script src="https://unpkg.com/htmx-ext-sse@2.2.2/sse.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen" hx-ext="sse" sse-connect="${pageContext.request.contextPath}/crm-sse">

    <!-- [패턴 6] 글로벌 알림 영역 (SSE) -->
    <div sse-swap="system-alert" hx-swap="afterbegin" id="toast-container" class="fixed top-5 right-5 z-50 space-y-2"></div>

    <div class="flex">
        <!-- 사이드바 [패턴 5: 탭 전환] -->
        <aside class="w-64 bg-slate-900 h-screen text-white p-6 sticky top-0">
            <h1 class="text-2xl font-black mb-10 text-indigo-400">CRM v2.0</h1>
            <nav class="space-y-2">
                <button hx-get="${pageContext.request.contextPath}/crm/?tab=members" hx-target="#main-content" 
                        class="w-full text-left p-3 rounded-xl hover:bg-slate-800 transition font-bold flex items-center">
                    <span class="mr-3">👥</span> 회원 관리
                </button>
                <button hx-get="${pageContext.request.contextPath}/crm/?tab=stats" hx-target="#main-content" 
                        class="w-full text-left p-3 rounded-xl hover:bg-slate-800 transition font-bold flex items-center">
                    <span class="mr-3">📊</span> 시스템 통계
                </button>
            </nav>
        </aside>

        <!-- 메인 컨텐츠 영역 -->
        <main class="flex-grow p-10">
            <div id="main-content" class="animate-in fade-in duration-500">
                <!-- 초기 로드: 회원 목록 [패턴 3] -->
                <div hx-get="${pageContext.request.contextPath}/crm/?tab=members" hx-trigger="load" hx-swap="innerHTML">
                    <p class="text-gray-400">데이터를 불러오고 있습니다...</p>
                </div>
            </div>
        </main>
    </div>

    <script>
        // 벌크 삭제 후 목록 새로고침 이벤트 리스너
        document.body.addEventListener('memberChanged', function() {
            htmx.ajax('GET', '${pageContext.request.contextPath}/crm/?tab=members', '#main-content');
        });
    </script>
</body>
</html>
