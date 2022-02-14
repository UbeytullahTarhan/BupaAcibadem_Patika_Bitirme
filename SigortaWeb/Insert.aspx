<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Insert.aspx.cs" Inherits="SigortaWeb.Insert" %>

<!DOCTYPE html>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="Css/Bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <title></title>
</head>
<body>
    
    <form id="form1" runat="server" >
        <div class="row">
            
        <div class="col">
    <label>Tc Kimlik No:</label>
      <asp:TextBox ID="txtSETc" runat="server" required="true"  CssClass="form-control"  placeholder="Tc Kimlik No"></asp:TextBox>
  </div>
  <div class="col">
    <label>Adı:</label>
      <asp:TextBox ID="txtSEAdi" runat="server" required="true"  CssClass="form-control" placeholder="Adı"></asp:TextBox>
  </div>
             <div class="col">
    <label>Soyadı :</label>
      <asp:TextBox ID="txtSESoyadı"  runat="server" required="true" CssClass="form-control" placeholder="Soyadı"></asp:TextBox>
  </div>
        </div>

        <div class="row">
   
    <div class="col">
    <label>Cinsiyet:</label>
      <asp:DropDownList ID="DropDownCinsiyet" required="true" CssClass="form-control" runat="server">
          <asp:ListItem Value="">Seçiniz</asp:ListItem>  
            <asp:ListItem>Erkek</asp:ListItem>  
            <asp:ListItem>Kadın</asp:ListItem>

          </asp:DropDownList>
  </div>
    <div class="col">
    <label>Doğum Tarihi:</label>
      <asp:TextBox ID="txtSEDogumTarihi" TextMode="Date" required="true" runat="server" CssClass="form-control" placeholder="yyyy-aa-gg"></asp:TextBox>
        </div>
        <div class="col">
    <label>Telefon:</label>
      <asp:TextBox ID="txtSETelefon"  runat="server" required="true" TextMode="Phone" CssClass="form-control" placeholder="Telefon"></asp:TextBox>
  </div>
    </div>

        <div class="row">
    
    <div class="col">
    <label>Eposta:</label>
      <asp:TextBox ID="txtSEEposta" required="true"  runat="server" TextMode="Email" CssClass="form-control"  placeholder="Eposta"></asp:TextBox>
  </div>
    <div class="col">
    <label>Ülke:</label>
      <asp:TextBox ID="txtSEUlke"  runat="server" CssClass="form-control" placeholder="Ülke"></asp:TextBox>
  </div>
    <div class="col">
    <label >Adres:</label>
      <asp:TextBox ID="txtSEAdres"  required="true" runat="server" CssClass="form-control" placeholder="Adres"></asp:TextBox>
  </div>
  </div>

        <div class="row">
        <div class="col">
        
    <asp:Button ID="btnNext" CssClass="btn btn-danger form-control" runat="server"  Text="Next" OnClick="btnNext_Click"  />
    
            </div>
            </div>
    </form>
        
</body>
</html>
