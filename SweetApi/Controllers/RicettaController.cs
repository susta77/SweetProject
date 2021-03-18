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
	[Route("[controller]")]
	public class RicettaController : ControllerBase
	{

		readonly SweetContext EmpDetails;
		public RicettaController(SweetContext dolceContext)
		{
			EmpDetails = dolceContext;
		}
		[HttpGet]
		public IEnumerable<object> Get()
		{
			return null;
		}

		[Route("GetIngredienti/id/{id}/")]
		[HttpGet]
		public IEnumerable<object> GetIngredienti(string id)
		{
			List<Ricetta> dataRicetta = EmpDetails.Ricetta.ToList();
			List<Ingrediente> dataIngredienti = EmpDetails.Ingrediente.ToList();
			List<Misura> dataMisura = EmpDetails.Misura.ToList();
			List<Dolce> dataDolce = EmpDetails.Dolce.ToList();

			Vetrina objVetrina = new Vetrina();
			Int64.TryParse(id, out Int64 pk_Dolce);
			var lstRicetta = from ricetta in dataRicetta
							 join ingrediente in dataIngredienti
							 on ricetta.Fk_Ingrediente equals ingrediente.Pk_ingrediente
							 join misura in dataMisura
							 on ricetta.FK_Misura equals misura.PK_Misura
							 join dolce in dataDolce
							 on ricetta.Fk_Dolce equals dolce.Pk_Dolce
							 where ricetta.Fk_Dolce == pk_Dolce

							 select new Ricettas
							 {
								 Quntita=ricetta.Quantita,
								 NomeIngrediente=ingrediente.Nome,
								 Descrizione=misura.Descrizione,
								 NomeDolce=dolce.Nome
							 }
									;
			return lstRicetta;

		}
	}
}

public class Ricettas : Misura
{
	public string NomeIngrediente { get; set; }
	public decimal Quntita { get; set; }
	public string NomeDolce { get; set; }
}
