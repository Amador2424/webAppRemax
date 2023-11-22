<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormListeMaison.aspx.cs" Inherits="WebAppRemax.WebFormListeMaison" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
   <title>Liste des maisons</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <link href="styles.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Liste des maisons</h1>
            <hr />
            
            <asp:Repeater ID="rptResults" runat="server" OnItemCommand="rptResults_ItemCommand">
    <ItemTemplate>
        <div class="card">
             <div class="card-body">
            <p class="card-title">Propriété: <%# Eval("propi") %></p>
                  <p class="card-text">
                                <strong>Prix :</strong> <%#  Eval("price") %> €<br />
                                <strong>Superficie :</strong> <%# Eval("sup") %> m²
                            </p>
          
            <p class="card-title">Agent: <%# Eval("agent") %></p>
        </div>
    </ItemTemplate>
</asp:Repeater>

        </div>
          <section>
<h5>Selectionner l'agent:</h5>
      <asp:ListBox ID="ListAgent" runat="server" OnSelectedIndexChanged="ListAgent_SelectedIndexChanged" AutoPostBack="True"></asp:ListBox>
  </section>
        <section>
            <h5>Envoyeur:</h5>
    <asp:TextBox ID="TextEnvoyeur" runat="server"></asp:TextBox>
</section>
<section>
                <h5>Titre:</h5>

    <asp:TextBox ID="TextTitre" runat="server"></asp:TextBox>
</section>
<section>
                <h5>Message:</h5>

    <asp:TextBox ID="TextMessage" runat="server"></asp:TextBox>
</section>
<section>
    <asp:Button ID="BtnEnvoyer" runat="server" Text="Envoyer" OnClick="BtnEnvoyer_Click" />
</section>
    </form>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"
            integrity="sha384-F+u6hJU6Zzr6EouUj+eUAXJnkkvlQgQ5F5h5TFHdXz64cIjQvukE4JLmB0eCV1l"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
