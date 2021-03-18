using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using SweetApi.Context;
using SweetApi.Model;

namespace SweetApi.Controllers
{

	[ApiController]
	[Route("[controller]")]
	public class DolceController : ControllerBase
	{


		readonly SweetContext EmpDetails;
		public DolceController(SweetContext dolceContext)
		{
			EmpDetails = dolceContext;
		}



		[HttpGet]
		public IEnumerable<Dolce> Get()
		{
			var data = EmpDetails.Dolce.ToList();
			return data;
		}

		[HttpPost]
		public IActionResult Post([FromBody] Dolce obj)
		{
			var data = EmpDetails.Dolce.Add(obj);
			EmpDetails.SaveChanges();
			return Ok();
		}

		[HttpPut("{id}")]
		public IActionResult Put(int id, [FromBody] Dolce obj)
		{
			var data = EmpDetails.Dolce.Update(obj);
			EmpDetails.SaveChanges();
			return Ok();
		}


		[HttpDelete("{id}")]
		public IActionResult Delete(int id)
		{
			var data = EmpDetails.Dolce.Where(a => a.Pk_Dolce == id).FirstOrDefault();
			EmpDetails.Dolce.Remove(data);
			EmpDetails.SaveChanges();
			return Ok();

		}
	}
}
