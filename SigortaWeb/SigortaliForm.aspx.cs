using SigortaWeb.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNet;
using System.Net.Http.Headers;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Http.Formatting;
using System.Net.Http;
using Newtonsoft.Json;

namespace SigortaWeb
{
    public partial class SigortalıForm : System.Web.UI.Page

    {
        public string tc;
        int id;
        //string tc = "yok";
        
       
        protected void Page_Load(object sender, EventArgs e)
        {
            tc= Request.QueryString["tc"];
            
            if (!IsPostBack)
            {
                if ((tc!=null))
                {
                    id = IdFind(tc);
                }
            }
            
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            if (Insert())
            {
                Response.Redirect("https://localhost:44302/UrunForm.aspx?id="+id);
            }
            
            
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            if (Insert())
            {

                Response.Redirect("https://localhost:44302/SigortaliForm.aspx?tc="+tc);
            }
        }
        int IdFind(string tc)
        {
            //saçma bir yapı oldu tüm verileri getirip veriler üzerinden arama yapmak yerine veritabanında
            //direkt istediğimiz parametreye uygun veri getirmeliyiz json dönüştürme işlemlerine bak
            string url = "api/SigortaEttiren/Select";
            int id = 0;
            using (var client = new HttpClient())
            {

                client.BaseAddress = new Uri("https://localhost:5001/");
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                var response = client.GetAsync(url).Result;
                if (response.IsSuccessStatusCode)
                {

                    IEnumerable<SigortaEttirenModel> dataObjects = response.Content.ReadAsAsync<IEnumerable<SigortaEttirenModel>>().Result;
                    
                    
                    foreach (var d in dataObjects)
                    {
                        if (d.SETc == tc)
                        {
                            id = d.SEId;
                            return id;
                        }
                        
                    }
                    Console.Write("Success" + response);

                }
                else
                    Console.Write("Error");
            }
            return id;
        }
        bool Insert()
        {
            
            id = IdFind(tc);
            SigortaliModel sm;
            sm  = new SigortaliModel
            {

                STc = txtSTc.Text.Trim(),
                SAdi = txtSAdi.Text.Trim(),
                SSoyadi = txtSSoyadi.Text.Trim(),
                SCinsiyet = Convert.ToChar(DropDownCinsiyet.SelectedValue[0]),
                SDogumTarihi = Convert.ToDateTime(txtSDogumTarihi.Text.Trim()),
                STelefon = txtSTelefon.Text.Trim(),
                SEposta = txtSEposta.Text.Trim(),
                SUlke = txtSUlke.Text.Trim(),
                SAdres = txtSAdres.Text.Trim(),
                SMeslek = DropDownMeslek.SelectedValue,
                SYakınlık = DropDownListYakınlık.SelectedValue,
                SKilo = Convert.ToDecimal(txtSKilo.Text.Trim()),
                SBoy = Convert.ToDecimal(txtSBoy.Text.Trim()),
                SEId = id,

            };

            using (var client = new HttpClient())
            {

                client.BaseAddress = new Uri("https://localhost:5001/");
                var response = client.PostAsJsonAsync("api/Sigortalı/Insert", sm).Result;
                if (response.IsSuccessStatusCode)
                {
                    Console.Write("Success" + response);
                    return true;
                    sm=null;
                }
                else
                {
                    Console.Write("Error");
                    return false;
                }
                    
            }
        }
    }
}