using BupaAcibadem.Bll;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BupaAcibadem.WebApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class FaturaController : ControllerBase
    {
        FaturaBll bll;
        
        //hata yönetimi hallet
        //Ok dönerken eğer olumlu değilse badrequest veya 404 vb dön
        [HttpGet("Find")]
        public IActionResult Find(int id)
        {
            int seid;
            bll = new FaturaBll();
           

            try
            {
                seid=bll.Find(id);
            }
            catch (Exception)
            {

                return BadRequest();
            }





            return Ok(seid);
        }

        
        

       
        [HttpPost("Insert")]
        public IActionResult Insert(int id)
        {

            bool ok = false;
            bll = new FaturaBll();

            try
            {
                ok = bll.Insert(id);
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

            bll = new FaturaBll();




            try
            {
                return Ok(bll.Delete(id));
            }
            catch (Exception)
            {

                return BadRequest();
            }





            ///return bad request
        }
    }
}
