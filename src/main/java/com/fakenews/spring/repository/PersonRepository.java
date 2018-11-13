package com.fakenews.spring.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.fakenews.spring.model.Person;

@Repository
public interface PersonRepository extends CrudRepository<Person, Integer> {

	public List<Person> findByFirstName(String name);

}
