package com.tjoeun.repository;

import java.util.List;
import java.util.Optional;

import com.tjoeun.entity.User;

import jakarta.data.repository.CrudRepository;
import jakarta.data.repository.Delete;
import jakarta.data.repository.Find;
import jakarta.data.repository.Insert;
import jakarta.data.repository.Repository;
import jakarta.data.repository.Update;

@Repository
public interface UserRepository extends CrudRepository<User, Long>{

    @Find // 찾겠다.. (SELECT 동작 메서드)
    List<User> findUsername(String username);

    @Find
    Optional<User> findByEmail(String email);

    //user 정보 추가
    @Insert
    void insertUser(User user);

    // 수정
    @Update
    void updateUser(User user);

    @Delete
    void deleteById(Long id);

}
