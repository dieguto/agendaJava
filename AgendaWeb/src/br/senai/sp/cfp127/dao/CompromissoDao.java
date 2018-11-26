package br.senai.sp.cfp127.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import br.senai.sp.cfp127.model.Compromisso;
import br.senai.sp.cfp127.model.Contato;


public class CompromissoDao {
	
	private Compromisso compromisso;
	private PreparedStatement stm;
	private ResultSet rs;
	
	public Compromisso getCompromisso() {
		return compromisso;
	}


	public void setCompromisso(Compromisso compromisso) {
		this.compromisso = compromisso;
	}
	
	public ArrayList<Compromisso> getCompromissos(int codUsuario){
		ArrayList<Compromisso> compromisso = new ArrayList<>();
		
		String sql = "SELECT * FROM tbl_compromisso "
				+ "WHERE cod_usuario = ? ";
		
		try {
			stm = Conexao.getConexao().prepareStatement(sql);
			stm.setInt(1, codUsuario);
			rs = stm.executeQuery();
			
			while (rs.next()) {
				this.compromisso = new Compromisso();
				this.compromisso.setCodCompromisso(rs.getInt("cod_compromisso"));
				this.compromisso.setTitulo(rs.getString("titulo"));
				this.compromisso.setData(rs.getString("data"));
				this.compromisso.setHoraInicio(rs.getString("horaInicio"));
				this.compromisso.setHoraFim(rs.getString("horaFim"));
				this.compromisso.setDescricao(rs.getString("descricao"));
				this.compromisso.setPrioridade(rs.getString("prioridade"));
				this.compromisso.setStatus(rs.getString("status"));
				;
				compromisso.add(this.compromisso);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		} 
		
		return compromisso;
	}
	
		
	
		public Compromisso getCompromisso(int codCompromisso){

		
		String sql = "SELECT * FROM tbl_compromisso "
				+ "WHERE cod_compromisso = ?";
		
		try {
			stm = Conexao.getConexao().prepareStatement(sql);
			stm.setInt(1, codCompromisso);
			rs = stm.executeQuery();
			
			if (rs.next()) {
				this.compromisso = new Compromisso();
				this.compromisso.setCodCompromisso(rs.getInt("cod_compromisso"));
				this.compromisso.setTitulo(rs.getString("titulo"));
				this.compromisso.setData(rs.getString("data"));
				this.compromisso.setHoraInicio(rs.getString("horaInicio"));
				this.compromisso.setHoraFim(rs.getString("horaFim"));
				this.compromisso.setDescricao(rs.getString("descricao"));
				this.compromisso.setPrioridade(rs.getString("prioridade"));
				this.compromisso.setStatus(rs.getString("status"));
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		} 
		
		return compromisso;
	}
		
		public boolean gravar(Compromisso compromisso){
			String sql= "INSERT INTO tbl_compromisso "
					+ "(cod_usuario, nome, email, telefone, endereco)"
					+ "VALUES (?,?,?,?,?)";
					
					
			try {
				stm = Conexao.getConexao().prepareStatement(sql);
				stm.setInt(1, compromisso.getUsuario().getCod());
				
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
					+ "telefone = ?, "
					+ "endereco = ? "
					+ "WHERE cod_contato = ?";
			
			try {
				stm = Conexao.getConexao().prepareStatement(sql);
				stm.setString(1, contato.getNome());
				stm.setString(2, contato.getEmail());
				stm.setString(3, contato.getTelefone());
				stm.setString(4, contato.getEndereco());
				stm.setInt(5, contato.getCodContato());
				stm.execute();
				return true;
			} catch (Exception e) {
				e.printStackTrace();
				return false;
				
			}
		}
		
		public boolean deletar(int codContato) {
			String sql = "DELETE FROM tbl_contato WHERE cod_contato = ?";
			try {
				stm = Conexao.getConexao().prepareStatement(sql);
				stm.setInt(1, codContato);
				stm.execute();
				return true;
			} catch (Exception e) {
				e.printStackTrace();
				return false;
			}
		}
}
