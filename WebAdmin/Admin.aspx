<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="WebAdmin.Admin" %>

<!DOCTYPE html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="row">
        <div class="col">
    <label>Tc Kimlik No:</label>
      <asp:TextBox ID="txtSETc" runat="server"  CssClass="form-control" placeholder="Tc Kimlik No" OnTextChanged="txtSETc_TextChanged"></asp:TextBox>
  </div>
  <div class="col">
    <label>Adı:</label>
      <asp:TextBox ID="txtSEAdi" runat="server"   CssClass="form-control" placeholder="Adı" OnTextChanged="txtSEAdi_TextChanged"></asp:TextBox>
  </div>
             <div class="col">
    <label>Soyadı :</label>
      <asp:TextBox ID="txtSESoyadı"  runat="server" CssClass="form-control" placeholder="Soyadı" OnTextChanged="txtSESoyadı_TextChanged"></asp:TextBox>
  </div>
            <div class="col">
                <label></label>
                <asp:Button ID="btnClear" CssClass="btn btn-danger form-control" runat="server" Text="Temizle" OnClick="btnClear_Click"  />
            </div>
        </div>

        
            <asp:GridView ID="GridView1" class="table table-success table-striped"   runat="server"></asp:GridView>
        
    </form>
</body>
</html>
