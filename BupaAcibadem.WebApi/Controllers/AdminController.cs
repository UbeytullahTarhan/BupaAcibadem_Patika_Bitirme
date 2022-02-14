using BupaAcibadem.Bll;
using BupaAcibadem.Entity.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace BupaAcibadem.WebApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AdminController : ControllerBase
    {
        [HttpGet("Select")]
        public IActionResult Select(string ? adi, string ? tc, string ? soyadi)
        {
            Admin am = new Admin();
            AdminBll bll = new AdminBll();
            List<Admin> lst = new List<Admin>();
            
            
            try
            {
                lst = bll.Select(adi, tc, soyadi);
            }
            catch (Exception)
            {

                return BadRequest();
            }





            return Ok(lst);
        }
    }
}
