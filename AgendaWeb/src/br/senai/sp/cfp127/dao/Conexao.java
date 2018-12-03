package br.senai.sp.cfp127.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {
	private static Connection con;
	
	public static Connection getConexao() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String dbURL ="jdbc:mysql://10.107.134.23:3306/db_inf2ta?useTimeZone=true&serverTimezone=UTC";
			String user = "inf2ta";
			String pass = "123";
			con = DriverManager.getConnection(dbURL, user, pass);
			
		}catch(Exception e) {
			System.out.println("Ocorreu um erro na conex�o!!");
			e.printStackTrace();
		} 
		return con;
	}
	
	public static void fecharConexao() {
		try {
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}
}
