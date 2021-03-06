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
    public class PrimController: ControllerBase
    {
        PrimBll bll;
        Prim pm;
       
        [HttpGet("Find")]
        public IActionResult Find(int id)
        {

            bll = new PrimBll();
            pm = new Prim();


            try
            {
                pm = bll.Find(id);
            }
            catch (Exception)
            {

                return BadRequest();
            }





            return Ok(pm);
        }

        [HttpGet("Select")]
        public IActionResult Select(int id)
        {

            bll = new PrimBll();
            List<Prim> lst = new List<Prim>();


            try
            {
                lst = bll.Select(id);
            }
            catch (Exception)
            {

                return BadRequest();
            }





            return Ok(lst);
        }

        [HttpGet("Urun")]
        public IActionResult Urun(int id)
        {
            List<Urun> lst = new List<Urun>();
            bll = new PrimBll();
            Urun um = new Urun();


            try
            {
                um = bll.PrimCalculate(id);
                lst.Add(um);
            }
            catch (Exception)
            {

                return BadRequest();
            }





            return Ok(lst);
        }


        [HttpPost("Insert")]
        public IActionResult Insert(Prim pm)
        {

            bool ok = false;
            bll = new PrimBll();

            try
            {
                ok = bll.Insert(pm);
            }
            catch (Exception)
            {

                return BadRequest();
            }





            return Ok(ok);
        }

        [HttpPut("Update")]
       
        public IActionResult Update(Prim pm)
        {

            bool ok = false;
            bll = new PrimBll();

            try
            {
                ok = bll.Update(pm);
            }
            catch (Exception)
            {

                return BadRequest();
            }





            return Ok(ok);
        }


        [HttpDelete("Delete")]
        public IActionResult Delete(int id)
        {

            bll = new PrimBll();




            try
            {
                return Ok(bll.Delete(id));
            }
            catch (Exception)
            {

                return BadRequest();

            }





            
        }
    }
}

