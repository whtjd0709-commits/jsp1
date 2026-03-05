<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
[종합 프로젝트 - 패턴 2 통합]
신규 회원 등록 모달 및 실시간 이메일 중복 검증
--%>
<div id="modal-backdrop" class="fixed inset-0 bg-slate-900/50 backdrop-blur-sm z-50 flex items-center justify-center animate-in fade-in duration-300">
    <div class="bg-white w-full max-w-lg rounded-3xl shadow-2xl overflow-hidden animate-in zoom-in-95 duration-300">

        <!-- 모달 헤더 -->
        <div class="p-6 border-b bg-gray-50 flex justify-between items-center">
            <h3 class="text-xl font-black text-gray-800">신규 회원 등록</h3>
            <button onclick="document.getElementById('modal-backdrop').remove()" class="text-gray-400 hover:text-gray-600">
                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path d="M6 18L18 6M6 6l12 12" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/></svg>
            </button>
        </div>

        <!-- 등록 폼 -->
        <form hx-post="${pageContext.request.contextPath}/crm/add" 
            hx-on::after-request="if(event.detail.successful && event.detail.requestConfig.verb === 'post') document.getElementById('modal-backdrop').remove()"
            hx-target="#member-list-body" 
            hx-swap="afterbegin"
            class="p-8 space-y-6">
            
            <!-- 이름 입력 -->
            <div>
                <label class="block text-sm font-bold text-gray-700 mb-2">이름</label>
                <input type="text" name="name" required placeholder="홍길동"
                    class="w-full px-4 py-3 rounded-xl border border-gray-200 focus:ring-2 focus:ring-indigo-500 outline-none transition">
            </div>

            <!-- 이메일 입력 [패턴 2: 실시간 검증 적용] -->
            <div class="relative">
                <label class="block text-sm font-bold text-gray-700 mb-2">이메일 주소</label>
                <input type="email" name="email" required placeholder="example@mail.com"
                    class="w-full px-4 py-3 rounded-xl border border-gray-200 focus:ring-2 focus:ring-indigo-500 outline-none transition"
                    hx-get="${pageContext.request.contextPath}/crm/validate-email" 
                    hx-trigger="keyup changed delay:500ms" 
                    hx-target="#email-validation-msg"
                    hx-indicator="#val-spinner">
                
                <!-- 검증 로딩 인디케이터 -->
                <div id="val-spinner" class="htmx-indicator absolute right-4 top-11">
                    <svg class="animate-spin h-4 w-4 text-indigo-500" viewBox="0 0 24 24">
                        <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4" fill="none"></circle>
                        <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                    </svg>
                </div>

                <!-- 검증 메시지 영역 -->
                <div id="email-validation-msg" class="mt-2 min-h-[20px]"></div>
            </div>

            <!-- 역할 선택 -->
            <div>
                <label class="block text-sm font-bold text-gray-700 mb-2">권한 설정</label>
                <select name="role" class="w-full px-4 py-3 rounded-xl border border-gray-200 focus:ring-2 focus:ring-indigo-500 outline-none transition bg-white">
                    <option value="User">일반 사용자 (User)</option>
                    <option value="Admin">관리자 (Admin)</option>
                    <option value="Editor">편집자 (Editor)</option>
                </select>
            </div>

            <!-- 액션 버튼 -->
            <div class="flex space-x-3 pt-4">
                <button type="button" onclick="document.getElementById('modal-backdrop').remove()"
                        class="flex-1 px-6 py-3 border border-gray-200 text-gray-500 font-bold rounded-xl hover:bg-gray-50 transition">
                    취소
                </button>
                <button type="submit" class="flex-1 px-6 py-3 bg-indigo-600 text-white font-bold rounded-xl hover:bg-indigo-700 shadow-lg shadow-indigo-100 transition">
                    회원 등록 완료
                </button>
            </div>
        </form>
    </div>
</div>