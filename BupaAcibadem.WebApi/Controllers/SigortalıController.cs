using BupaAcibadem.Bll;
using BupaAcibadem.Entity.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BupaAcibadem.WebApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class SigortalıController: ControllerBase
    {
        SigortalıBll bll;
        Sigortalı sm;
        
        [HttpGet("Find")]
        public IActionResult Find(int id , string ?  tc)
        {

            bll = new SigortalıBll();
            sm = new Sigortalı();


            try
            {
                sm = bll.Find(id,tc);
            }
            catch (Exception)
            {

                throw;
            }





            return Ok(sm);
        }

        [HttpGet("Select")]
        public IActionResult Select(int id)
        {

            bll = new SigortalıBll();
            List<Sigortalı> lst = new List<Sigortalı>();


            try
            {
                lst = bll.Select(id);
            }
            catch (Exception)
            {

                throw;
            }





            return Ok(lst);
        }


        [HttpPost("Insert")]
        public IActionResult Insert(Sigortalı sm)
        {

            bool ok = false;
            bll = new SigortalıBll();

            try
            {
                ok = bll.Insert(sm);
            }
            catch (Exception)
            {

                throw;
            }





            return Ok(ok);
        }

        [HttpPut("Update")]
        public IActionResult Update(Sigortalı sm)
        {

            bool ok = false;
            bll = new SigortalıBll();

            try
            {
                ok = bll.Update(sm);
            }
            catch (Exception)
            {

                throw;
            }





            return Ok(ok);
        }


        [HttpDelete("Delete")]
        public IActionResult Delete(int id)
        {

            bll = new SigortalıBll();




            try
            {
                return Ok(bll.Delete(id));
            }
            catch (Exception)
            {

                throw;
            }





            ///return bad request
        }
    }
}
