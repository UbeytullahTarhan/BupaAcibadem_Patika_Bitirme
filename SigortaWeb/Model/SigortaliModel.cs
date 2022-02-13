using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SigortaWeb.Model
{
    public class SigortaliModel
    {
        public int SId { get; set; }
        public string STc { get; set; }
        public string SAdi { get; set; }
        public string SSoyadi { get; set; }
        public char SCinsiyet { get; set; }
        public DateTime SDogumTarihi { get; set; }
        public string STelefon { get; set; }
        public string SEposta { get; set; }
        public string SUlke { get; set; }
        public string SAdres { get; set; }
        public string SMeslek { get; set; }
        public string SYakınlık { get; set; }
        public decimal SKilo { get; set; }
        public decimal SBoy { get; set; }
        public int SEId { get; set; }
    }
}