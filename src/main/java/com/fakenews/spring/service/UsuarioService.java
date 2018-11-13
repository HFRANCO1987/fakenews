package com.fakenews.spring.service;

import java.util.List;

import com.fakenews.spring.model.Usuario;

public interface UsuarioService {

	public void saveOrUpdate(Usuario usuario) throws Exception;

	public void remove(Usuario usuario);

	public List<Usuario> findAll();

	public Usuario findById(Long id);

	public Usuario findByEmailSenha(Usuario usuario);

}
