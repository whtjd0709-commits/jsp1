<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:forEach var="m" items="${members}" varStatus="status">
    <tr class="hover:bg-slate-50 transition border-b border-gray-100 group" id="member-row-${m.id()}">
        <td class="p-4">
            <input type="checkbox" name="ids" value="${m.id()}" class="rounded border-gray-300">
        </td>
        <td class="p-4">
            <div class="font-bold text-gray-800">${m.name()}</div>
            <div class="text-xs text-gray-400">${m.email()}</div>
        </td>
        <td class="p-4">
            <span class="px-2 py-1 bg-indigo-50 text-indigo-600 text-[10px] font-black rounded uppercase">${m.role()}</span>
        </td>
        <td class="p-4 text-right">
            <!-- [패턴 1] 인라인 편집 트리거 -->
            <button hx-get="${pageContext.request.contextPath}/crm/edit?id=${m.id()}" 
                    hx-target="#member-row-${m.id()}" 
                    hx-swap="outerHTML"
                    class="text-xs text-gray-400 hover:text-indigo-600 font-bold transition">EDIT</button>
        </td>
        
        <%-- 마지막 요소일 경우 무한 스크롤 트리거 삽입 --%>
        <c:if test="${status.last && hasMore}">
            <tr hx-get="${pageContext.request.contextPath}/crm/list?page=${nextPage}" 
                hx-trigger="revealed" 
                hx-swap="afterend" 
                hx-indicator="#list-loading"></tr>
        </c:if>
    </tr>
</c:forEach>
