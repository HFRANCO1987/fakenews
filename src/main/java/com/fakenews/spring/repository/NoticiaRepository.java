package com.fakenews.spring.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.fakenews.spring.model.Noticia;

@Repository
public interface NoticiaRepository extends CrudRepository<Noticia, Integer> {

}
