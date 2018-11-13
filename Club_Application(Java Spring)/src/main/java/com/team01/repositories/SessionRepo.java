package com.team01.repositories;



import org.springframework.data.jpa.repository.JpaRepository;


import com.team01.model.Sessions;

public interface SessionRepo extends JpaRepository<Sessions , Integer> {

}
