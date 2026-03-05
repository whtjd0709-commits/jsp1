package com.example.crm.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.concurrent.ConcurrentHashMap;
import java.util.stream.Collectors;

import com.example.crm.model.MemberRecord;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * 통합 Controller 서블릿
 * 
 */

// @WebServlet("/crm/*")의 의미는 "/crm/모든 경로" 이후 어떤 경로도 다 이 서블릿으로 이동.
@WebServlet("/crm/*")
public class CrmServlet extends HttpServlet {

    // DB연결 후 변경될 부분으로 MemberService가 구현된 경우에 교체
    // 지금은 임시로 ConcurrentHashMap을 사용.
    private static final Map<Long, MemberRecord> db = new ConcurrentHashMap<>();
    private static final int PAGE_SIZE = 10;

    // 서블릿 로드시 초기화 메서드 init()
    @Override
    public void init() throws ServletException {
        // DB와 연결하기 전에 테스트를 위한 DB정보를 생성.
        // 초기 사용자 정보를 생성.
        System.out.println("init CrmServlet!!!");
        for (long i = 1; i <= 50; i++) {
            db.put(i, MemberRecord.of(i, "사용자" + i, "user" + i + "@test.com", i % 5 == 0 ? "Admin" : "User"));
        }
    }

    // 경로 /crm/\* : /crm/ 이후에 있는 값들을 활용해서 분기 처리를 진행.
    // service() 메서드.
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 시작이 /crm/으로 시작하는 모든 url에 대해서 받줍니다.

        // 메서드 정보
        String method = req.getMethod();
        // 경로 정보
        String path = req.getPathInfo();

        System.out.println(path);

