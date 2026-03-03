package com.tjoeun.entity;

import java.sql.Timestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Version;

@Entity
@Table(name="User")
public class User {

    @Id //Pk 설정
    @GeneratedValue(strategy = GenerationType.IDENTITY) //자동생성
    
    private Long id;
    
    @Column(nullable = false)
    private String username;

    @Column(unique = true, nullable = false)
    private String email;

    @Version
    private Long version;

    //lastUpdate 시간정보가 생성되어 들어감.
    private Timestamp lastUpdate;

public User(){} // 기본 생성자 (JPA 필수)

// 회원가입 등을 위한 생성자 (추가 필요!)
public User(String username, String email) {
    this.username = username;
    this.email = email;
}

// 전체 필드 생성자 (기존에 있던 것)
public User(Long id, String username, String email, Long version, Timestamp lastUpdate) {
    this.id = id;
    this.username = username;
    this.email = email;
    this.version = version;
    this.lastUpdate = lastUpdate;
}

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getemail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Long getVersion() {
        return version;
    }

    public void setVersion(Long version) {
        this.version = version;
    }

    public Timestamp getLastUpdate() {
        return lastUpdate;
    }

    public void setLastUpdate(Timestamp lastUpdate) {
        this.lastUpdate = lastUpdate;
    }

    

}
