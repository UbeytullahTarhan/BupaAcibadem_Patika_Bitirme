<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UrunForm.aspx.cs" Inherits="SigortaWeb.UrunForm" %>

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
    <form id="form1" runat="server">
        <div>
            <table class="table table-success table-striped">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Teminatlar</th>
      <th scope="col">Fiyat</th>
      <th scope="col">Taksit</th>
    </tr>
  </thead>
                
  <tbody>
    <tr>
      <th scope="row"><asp:Button CssClass="btn btn-primary" ID="Button1" runat="server" Text="Seç" OnClick="Button1_Click" /></th>
        
        
      <td>Yatarak</td>
      <td><asp:Label ID="Label1" runat="server" Text="Fiyat"></asp:Label></td>
      <td><asp:DropDownList ID="DropDownList1" CssClass="btn btn-info dropdown-toggle dropdown-toggle-split" runat="server">
          <asp:ListItem Value="">Peşin</asp:ListItem>  
            <asp:ListItem>1</asp:ListItem>  
            <asp:ListItem>2</asp:ListItem>  
            <asp:ListItem>3</asp:ListItem>  
            <asp:ListItem>4</asp:ListItem>  
            <asp:ListItem>5</asp:ListItem>  

          </asp:DropDownList></td>
    </tr>
    <tr>
      <th scope="row"><asp:Button CssClass="btn btn-primary" ID="Button2" runat="server" Text="Seç" OnClick="Button2_Click" /></th>
      <td>Yatarak ve Ayakta</td>
      <td><asp:Label ID="Label2" runat="server" Text="Fiyat"></asp:Label></td>
      <td><asp:DropDownList ID="DropDownList2" CssClass="btn btn-info dropdown-toggle dropdown-toggle-split" runat="server">
          <asp:ListItem Value="">Peşin</asp:ListItem>  
            <asp:ListItem>1</asp:ListItem>  
            <asp:ListItem>2</asp:ListItem>  
            <asp:ListItem>3</asp:ListItem>  
            <asp:ListItem>4</asp:ListItem>  
            <asp:ListItem>5</asp:ListItem>  

          </asp:DropDownList></td>
    </tr>
    <tr>
      <th scope="row"><asp:Button CssClass="btn btn-primary" ID="Button3" runat="server" Text="Seç" OnClick="Button3_Click" /></th>
      <td>Yatarak ve Doğum</td>
      <td><asp:Label ID="Label3" runat="server" Text="Fiyat"></asp:Label></td>
      <td><asp:DropDownList ID="DropDownList3" CssClass="btn btn-info dropdown-toggle dropdown-toggle-split" runat="server">
          <asp:ListItem Value="">Peşin</asp:ListItem>  
            <asp:ListItem>1</asp:ListItem>  
            <asp:ListItem>2</asp:ListItem>  
            <asp:ListItem>3</asp:ListItem>  
            <asp:ListItem>4</asp:ListItem>  
            <asp:ListItem>5</asp:ListItem>  

          </asp:DropDownList></td>
    </tr>

      <tr>
      <th scope="row"><asp:Button CssClass="btn btn-primary" ID="Button4" runat="server" Text="Seç" OnClick="Button4_Click" /></th>
      <td>Yatarak-Ayakta-Doğum</td>
          
      <td><asp:Label ID="Label4" runat="server" Text="Fiyat"></asp:Label></td>
      <td><asp:DropDownList ID="DropDownList4" runat="server" CssClass="btn btn-info dropdown-toggle dropdown-toggle-split">
          <asp:ListItem Value="">Peşin</asp:ListItem>  
            <asp:ListItem>1</asp:ListItem>  
            <asp:ListItem>2</asp:ListItem>  
            <asp:ListItem>3</asp:ListItem>  
            <asp:ListItem>4</asp:ListItem>  
            <asp:ListItem>5</asp:ListItem>  

          </asp:DropDownList></td>
    </tr>
  </tbody>
</table>
        </div>
    </form>
</body>
</html>
