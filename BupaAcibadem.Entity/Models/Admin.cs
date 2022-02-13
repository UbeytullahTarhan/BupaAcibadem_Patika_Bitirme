using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BupaAcibadem.Entity.Models
{
  public   class Admin
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
}
