package com.tjoeun.config;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.ws.rs.Produces;

@ApplicationScoped
public class EntityManagerProducer {

    // persistence.xml에 정의한 내용을 등록 시켜주는 역할을 합니다.
    @PersistenceContext(unitName = "myPU")
    private EntityManager em;

    @Produces
    @ApplicationScoped
    public EntityManager produceEntityManager() {
        return em;
    }

}