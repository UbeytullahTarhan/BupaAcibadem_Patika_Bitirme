using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SigortaWeb
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        public class sm
        {
            public int SEId { get; set; }
            public string SETc { get; set; }
            public string SEAdi { get; set; }
            public string SESoyadi { get; set; }
            public char SECinsiyet { get; set; }
            public DateTime SEDogumTarihi { get; set; }
            public string SETelefon { get; set; }
            public string SEEposta { get; set; }
            public string SEUlke { get; set; }
            public string SEAdres { get; set; }
        }

        

            
        
        protected void Page_Load(object sender, EventArgs e)
        {
        string URL = "https://localhost:5001/";
        string urlParameters = "api/SigortaEttiren/Select";
        DataTable dt = new DataTable();
        dt.Columns.Add("Adı", typeof(string));
        dt.Columns.Add("Soyadı", typeof(string));
        dt.Columns.Add("Type", typeof(string));
        dt.Columns.Add("Rank", typeof(string));
        dt.Columns.Add("City", typeof(string));
        HttpClient client = new HttpClient();
        client.BaseAddress = new Uri(URL);
        client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
        HttpResponseMessage response = client.GetAsync(urlParameters).Result;
        if (response.IsSuccessStatusCode)
        {
            var dataObjects = response.Content.ReadAsAsync<IEnumerable<sm>>().Result;
            foreach (var d in dataObjects)
            {
                dt.Rows.Add();
                dt.Rows.Add(d.SEAdi);
                dt.Rows.Add(d.SESoyadi);
                dt.Rows.Add(d.SETc);
                dt.Rows.Add(d.SETelefon);
            }
        }
        else
        {
            System.Diagnostics.Debug.WriteLine("{ 0} ({1})", (int)response.StatusCode, response.ReasonPhrase);
        }
        client.Dispose();
        GridView1.DataSource = dt;
        GridView1.DataBind();

    }
    }
}