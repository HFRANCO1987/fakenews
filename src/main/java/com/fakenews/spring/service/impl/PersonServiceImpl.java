package com.fakenews.spring.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.fakenews.spring.model.Person;
import com.fakenews.spring.service.PersonService;

@Service
public class PersonServiceImpl implements PersonService {

	@Override
	public List<Person> loadAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Person load(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void saveOrUpdate(Person person) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void remove(Person person) {
		// TODO Auto-generated method stub
		
	}

//	@Autowired
//	private PersonRepository repository;
//
//	@Override
//	public List<Person> loadAll() {
//		List<Person> persons = new ArrayList<>();
//		repository.findAll().forEach(persons::add);
//		return persons;
//	}
//
//	@Override
//	public Person load(int id) {
//		return repository.findById(id).orElseThrow(() -> new RuntimeException("Registro não encontrado"));
//	}
//
//	@Override
//	public void saveOrUpdate(Person person) {
//		repository.save(person);
//	}
//
//	@Override
//	public void remove(Person person) {
//		repository.delete(person);
//	}

}
