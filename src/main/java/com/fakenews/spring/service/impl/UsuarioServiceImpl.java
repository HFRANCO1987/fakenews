package com.fakenews.spring.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fakenews.spring.model.Usuario;
import com.fakenews.spring.repository.UsuarioRepository;
import com.fakenews.spring.service.UsuarioService;

@Service
public class UsuarioServiceImpl implements UsuarioService {

	@Autowired
	private UsuarioRepository repository;

	@Override
	public void saveOrUpdate(Usuario usuario) throws Exception {
		try {
			repository.save(usuario);
		} catch (Exception e) {
			throw new Exception(e.getMessage());
		}
	}

	@Override
	public void remove(Usuario usuario) {

	}

	@Override
	public List<Usuario> findAll() {
		return (List<Usuario>) repository.findAll();
	}

	@Override
	public Usuario findById(Long id) {
		return repository.findById(id).orElseThrow(() -> new RuntimeException("Registro não encontrado"));
	}

	@Override
	public Usuario findByEmailSenha(Usuario usuario) {
		return repository.findByEmailSenha(usuario.getEmail(), usuario.getSenha());
	}

}
