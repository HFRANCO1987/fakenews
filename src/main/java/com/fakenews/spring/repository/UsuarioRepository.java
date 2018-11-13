package com.fakenews.spring.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.fakenews.spring.model.Usuario;

@Repository
public interface UsuarioRepository extends CrudRepository<Usuario, Long> {

	@Query(value = "SELECT u FROM Usuario u WHERE u.email = :email and u.senha = :senha")
    Usuario findByEmailSenha(@Param("email") String nome, @Param("senha") String senha);
}
