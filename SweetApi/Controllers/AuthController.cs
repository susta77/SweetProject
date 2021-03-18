
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using SweetApi.Context;
using SweetApi.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Threading.Tasks;

namespace SweetApi.Controllers
{
	[ApiController]
	[Route("[controller]")]
	public class AuthController : ControllerBase
	{

		readonly SweetContext EmpDetails;
		public AuthController(SweetContext dolceContext)
		{
			EmpDetails = dolceContext;
		}

		[HttpGet]
		public List<Auth> Get()
		{
			var data = EmpDetails.Auth.ToList();
			return data;
		}


		[HttpPost]
		[AllowAnonymous]
		[ProducesResponseType(typeof(string), 200)]
		public List<WebApiResult> SignIn([FromBody] Auth model)
		{
			List<WebApiResult> lstResult = new List<WebApiResult>();
			WebApiResult apiResult = new WebApiResult();
			string message = string.Empty;
			if (!ModelState.IsValid)
			{
				apiResult.message = "Oggetto user non valido!";
				apiResult.status = WebApiResult.state.KO.ToString();
				lstResult.Add(apiResult);
				return lstResult;
			}

			var data = EmpDetails.Auth.ToList();
			var result = (from a in data where a.email == model.email && a.password == model.password select a).FirstOrDefault();
			if (result == null)
			{
				apiResult.message = "Wrong email or password";
				apiResult.status = WebApiResult.state.KO.ToString();
				lstResult.Add(apiResult);
				return lstResult;
			}
			string token = Guid.NewGuid().ToString();
			apiResult.message = "Utente accreditato!";
			apiResult.status = WebApiResult.state.OK.ToString();
			apiResult.token = token;
			lstResult.Add(apiResult);
			return lstResult;
		}



	}
}

public class WebApiResult
{
	public string status { get; set; }
	public string message { get; set; }
	public string token { get; set; }

	public enum state
	{
		OK,
		KO
	}
}



