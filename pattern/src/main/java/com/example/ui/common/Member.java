package com.example.ui.common;

import java.sql.Timestamp;

public record Member( 
    Long id,
    String name,
    String email,
    String auth,
    String status,
    Timestamp createAt
) {
    // 4개만 받아도 6개짜리 기본 생성자를 호출해주는 '보조 생성자' 추가
    public Member(Long id, String name, String email, String auth) {
        this(id, name, email, auth, null, null); 
        // status와 createAt 자리에 null을 넣어 6개를 채워줌
    }
}