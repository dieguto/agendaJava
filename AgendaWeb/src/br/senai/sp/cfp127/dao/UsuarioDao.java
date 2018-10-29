package br.senai.sp.cfp127.dao;

import java.sql.PreparedStatement;

import javax.sql.ConnectionEvent;

import br.senai.sp.cfp127.model.Usuario;

public class UsuarioDao {
	
	private Usuario usuario;
	private ConnectionEvent con;
	private PreparedStatement stm;
	
	public Usuario getUsuario() {
		return usuario;
	}
	
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	
	// *** M�TODO PARA GRAVAR O USU�RIO NO BANCO
	
	public void gravar() {
		String sql= "INSERT INTO tbl_usuario ("
				+ "nome, email, senha, sexo, dtNascimento)"
				+ "VALUES (?,?,?,?,?)";
		
		try {
			stm = Conexao.getConexao().prepareStatement(sql);
			stm.setString(1, usuario.getNome());
			stm.setString(2, usuario.getEmail());
			stm.setString(3, usuario.getSenha());
			stm.setString(4, usuario.getSexo().substring(0, 1));
			stm.setString(5, usuario.getDtNascimento());
			stm.execute();
		} catch(Exception e) {
			
		}
	}
	
	
}