        // 1. [패턴5] 탭 전환 및 메인 로드
        if (path == null || path.equals("/")) {
            // 메인 페이지의 탭으로 파라미터를 통한 탭 전환
            // 탭 전환 메서드 : handleTabs(req, resp)
            handleTabs(req, resp);
        }
        // 2. [패턴3] 무한 스크롤 데이터 로드
        else if (path.equals("/list")) {
            // members 전체 출력하는 member-table.jsp
            // 회원 목록 불러오기 기능 메서드 구현 : handleList(req,resp)
            handleList(req, resp);
        }
        // 3. [패턴2] 실시간 이메일 중복 검증
        else if (path.equals("/validate-email")) {
            // /crm/validate-email 경로인 경우에 해당.
            handleValidation(req, resp);
        }
        // 4. [패턴4] 벌크 삭제- method 검증 추가
        else if (path.equals("/bulk-delete") && method.equals("POST")) {
            // /crm/bulk-delete 경로인 경우에 해당.
            System.out.println("query : " + req.getParameterMap());
            handleBulkDelete(req, resp);
        }
        // 5. [패턴1] 인라인 편집(GET일 경우(폼), POST일 경우(저장))
        else if (path.equals("/edit")) {
            // /crm/bulk-delete 경로인 경우에 해당.
            handleInlineEdit(req, resp);
        }
        // 6. 모달 처리
        else if (path.equals("/add-form")) {
            // [패턴 5] 탭 전환과 유사하게 모달 조각 반환
            req.getRequestDispatcher("/WEB-INF/fragments/add-member-modal.jsp").forward(req, resp);
        } else if (path.equals("/add") && method.equals("POST")) {
            handleAddMember(req, resp);
        }

    }

    // 패턴5 : tab
    private void handleTabs(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // [패턴 5]을 사용하기 위해서 tab 정보 확인
        String type = req.getParameter("tab");
        if (type == null) {
            req.getRequestDispatcher("/dashboard.jsp").forward(req, resp);
            return;
        } else if (type.equals("members")) {
            req.getRequestDispatcher("/WEB-INF/fragments/member-table.jsp").forward(req, resp);
        } else {
            req.getRequestDispatcher("/WEB-INF/fragments/stats.jsp").forward(req, resp);
        }

    }

    // 패턴3 : scroll
    private void handleList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // page 정보를 얻어서 페이징 처리해서 결과를 db정보를 전달함.
        // 1. page 정보 읽어오기
        int page = Integer.parseInt(
                Optional.ofNullable(req.getParameter("page")).orElse("1") // null인 경우 값을 "1" 처리해주세요.
        );

        // 2. member-table.jsp에 넘길 데이터를 생성.
        List<MemberRecord> list = db.values().stream()
                .sorted(Comparator.comparing(MemberRecord::id)) // id값으로 정렬
                .skip((long) (page - 1) * PAGE_SIZE) // 시작 인덱스 값
                .limit(PAGE_SIZE) // 시작 인덱스 위치부터 PAGE_SIZE 만큼
                .collect(Collectors.toList()); // List로 만들어요.

        // 3. req에 저장해서 member-row.jsp에게 전달.
        req.setAttribute("members", list);
        req.setAttribute("nextPage", page + 1);
        req.setAttribute("hasMore", (page * PAGE_SIZE) < db.size());
        req.getRequestDispatcher("/WEB-INF/fragments/member-row.jsp").forward(req, resp);
    }

    // 패턴2 : validation
    private void handleValidation(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // 1. email 정보 얻기
        String email = req.getParameter("email");
        // 2. email 검증 작업(등록 여부확인)
        boolean exists = db.values().stream().anyMatch(m -> m.email().equals(email));
        // 3. 메시지 전송
        resp.setContentType("text/html");
        if (exists) { // 등록된 경우
            resp.getWriter().write("<span class='text-red-500 text-xs font-bold'>이미 등록된 이메일 입니다.</span>");
        } else { // 미등록인 경우
            resp.getWriter().write("<span class='text-green-500 text-xs font-bold'>사용 가능한 이메일 입니다.</span>");
        }
    }

    // 패턴4 : bulk
    private void handleBulkDelete(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // 1. 파라미터로 전달된 ids 값을 얻기
        String[] ids = req.getParameterValues("ids");
        // System.out.println(Arrays.toString(ids));
        // 2. 얻은 값을 통해서 db 삭제 작업
        if (ids != null) {
            for (String id : ids) {
                MemberRecord deleteMember = db.remove(Long.parseLong(id));
                System.out.println(deleteMember);
            }
            // 트리거를 통해서 이전에 구현된 list 작업을 진행.
            // db.values().stream().forEach(System.out::println);
            try {
                Thread.sleep(500);
                resp.setHeader("HX-Trigger", "memberChanged"); // HTMX의 헤더설정으로 Trigger 설정.
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }

        }
    }

    // 패턴1 : inlineEdit
    private void handleInlineEdit(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // 현재는 이름만 변경할 수 있게 되어 있음.
        // 1. 편집할 데이터의 id값 얻기
        Long id = Long.parseLong(req.getParameter("id"));
        // 2. 메서드 구분 (GET - 읽기, POST-수정)
        if (req.getMethod().equals("GET")) {
            req.setAttribute("member", db.get(id));
            req.getRequestDispatcher("/WEB-INF/fragments/member-edit.jsp").forward(req, resp);
        } else {
            String name = req.getParameter("name");
            MemberRecord updated = MemberRecord.of(id, name, db.get(id).email(), db.get(id).role());
            db.put(id, updated);
            // [수정 포인트] member-row.jsp는 'members'라는 이름의 리스트를 기대합니다.
            // 단일 객체를 리스트로 감싸서 전달해야 조각(Fragment)이 정상 생성됩니다.
            req.setAttribute("members", Collections.singletonList(updated));
            req.setAttribute("hasMore", false); // 단일 행 업데이트이므로 추가 로드 트리거 방지
            req.getRequestDispatcher("/WEB-INF/fragments/member-row.jsp").forward(req, resp);
        }
    }

    private void handleAddMember(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String role = req.getParameter("role");

        // ID 생성 (단순화)
        long newId = db.keySet().stream().max(Long::compare).orElse(0L) + 1;
        MemberRecord newMember = MemberRecord.of(newId, name, email, role);
        db.put(newId, newMember);

        // 성공 응답: 새로 추가된 회원 1행(row) 조각만 반환하여 목록 맨 위에 삽입하게 함
        req.setAttribute("members", List.of(newMember));
        req.setAttribute("hasMore", false); // 단일 행이므로 더보기 불필요

        // HTMX 전용 헤더: 성공 시 클라이언트에 알림 트리거 가능
        resp.setHeader("HX-Trigger", "memberAddedToast");

        req.getRequestDispatcher("/WEB-INF/fragments/member-row.jsp").forward(req, resp);
    }
}
