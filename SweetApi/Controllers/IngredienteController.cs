using Microsoft.AspNetCore.Mvc;
using SweetApi.Context;
using SweetApi.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SweetApi.Controllers
{
	[ApiController]
	[Route("SweetApi")]
	public class IngredienteController : ControllerBase
	{

		readonly SweetContext EmpDetails;
		public IngredienteController(SweetContext dolceContext)
		{
			EmpDetails = dolceContext;
		}

		[HttpGet]
		public IEnumerable<Ingrediente> Get(string day, string pkvetrina)
		{


			VetrinaController objVetrina = new VetrinaController(EmpDetails);
			Vetrina objVetr = new Vetrina();
			List<Vetrina> lstVetr = EmpDetails.Vetrina.ToList();
			objVetr = lstVetr[Convert.ToInt32(pkvetrina)];
			DateTime dat = DateTime.Now;
			DateTime d = dat.AddDays(-Convert.ToInt32(day));
			objVetr.Data = d;
			//decimal prezzo = objVetrina.CalcolaSconto(objVetr, 1000);
			//string stato = objVetrina.CalcolaStato(objVetr).ToString();
			List<Ingrediente> lstIngr = new List<Ingrediente>();
			return lstIngr;

		}
	}
}
