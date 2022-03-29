<%-- 
    Document   : index
    Created on : 28 de mar. de 2022, 21:59:02
    Author     : Fatec
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>Juros Compostos - JavaApp</title>
    </head>
    <body>
        <%@include file = "WEB-INF/jspf/navBar.jspf"%>
        <div class ="container-fluid">
            <h1>Juros Composto</h1>
            
            <div class="container-fluid">
            <form>
                <div class="mb-3">
                  <label for="vp" class="form-label">Valor Presente</label>
                  <input name="vp" type="number" step="any" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                </div>
                <div class="mb-3">
                  <label for="tx" class="form-label">Taxa (%)</label>
                  <input name="juros" type="number" step="any" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                </div>
                <div class="mb-3">
                  <label for="tp" class="form-label">Tempo</label>
                  <input name="tempo" type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                </div>
                <button type="submit" name="calc" class="btn btn-primary">Calcular</button>
            </form>
            
            <%
            String error = null;
            float vp=1, juros=1;
            int tempo=1;
            try
            {
                String p1 = request.getParameter("vp");
                String p2 = request.getParameter("juros");
                String p3 = request.getParameter("tempo");
                vp = Float.parseFloat(p1);
                juros = Float.parseFloat(p2);
                tempo = Integer.parseInt(p3);
            } catch (Exception e)
            {
                error = e.getMessage();
            }
            %>
            <table class="table table">
  <thead>
  </thead>
  <tbody>
    <tr class="table-active">
    </tr>
    <tr>
      <th scope="col">TEMPO (MESES)</th>
      <td scope="col"> Valor Presente</td>
      <td>Valor futuro</td>
    </tr>
     <% for(int i=1; i<=tempo; i++){
           if(error != null){
                out.println("<span style='color:red'>Erro ao tentar ler parametros</span>");
            } else {%>
    <tr>
      <th scope="col"><%= i %></th>
      <td scope="col"><%= String.format("<p>%.2f</p>",vp) %></td>
      <td> <%out.println(String.format("<p>%.2f</p>",vp * Math.pow((1 + (juros/100)), i)));
            }
            }
          %></td>
    </tr>
  </tbody>
</table>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>