<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- div 클래스에 id 지정 : id="member-table-container" --%>
<div class="bg-white rounded-3xl shadow-xl overflow-hidden border border-gray-200" id="member-table-container">
    <div class="p-6 border-b flex justify-between items-center bg-gray-50/50">
        <h2 class="text-xl font-black text-gray-800">회원 명단</h2>
        <div class="flex space-x-2">
            <!-- [패턴 4] 벌크 삭제 버튼 -->
            <%-- 
            1. hx-include를 사용하여 bulk-form의 ids들이 포함되게 강제
            2. hx-target을 통해서 지금 최상단 div을 타겟으로 지정            
            --%>
            <button form="bulk-form" 
                hx-post="${pageContext.request.contextPath}/crm/bulk-delete" 
                hx-include="#bulk-form"
                hx-target="#member-table-container"
                hx-confirm="정말로 삭제하시겠습니까?" 
                class="bg-red-500 text-white px-4 py-2 rounded-xl text-sm font-bold shadow-lg shadow-red-100">
                선택 삭제
            </button>
            <!-- [패턴 2] 등록 모달 열기 -->
            <%-- 3. 모달 열기 위한 처리 --%>
            <button hx-get="${pageContext.request.contextPath}/crm/add-form"
                hx-target="body"
                hx-swap="beforeend"
                class="bg-indigo-600 text-white px-4 py-2 rounded-xl text-sm font-bold">
            신규 등록
            </button> 
        </div>
    </div>

    <form id="bulk-form">
        <table class="min-w-full">
            <thead class="bg-gray-50 text-gray-400 text-xs font-bold uppercase tracking-widest">
                <tr>
                    <th class="p-4 w-10"><input type="checkbox" onclick="toggleAll(this)"></th>
                    <th class="p-4 text-left">이름/이메일</th>
                    <th class="p-4 text-left">역할</th>
                    <th class="p-4 text-right">관리</th>
                </tr>
            </thead>
            <tbody id="member-list-body">
                <!-- [패턴 3] 초기 데이터 로드 -->
                <tr hx-get="${pageContext.request.contextPath}/crm/list?page=1" hx-trigger="load" hx-swap="outerHTML"></tr>
            </tbody>
        </table>
    </form>
</div>
<script>
    // 4. 전체 선택/해제 스크립트를 추가
    function toggleAll(source) {
        const checkboxes = document.getElementsByName('ids');
        for (let i = 0; i < checkboxes.length; i++) {
            checkboxes[i].checked = source.checked;
        }
    }
</script>
