package com.tjoeun.service;

import java.util.List;

import com.tjoeun.entity.User;
import com.tjoeun.repository.UserRepository;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.transaction.Transactional;

@ApplicationScoped
public class UserService {

    @Inject
    private UserRepository userRepo;

    @Transactional
    public void register(String name, String email){
        userRepo.insert(new User(name, email));
    }

    //정보 불러오기
    public List<User> getAllUsers(){
        return userRepo.findAll().toList();
    }

    //삭제
    public void removeUser(Long id){
        userRepo.findById(id).ifPresent(delete);
    }
}
