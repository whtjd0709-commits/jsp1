<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<tr class="bg-indigo-50 border-2 border-indigo-200 animate-in zoom-in-95 duration-200" id="member-row-${member.id()}">
    <td class="p-4 text-center text-indigo-400 font-mono">#${member.id()}</td>
    <td class="p-4" colspan="2">
        <form hx-post="${pageContext.request.contextPath}/crm/edit?id=${member.id()}" 
              hx-target="#member-row-${member.id()}" 
              hx-swap="outerHTML" 
              class="flex space-x-2">
            
            <input type="text" name="name" value="${member.name()}" required
                   class="flex-grow p-2 border-2 border-indigo-200 rounded-lg focus:ring-2 focus:ring-indigo-500 outline-none font-bold">
            
            <button type="submit" class="bg-indigo-600 text-white px-4 py-2 rounded-lg text-xs font-bold hover:bg-indigo-700 transition">
                SAVE
            </button>
            
            <%-- 
                [보정] 취소 시 다시 단일 행(display)을 가져오도록 처리합니다.
                서블릿의 POST 로직과 유사하게 단일 행만 반환하는 전용 액션이나 
                파라미터를 처리하는 것이 좋습니다. 
            --%>
            <button type="button" 
                    hx-get="${pageContext.request.contextPath}/crm/edit-cancel?id=${member.id()}" 
                    hx-target="#member-row-${member.id()}" 
                    hx-swap="outerHTML"
                    class="bg-white border text-gray-400 px-4 py-2 rounded-lg text-xs font-bold hover:bg-gray-100 transition">
                CANCEL
            </button>
        </form>
    </td>
    <td class="p-4 text-right italic text-xs text-indigo-300">Editing...</td>
</tr>