<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Login</title>
	<link rel="stylesheet" href="basico.css">
</head>
<body>
	Bem vindo ao nosso gerenciador de empresas!
 	 <br />
		<c:if test="${not empty usuarioLogado}">
	    	Você está logado como ${usuarioLogado.email}<br />
		</c:if>
	<br />

	<form action="executar?tarefa=NovaEmpresa" method="POST">
		Nome:<input type="text" name="nome" /><br /> <input type="submit"
			value="Enviar" />
	</form>
	<br />

	<form action="executar?tarefa=Login" method="POST">
		Nome: <input type="email" name="email"><br /> Senha: <input
			type="password" name="senha"><br /> <input type="submit"
			value="Logar">
	</form>
	<br />

	<form action="executar?tarefa=Logout" method="POST">
		<input type="submit" value="Deslogar" />
	</form>
</body>
</html>