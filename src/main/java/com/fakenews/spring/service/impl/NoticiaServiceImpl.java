package com.fakenews.spring.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fakenews.spring.model.Noticia;
import com.fakenews.spring.repository.NoticiaRepository;
import com.fakenews.spring.service.NoticiaService;

@Service
public class NoticiaServiceImpl implements NoticiaService {

	@Autowired
	private NoticiaRepository repository;
	
	@Override
	public void saveOrUpdate(Noticia noticia) throws Exception {
		try {
			repository.save(noticia);
		}catch (Exception e) {
			throw new Exception(e.getMessage());
		}
	}

	@Override
	public void remove(Noticia noticia) {

	}

	private void validarObrigatoriedade(Noticia noticia) {

	}

	@Override
	public List<Noticia> findAll() {
		return (List<Noticia>) repository.findAll();
	}

}
