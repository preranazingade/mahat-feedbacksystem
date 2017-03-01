/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mahat.feedback.repository;


import com.mahat.feedback.model.Feedback;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

/**
 *
 * @author prera
 */
@RepositoryRestResource
public interface FeedbackRepository extends JpaRepository<Feedback , Integer>{
  
}