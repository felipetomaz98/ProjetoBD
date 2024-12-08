<%@ page language="java" import="java.sql.*" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="utf-8">
    <title>Resultado do Cadastro</title>
    <style>
        tr:nth-child(even) {
            background-color: lightgray;
        }
        tr:hover {
            background-color: #363636;
            color: white;
        }
    </style>
</head>
<body>
    <%
        String database = "paz_vida";
        String enderecoBD = "jdbc:mysql://localhost:3306/" + database;
        String usuarioBD = "root";
        String senhaBD = "";

        String driver = "com.mysql.cj.jdbc.Driver";

        try {
            Class.forName(driver);

            Connection conexao = DriverManager.getConnection(enderecoBD, usuarioBD, senhaBD);

            String nome = request.getParameter("nome");
            String email = request.getParameter("email");
            String telefone = request.getParameter("telefone");
            int idade = Integer.parseInt(request.getParameter("idade"));
            String sexo = request.getParameter("sexo");

            String sql = "INSERT INTO cadastros (nome, email, telefone, idade, sexo) VALUES (?, ?, ?, ?, ?)";

            PreparedStatement ps = conexao.prepareStatement(sql);
            ps.setString(1, nome);
            ps.setString(2, email);
            ps.setString(3, telefone);
            ps.setInt(4, idade);
            ps.setString(5, sexo);

            int i = ps.executeUpdate();
            if (i > 0) {
                out.println("<h3>Cadastro realizado com sucesso!</h3>");
            }

            ps.close();
            conexao.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h3>Erro ao processar o cadastro.</h3>");
        }
    %>
</body>
</html>
