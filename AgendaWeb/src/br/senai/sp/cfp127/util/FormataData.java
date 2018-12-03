package br.senai.sp.cfp127.util;

public class FormataData {

	public static String dataPt(String data){
		
		String dia;
		String mes;
		String ano;
		
		ano = data.substring(0, 4);
		mes = data.substring(5, 7);
		dia = data.substring(8, 10);
		
		return dia + "/" + mes + "/" + ano;
	}
	
}
