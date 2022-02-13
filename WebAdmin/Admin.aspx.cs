using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAdmin
{
    public partial class Admin : System.Web.UI.Page

    {

        public class AdminModel
        {
            public string SETc { get; set; }
            public string SEAdi { get; set; }
            public string SESoyadi { get; set; }
            public char SECinsiyet { get; set; }
            public DateTime SEDogumTarihi { get; set; }
            public string SETelefon { get; set; }
            public string SEEposta { get; set; }
            public string SEUlke { get; set; }
            public string SEAdres { get; set; }
            public decimal PFiyat { get; set; }
            public int PTaksit { get; set; }
            public bool SatınAlındı { get; set; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            GetAll("","","");
        }

        void GetAll(string tc,string adi,string soyadi)
        {
            
            string url = "api/Admin/Select?adi="+adi+ "&tc=" +tc+ "&soyadi="+soyadi;
            
            using (var client = new HttpClient())
            {

                client.BaseAddress = new Uri("https://localhost:5001/");
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                var response = client.GetAsync(url).Result;
                DataTable dt = new DataTable();
                dt.Columns.Add("Tc", typeof(string));
                dt.Columns.Add("Adi", typeof(string));
                dt.Columns.Add("Soyadi", typeof(string));
                dt.Columns.Add("Cinsiyet", typeof(char));
                dt.Columns.Add("Dogum Tarihi", typeof(string));
                dt.Columns.Add("Telefon", typeof(string));
                dt.Columns.Add("Eposta", typeof(string));
                dt.Columns.Add("Ulke", typeof(string));
                dt.Columns.Add("Adres", typeof(string));
                dt.Columns.Add("Prim Fiyat", typeof(decimal));
                dt.Columns.Add("Prim Taksit", typeof(int));
                dt.Columns.Add("Satın Alındı Mı?", typeof(bool));
                


                if (response.IsSuccessStatusCode)
                {

                    IEnumerable<AdminModel> dataObjects = response.Content.ReadAsAsync<IEnumerable<AdminModel>>().Result;

                    
                    foreach (var d in dataObjects)
                    {
                        
                        dt.Rows.Add(d.SETc, d.SEAdi,d.SESoyadi,d.SECinsiyet,d.SEDogumTarihi.ToShortDateString(),d.SETelefon,d.SEEposta,d.SEUlke,d.SEAdres,d.PFiyat,d.PTaksit,d.SatınAlındı);
                        





                    }
                    Console.Write("Success" + response);

                }
                else
                {
                    //Label5.Text = "hata";
                    Console.Write("Error");
                }
                client.Dispose();
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtSEAdi.Text = "";
            txtSESoyadı.Text = "";
            txtSETc.Text = "";
        }

        protected void txtSETc_TextChanged(object sender, EventArgs e)
        {
            GetAll(txtSETc.Text.Trim(), txtSEAdi.Text.Trim(), txtSESoyadı.Text.Trim());
        }

        protected void txtSEAdi_TextChanged(object sender, EventArgs e)
        {
            GetAll(txtSETc.Text.Trim(), txtSEAdi.Text.Trim(), txtSESoyadı.Text.Trim());
        }

        protected void txtSESoyadı_TextChanged(object sender, EventArgs e)
        {
            GetAll(txtSETc.Text.Trim(), txtSEAdi.Text.Trim(), txtSESoyadı.Text.Trim());
        }
    }


}
