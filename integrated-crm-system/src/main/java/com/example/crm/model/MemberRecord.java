package com.example.crm.model;

import java.io.Serializable;
import java.time.LocalDateTime;

public record MemberRecord(
        Long id,
        String name,
        String email,
        String role,
        String status,
        LocalDateTime createdAt) implements Serializable {
    // 샘플 데이터 생성을 위해서 정적 팩토리 메서드
    public static MemberRecord of(Long id, String name, String email, String role) {
        return new MemberRecord(id, name, email, role, "Active", LocalDateTime.now());
    }

    // 인라인 편집으로 이름 변경시 사용할 메서드
    public MemberRecord withName(String newName) {
        return new MemberRecord(this.id, newName, this.email, this.role, this.status, this.createdAt);
    }
}
