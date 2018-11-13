package com.fakenews.spring.service;

import java.util.List;

import com.fakenews.spring.model.Noticia;

public interface NoticiaService {

	public void saveOrUpdate(Noticia noticia) throws Exception;

	public void remove(Noticia noticia);

	public List<Noticia> findAll();

	public Noticia findById(Long id);

}
