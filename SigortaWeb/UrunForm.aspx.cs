using SigortaWeb.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SigortaWeb
{
    public partial class UrunForm : System.Web.UI.Page

    {
        string id;
        
        
        protected void Page_Load(object sender, EventArgs e)
        {
            UrunModel um;
            id =Request.QueryString["id"];
            if (!IsPostBack)
            {
                if (id != null)
                {
                    um = GetUrun(Convert.ToInt32( id));
                    Label1.Text = um.Yatarak.ToString();
                    Label2.Text = um.YatarakVeAyakta.ToString();
                    Label3.Text = um.YatarakVeDogum.ToString();
                    Label4.Text = um.YatarakAyaktaDogun.ToString();

                }
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            InsertPrim(new PrimModel { PFiyat = Convert.ToInt32(Label1.Text),PTaksit= DropDownList1.SelectedIndex,SEId= Convert.ToInt32(id) },"Yatarak");
            


        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            InsertPrim(new PrimModel { PFiyat = Convert.ToInt32(Label2.Text), PTaksit = DropDownList2.SelectedIndex, SEId = Convert.ToInt32(id) },"Yatarak Ayakta");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            InsertPrim(new PrimModel { PFiyat = Convert.ToInt32(Label3.Text), PTaksit = DropDownList3.SelectedIndex, SEId = Convert.ToInt32(id) },"Yatarak Doğum");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            InsertPrim(new PrimModel { PFiyat = Convert.ToInt32(Label4.Text), PTaksit = DropDownList4.SelectedIndex, SEId = Convert.ToInt32(id) },"Yatrak-Ayakta-Doğum");
        }
        UrunModel GetUrun(int id)
        {
            //saçma bir yapı oldu tüm verileri getirip veriler üzerinden arama yapmak yerine veritabanında
            //direkt istediğimiz parametreye uygun veri getirmeliyiz json dönüştürme işlemlerine bak
            string url = "api/Prim/Urun?id="+id.ToString();
            UrunModel um = new UrunModel();
            using (var client = new HttpClient())
            {

                client.BaseAddress = new Uri("https://localhost:5001/");
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                var response = client.GetAsync(url).Result;
                if (response.IsSuccessStatusCode)
                {

                    IEnumerable<UrunModel> dataObjects = response.Content.ReadAsAsync<IEnumerable<UrunModel>>().Result;


                    foreach (var d in dataObjects)
                    {
                        um = d;

                    }
                    Console.Write("Success" + response);

                }
                else
                    Console.Write("Error");
            }
            return um;
        }
        void InsertPrim(PrimModel pm,string urun)
        {
            

            using (var client = new HttpClient())
            {

                client.BaseAddress = new Uri("https://localhost:5001/");
                var response = client.PostAsJsonAsync("api/Prim/Insert", pm).Result;
                if (response.IsSuccessStatusCode)
                {
                    Console.Write("Success" + response);
                    Response.Redirect("https://localhost:44302/PrimForm.aspx?id=" + id+"&urun="+urun);


                }
                else
                    Console.Write("Error");
            }
        }

    }
}