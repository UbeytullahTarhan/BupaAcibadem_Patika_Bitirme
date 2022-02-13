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
    public partial class PrimForm : System.Web.UI.Page
    {
        string id;
        string teminat;
       
        protected void Page_Load(object sender, EventArgs e)
        {
            PrimModel pm;
            id = Request.QueryString["id"];
            teminat= Request.QueryString["urun"];
            if (!IsPostBack)
            {
                if (id != null)
                {
                    pm = GetUrun(Convert.ToInt32(id));

                    Label1.Text = pm.PFiyat.ToString();
                    Label2.Text = pm.PTaksit.ToString();
                    Label3.Text = teminat;
                    

                }
            }
        }
        PrimModel GetUrun(int id)
        {
            
            string url = "api/Prim/Select?id=" + id.ToString();
            PrimModel pm = new PrimModel();
            using (var client = new HttpClient())
            {

                client.BaseAddress = new Uri("https://localhost:5001/");
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                var response = client.GetAsync(url).Result;
                if (response.IsSuccessStatusCode)
                {

                    IEnumerable<PrimModel> dataObjects = response.Content.ReadAsAsync<IEnumerable<PrimModel>>().Result;


                    foreach (var d in dataObjects)
                    {
                        pm = d;

                    }
                    Console.Write("Success" + response);

                }
                else
                    Console.Write("Error");
            }
            return pm;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            

            using (var client = new HttpClient())
            {
                

                client.BaseAddress = new Uri("https://localhost:5001/");
                var response = client.PostAsync("api/Fatura/Insert?id="+id, null);
                if (((int)response.Result.StatusCode)==200)
                {
                    Console.Write("Success" + response);
                    Button1.Visible = false;

                }
                else
                {
                    Console.Write("Error");
                    
                }

            }
        }
         
        }
    }
