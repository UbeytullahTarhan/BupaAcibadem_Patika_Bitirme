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
    public class SigortaEttirenController:ControllerBase
    {
        SigortaEttirenBll bll;
        SigortaEttiren sm;
        //hata yönetimi hallet
        //Ok dönerken eğer olumlu değilse badrequest veya 404 vb dön
        [HttpGet("Find")]
        public IActionResult Find(int id ,string ? tc)
        {
            
            bll = new SigortaEttirenBll();
            sm = new SigortaEttiren() ;
            

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
        public IActionResult Select()
        {

            bll = new SigortaEttirenBll();
            List<SigortaEttiren> lst = new List<SigortaEttiren>();
            

            try
            {
                lst = bll.Select();
            }
            catch (Exception)
            {

                throw;
            }





            return Ok(lst);
        }


        [HttpPost("Insert")]
        public IActionResult Insert(SigortaEttiren sm)
        {

            bool ok = false;
            bll = new SigortaEttirenBll();

            try
            {
               ok= bll.Insert(sm);
            }
            catch (Exception)
            {

                throw;
            }





            return Ok(ok);
        }

        [HttpPut("Update")]
        ///içiboş
        public IActionResult Update(SigortaEttiren sm)
        {

            bool ok = false;
            bll = new SigortaEttirenBll();

            try
            {

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

            bll = new SigortaEttirenBll();

            


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
