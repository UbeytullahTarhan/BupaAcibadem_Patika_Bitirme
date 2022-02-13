using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BupaAcibadem.Entity.Static
{
   public class Enums
    {
       public enum Urun
        {
            Yatarak =800,
            YatarakVeAyakta = 1000,
            YatarakVeDogum=1200,
            YatarakAyaktaDogun=1800
        }
       public enum Yas
        {
            //0-15
            Cocuk =-10,
            //15-30
            Genc =-35,
            //+30
            Yaslı=25
        }

    }
}
