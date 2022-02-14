<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SigortaliForm.aspx.cs" Inherits="SigortaWeb.SigortalıForm" %>

<!DOCTYPE html>

<html>
  <head>
    <meta charset="UTF-8">
    <script src="script.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!-- <link rel="stylesheet" type="text/css" href="styles.css"> -->
  </head>
  <body>
      
    <form id="form1" runat="server">
        <div class="row">
        <div class="col">
    <label>Tc Kimlik No:</label>
      <asp:TextBox ID="txtSTc" runat="server" required="true" TextMode="Number" CssClass="form-control" placeholder="Tc Kimlik No"></asp:TextBox>
  </div>
  <div class="col">
    <label>Adı:</label>
      <asp:TextBox ID="txtSAdi" runat="server" required="true" CssClass="form-control" placeholder="Adı"></asp:TextBox>
  </div>
       </div>


        <div class="row">   
    <div class="col">
    <label>Soyadı :</label>
      <asp:TextBox ID="txtSSoyadi"  runat="server" required="true" CssClass="form-control" placeholder="Soyadı"></asp:TextBox>
  </div>
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
      <asp:TextBox ID="txtSDogumTarihi" required="true" TextMode="Date" runat="server" CssClass="form-control" placeholder="Doğum Tarihi"></asp:TextBox>
  </div>
        </div>

        <div class ="row">
    <div class="col">
    <label>Telefon:</label>
      <asp:TextBox ID="txtSTelefon"  runat="server" required="true" TextMode="Phone" CssClass="form-control" placeholder="Telefon"></asp:TextBox>
  </div>
    <div class="col">
    <label>Eposta:</label>
        
      <asp:TextBox ID="txtSEposta"   runat="server" required="true" TextMode="Email" CssClass="form-control"  placeholder="Eposta"></asp:TextBox>
  </div>
    <div class="col">
    <label>Ülke:</label>
      <asp:TextBox ID="txtSUlke"  runat="server" CssClass="form-control" placeholder="Ülke"></asp:TextBox>
  </div>
    <div class="col">
    <label>Adres:</label>
      <asp:TextBox ID="txtSAdres"  runat="server" required="true" CssClass="form-control" placeholder="Adres"></asp:TextBox>
  </div>
</div>

  
        <div class="row">   
    <div class="col">
    <label>Meslek:</label>
      <asp:DropDownList ID="DropDownMeslek" required="true" CssClass="form-control"  runat="server">
          <asp:ListItem Value="">Seçiniz</asp:ListItem> 
          <asp:ListItem>Yok</asp:ListItem>
            <asp:ListItem>Memur</asp:ListItem>  
            <asp:ListItem>Çiftçi</asp:ListItem>  
            <asp:ListItem>Doktar</asp:ListItem>  
            <asp:ListItem>Öğretmen</asp:ListItem>  
            <asp:ListItem>Avukat</asp:ListItem>  

          </asp:DropDownList>
  </div>
      <div class="col">
    <label>Yakınlık:</label>
     <asp:DropDownList ID="DropDownListYakınlık"  required="true" CssClass="form-control" runat="server">
          <asp:ListItem Value="">Seçiniz</asp:ListItem>  
            <asp:ListItem>Kendisi</asp:ListItem>  
            <asp:ListItem>Eşi</asp:ListItem>  
            <asp:ListItem>Çocuğu</asp:ListItem>   

          </asp:DropDownList>
  </div>
      <div class="col">
    <label>Kilo:</label>
      <asp:TextBox ID="txtSKilo"  runat="server" required="true" CssClass="form-control" placeholder="Kilo"></asp:TextBox>
  </div>
      <div class="col">
    <label>Boy:</label>
      <asp:TextBox ID="txtSBoy"  runat="server" required="true" CssClass="form-control" placeholder="Boy"></asp:TextBox>
  </div>
</div>
  
        <div class="row">
            <div class="col">
    <asp:Button ID="btnNext" CssClass="btn btn-primary btn-lg form-control" runat="server"  Text="İlerle" OnClick="btnNext_Click"  />
   </div>
            <div class="col">
    <asp:Button ID="btnInsert" CssClass="btn btn-secondary btn-lg form-control" runat="server"  Text="Ekle" OnClick="btnInsert_Click"  />
    </div>
        
        </div>
            </form>
    
 
  </body>
</html>
