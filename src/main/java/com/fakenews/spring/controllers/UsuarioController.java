package com.fakenews.spring.controllers;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.compress.utils.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Base64Utils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fakenews.spring.controllers.session.UsuarioSessao;
import com.fakenews.spring.model.Usuario;
import com.fakenews.spring.service.UsuarioService;

@Controller
public class UsuarioController {

	@Autowired
	private UsuarioService usuarioService;

	@Autowired
	private UsuarioSessao usuarioSessao;

	@GetMapping(value = "/login")
	public ModelAndView login() {
		return new ModelAndView("/login");
	}

	@GetMapping(value = "/logout")
	public ModelAndView logout() {
		usuarioSessao.setUsuario(null);
		return new ModelAndView("redirect:/");
	}

	@PostMapping(value = "/autenticar")
	public ModelAndView logar(Usuario usuario) {
		Map<String, Object> model = new HashMap<>();
		usuarioSessao.setUsuario(usuarioService.findByEmailSenha(usuario));
		return new ModelAndView("redirect:/", model);
	}

	@PostMapping(value = "/usuario/salvar")
	public String salvar(@RequestParam("file") MultipartFile file, Usuario usuario,
			RedirectAttributes redirectAttributes) {
		try {
			byte[] encodeBase64 = Base64Utils.encode(IOUtils.toByteArray(file.getInputStream()));
			String base64Encoded = new String(encodeBase64, "UTF-8");
			usuario.setFoto(base64Encoded);
			usuarioService.saveOrUpdate(usuario);
			redirectAttributes.addFlashAttribute("sucesso", "Usuário gravado com sucesso!");
			return "redirect:/usuario/pesquisa";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@GetMapping(value = "/usuario/pesquisa")
	public ModelAndView pesquisa() {
		Map<String, Object> model = new HashMap<>();
		model.put("usuarios", usuarioService.findAll());
		model.put("usuario", usuarioSessao.getUsuario());
		return new ModelAndView("/usuario/pesquisa", model);
	}

	@GetMapping(value = "/usuario/novo")
	public ModelAndView novo(Usuario usuario) {
		Map<String, Object> model = new HashMap<>();
		model.put("usuario", usuarioSessao.getUsuario());
		return new ModelAndView("/usuario/novo", model);
	}

}
