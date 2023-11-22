<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormAcceuil.aspx.cs" Inherits="WebAppRemax.WebFormAcceuil" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700" rel="stylesheet">

    <title></title>
 <style>
        body {
            font-family: Arial, sans-serif;
            font-size: 16px;
            line-height: 1.5;
            margin: 0;
            padding: 0;
        }
        .my-grid-view {
border: 1px solid #ccc;
border-radius: 5px;
padding: 10px;
}
        nav {
            background-color: #333;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
        }

        nav ul {
            margin: 0;
            padding: 0;
            list-style: none;
            display: flex;
            justify-content: space-between;
        }
        .my-list-box {
border: 1px solid #ccc;
border-radius: 5px;
padding: 10px;
height: 150px;
overflow-y: scroll;
}

        nav ul li {
            padding: 10px 20px;
        }

        nav ul li a {
            color: #fff;
            text-decoration: none;
        }

        .hero {
            background-image: url('https://picsum.photos/1920/1080');
            background-size: cover;
            background-position: center;
            height: 400px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #fff;
        }

        .search {
            background-color: #f5f5f5;
            padding: 50px 0;
        }

        .form-group {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 800px;
            margin: 0 auto;
        }

        .form-control {
            width: 30%;
            padding: 10px;
            border-radius: 5px;
            border: none;
            background-color: #fff;
            box-shadow: 1px 1px 5px rgba(0,0,0,0.1);
            margin-right: 20px;
        }

        .btn {
            padding: 10px 20px;
            border-radius: 5px;
            border: none;
            color: #fff;
            background-color: #007bff;
            cursor: pointer;
        }

        footer {
            background-color: #333;
            color: #fff;
            padding: 20px 0;
        }

        footer p {
            margin: 0;
            text-align: center;
        }


        .form-control-cities {
            width: 20%;
        }

        .form-control-price {
            width: 20%;
        }

        .form-control-property-type {
            width: 30%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <nav>
            <ul>
                <li><a href="#">Accueil</a></li>
                <li><a href="WebFormInscription.aspx">Inscription</a></li>
                <li><a href="WebFormAuthentification.aspx">Connexion</a></li>
                <li><a href="#">A propos</a></li>
                <li><a href="#">Contact</a></li>
            </ul>
        </nav>

        <section class="hero">
            <div class="container">
                <h1>Bienvenue sur notre site immobilier</h1>
                <p>Nous vous aidons à trouver la maison de vos rêves</p>
            </div>
        </section>

        <section class="search">
            <div class="container"
        <h5>Recherche de propriétés</h5>
        <div class="form-group">
            <h5>Option</h5>
            <asp:DropDownList ID="ddlSearchOptions" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlSearchOptions_SelectedIndexChanged">
            
            </asp:DropDownList>
            <h5>Ville</h5>
            <asp:DropDownList ID="ddlSearchCities" runat="server" CssClass="form-control form-control-cities">
         
            </asp:DropDownList>
            <h5>Prix</h5>
            <asp:TextBox ID="txtSearchPrice" runat="server" CssClass="form-control form-control-price" placeholder="Prix"></asp:TextBox>
            <h5>Superficie</h5>
            <asp:TextBox ID="txtSearchSuperficie" runat="server" CssClass="form-control form-control-price" placeholder="Prix"></asp:TextBox>
            <h5>Propriété</h5>
            <asp:DropDownList ID="ddlSearchProperty" runat="server" CssClass="form-control form-control-property-type" AutoPostBack="True">
                
            </asp:DropDownList>

            <asp:Button ID="btnSearch" runat="server" Text="Rechercher" CssClass="btn" OnClick="btnSearch_Click"  />
            <br />
            <br />
            <asp:GridView ID="grdVw" runat="server" CssClass="my-grid-view" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <br />
            <br />
        </div>
    </section>
    <footer>
        <div class="container">
            <p>Tous droits réservés © Amadou Doro Diallo </p>
        </div>
    </footer>
</form>
       
</body>
</html>
   
