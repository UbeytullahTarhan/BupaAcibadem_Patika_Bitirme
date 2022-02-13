using SigortaWeb.Model;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SigortaWeb
{
    public partial class Insert : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            
            try
            {
                SigortaEttirenModel sm;
                sm = new SigortaEttirenModel { SEAdi = txtSEAdi.Text.Trim(), SEAdres = txtSEAdres.Text.Trim(), SECinsiyet = DropDownCinsiyet.SelectedValue[0], SEDogumTarihi = Convert.ToDateTime(txtSEDogumTarihi.Text.Trim()), SEEposta = txtSEEposta.Text.Trim(), SETc = txtSETc.Text.Trim(), SESoyadi = txtSESoyadı.Text.Trim(), SETelefon = txtSETelefon.Text.Trim(), SEUlke = txtSEUlke.Text.Trim() };

                using (var client = new HttpClient())
                {

                    client.BaseAddress = new Uri("https://localhost:5001/");
                    var response = client.PostAsJsonAsync("api/SigortaEttiren/Insert", sm).Result;
                    if (response.IsSuccessStatusCode)
                    {
                        Console.Write("Success" + response);


                    }
                    else
                        Console.Write("Error");
                    Response.Redirect("https://localhost:44302/SigortaliForm.aspx?tc=" + txtSETc.Text.Trim());
                }
            }
            catch (Exception ex)
            {

                Console.Write("Lütfen Girdileri Kontrol Ediniz");
                
            }
            
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {

        }
        public void SendDataForm(NameValueCollection collections,string remoteUrl)
        {
            

            string html = "<html><head>";
            html += "</head><body onload='document.forms[0].submit()'>";
            html += string.Format("<form name='PostForm' method='POST' action='{0}'>", remoteUrl);
            foreach (string key in collections.Keys)
            {
                html += string.Format("<input name='{0}' type='text' value='{1}'>", key, collections[key]);
            }
            html += "</form></body></html>";
            Response.Clear();
            Response.ContentEncoding = Encoding.GetEncoding("ISO-8859-1");
            Response.HeaderEncoding = Encoding.GetEncoding("ISO-8859-1");
            Response.Charset = "ISO-8859-1";
            Response.Write(html);
            Response.End();
        }
    }
}