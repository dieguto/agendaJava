package br.senai.sp.cfp127.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import br.senai.sp.cfp127.model.Contato;

public class ContatoDao {

	private Contato contato;
	private PreparedStatement stm;
	private ResultSet rs;
	
	
	public ArrayList<Contato> getContatos(int codUsuario){
		ArrayList<Contato> contatos = new ArrayList<>();
		
		String sql = "SELECT * FROM tbl_contato "
				+ "WHERE cod_usuario = ? ORDER BY nome";
		
		try {
			stm = Conexao.getConexao().prepareStatement(sql);
			stm.setInt(1, codUsuario);
			rs = stm.executeQuery();
			
			while (rs.next()) {
				this.contato = new Contato();
				this.contato.setCodContato(rs.getInt("cod_contato"));
				this.contato.setNome(rs.getString("nome"));
				this.contato.setEmail(rs.getString("email"));
				this.contato.setTelefone(rs.getString("telefone"));
				this.contato.setEndereco(rs.getString("endereco"));
				contatos.add(this.contato);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		} 
		
		return contatos;
	}
	
	
	public boolean gravar(Contato contato){
		String sql= "INSERT INTO tbl_contato "
				+ "(cod_usuario, nome, email, telefone, endereco)"
				+ "VALUES (?,?,?,?,?)";
				
				
		try {
			stm = Conexao.getConexao().prepareStatement(sql);
			stm.setInt(1, contato.getUsuario().getCod());
			stm.setString(2, contato.getNome());
			stm.setString(3, contato.getEmail());
			stm.setString(4, contato.getTelefone());
			stm.setString(5, contato.getEndereco());
			stm.execute();
			
			return true;
			
		} catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean atualizar(Contato contato) {
		String sql= "UPDATE tbl_contato SET "
				+ "nome = ?, "
				+ "email = ?, "
				+ "telefone = ? "
				+ "endereco = ? "
				+ "WHERE cod = ?";
		
		try {
			stm = Conexao.getConexao().prepareStatement(sql);
			stm.setString(1, contato.getNome());
			stm.setString(2, contato.getEmail());
			stm.setString(3, contato.getTelefone());
			stm.setString(4, contato.getEndereco());
			stm.execute();
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	public Contato getContato(int codContato){

		
		String sql = "SELECT * FROM tbl_contato "
				+ "WHERE cod_contato = ?";
		
		try {
			stm = Conexao.getConexao().prepareStatement(sql);
			stm.setInt(1, codContato);
			rs = stm.executeQuery();
			
			if (rs.next()) {
				this.contato = new Contato();
				this.contato.setCodContato(rs.getInt("cod_contato"));
				this.contato.setNome(rs.getString("nome"));
				this.contato.setEmail(rs.getString("email"));
				this.contato.setTelefone(rs.getString("telefone"));
				this.contato.setEndereco(rs.getString("endereco"));
			
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		} 
		
		return contato;
	}
}

