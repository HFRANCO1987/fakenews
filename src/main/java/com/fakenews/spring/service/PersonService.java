package com.fakenews.spring.service;

import java.util.List;

import com.fakenews.spring.model.Person;

public interface PersonService {
	
	public List<Person> loadAll();
	
	public Person load(int id);
	
	public void saveOrUpdate(Person person);
	
	public void remove(Person person);

}
