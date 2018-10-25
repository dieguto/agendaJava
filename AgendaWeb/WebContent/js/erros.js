function validaUsuario(usuario){
    var erros = [];

    if(usuario.nome.length < 5 ){
        erros.push("O nome deve ter mais de 5 caracteres.");
    }

    if(usuario.nascimento.length === 0){
        erros.push("A data de nascimento é obrigatória.");
    }

    if(usuario.email.length < 7){
        erros.push("O e-mail é obrigatório.");
    }

    if(usuario.sexo === "Selecione"){
        erros.push("O sexo não foi selecionado.");
    }

    if(usuario.senha.length < 8){
        erros.push("A senha deve conter 8 caracteres.");
    }
    
    if(usuario.confSenha.length < 8){
        erros.push("A confirmação da senha deve conter pelo menos 8 caracteres.");
    }

    if(usuario.senha != usuario.confSenha){
        erros.push("As senhas não confirmam.");
    }

    
    return erros; 
}