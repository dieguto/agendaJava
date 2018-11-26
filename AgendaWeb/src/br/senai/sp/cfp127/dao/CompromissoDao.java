package br.senai.sp.cfp127.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import br.senai.sp.cfp127.model.Compromisso;


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
	
	public ArrayList<Compromisso> getCompromisso(int codUsuario){
		ArrayList<Compromisso> compromisso = new ArrayList<>();
		
		String sql = "SELECT * FROM tbl_compromisso "
				+ "WHERE cod_usuario = ? ORDER BY nome";
		
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
}
