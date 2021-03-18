using Microsoft.AspNetCore.Mvc;
using SweetApi.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SweetApi.Controllers
{
	[ApiController]
	[Route("[controller]")]
	public class MisuraController : ControllerBase
	{
		readonly SweetContext EmpDetails;
		public MisuraController(SweetContext dolceContext)
		{
			EmpDetails = dolceContext;
		}
	}
}
