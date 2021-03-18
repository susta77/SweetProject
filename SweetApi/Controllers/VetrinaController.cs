using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SweetApi.Context;
using SweetApi.Model;
using static SweetApi.Model.Vetrina;

namespace SweetApi.Controllers
{
	[ApiController]
	[Route("[controller]")]
	public class VetrinaController : ControllerBase
	{
		readonly SweetContext EmpDetails;
		public VetrinaController(SweetContext dolceContext)
		{
			EmpDetails = dolceContext;

		}
		[HttpGet]
		public IEnumerable<object> Get()
		{
			List<Vetrina> dataVetrina = EmpDetails.Vetrina.ToList();
			List<Dolce> dataDolce = EmpDetails.Dolce.ToList();
			Vetrina objVetrina = new Vetrina();
			var lstVetr = from vetrina in dataVetrina
						  join dolce in dataDolce
						  on vetrina.fk_Dolce equals dolce.Pk_Dolce
						  select new
						  {
							  pk_Vetrina = vetrina.pk_Vetrina,
							  fk_Dolce = vetrina.fk_Dolce,
							  Descrizione = dolce.Descrizione,
							  Stato = CalcolaStato(vetrina).ToString(),
							  Prezzo = CalcolaSconto(vetrina, dolce.Prezzo),
							  Nome = dolce.Nome,
							  Data = vetrina.Data
						  }
									;

			lstVetr = lstVetr.Where(x => x.Stato == Vetrina.StatoDolce.InVendita.ToString()).OrderByDescending(x => x.Data)
		   .ToList(); ;
			return lstVetr;

		}

		[Route("inserisciDolceVetrina/dolce/{dolce}/")]
		[HttpGet]
		public WebApiResult inserisciDolceVetrina(string dolce)
		{
			WebApiResult objResult = new WebApiResult();
			if (dolce == "undefined")
			{
				objResult.message = "Errore Selezionare un dolce dal menù a tendina!";
				objResult.status = WebApiResult.state.KO.ToString();
				return objResult;// BadRequest("Selezionare un dolce dal menù a tendina!");
			}
			Dolce objDolce = new Dolce();
			List<string> parseValue = dolce.Split('-').ToList<string>();
			int.TryParse(parseValue[1].ToString(), out int id);
			objDolce = (from a in EmpDetails.Dolce where a.Pk_Dolce == id select a).FirstOrDefault();
			Vetrina objVetrina = new Vetrina();
			objVetrina.Data = DateTime.Now;
			objVetrina.Stato = Vetrina.StatoDolce.InVendita.ToString();
			objVetrina.fk_Dolce = id;
			objVetrina.Prezzo = objDolce.Prezzo;
			var data = EmpDetails.Vetrina.Add(objVetrina);
			EmpDetails.SaveChanges();
			objResult.message=$"Dolce  {objDolce.Nome} Prezzo {objDolce.Prezzo} messo in vendita appare nella vetrina con data odierna!";
			objResult.status = WebApiResult.state.OK.ToString();
			return objResult;
		}

		[Route("GetIngredienti/id/{id}/")]
		[HttpGet]
		public IEnumerable<object> GetIngredienti(string id)
		{
			List<Vetrina> dataVetrina = EmpDetails.Vetrina.ToList();
			List<Dolce> dataDolce = EmpDetails.Dolce.ToList();
			Vetrina objVetrina = new Vetrina();
			Int64.TryParse(id, out Int64 pk_vetrina);
			var lstVetr = from vetrina in dataVetrina
						  join dolce in dataDolce
						  on vetrina.fk_Dolce equals dolce.Pk_Dolce
						  where vetrina.pk_Vetrina == pk_vetrina
						  select new
						  {
							  pk_Vetrina = vetrina.pk_Vetrina,
							  fk_Dolce = vetrina.fk_Dolce,
							  Descrizione = dolce.Descrizione,
							  Stato = CalcolaStato(vetrina).ToString(),
							  Prezzo = CalcolaSconto(vetrina, dolce.Prezzo),
							  Nome = dolce.Nome,
							  Data = vetrina.Data
						  }
									;

			lstVetr = lstVetr.Where(x => x.Stato == Vetrina.StatoDolce.InVendita.ToString()).OrderByDescending(x => x.Data)
		   .ToList(); ;
			return lstVetr;

		}

		/// <summary>
		/// Il metodo calcola lo sconto primo giorno prezzo pieno , secondo 80% terzo 20%. Stato non commestibile al  4 giorno
		/// </summary>
		/// <param name="objVetr">data messa in vendita del dolce in vetrina</param>
		/// <param name="PrezzoDolce">prezzo del dolce alla data attuale</param>
		/// <returns></returns>
		public decimal CalcolaSconto(Vetrina objVetr, decimal PrezzoDolce)
		{
			decimal prezzo = PrezzoDolce;
			Int32 result = CountDay(objVetr.Data);
			//Se il dolce è stato messo in vetrina da 1 giorni non aggiorno il prezzo
			if (result >= 24 && result < 48)
			{
				objVetr.Prezzo = PrezzoDolce;
				AggiornaVetrina(objVetr);
				return objVetr.Prezzo;
			}
			//Se il dolce è stato messo in vetrina da 2 giorni aggiorno il prezzo
			else if (result >= 48 && result < 72)
			{
				objVetr.Prezzo = PrezzoDolce * 80 / 100;
				AggiornaVetrina(objVetr);
				return objVetr.Prezzo;
			}
			//Se il dolce è stato messo in vetrina da 3 giorni aggiorno il prezzo
			else if (result >= 72 && result < 96)
			{
				objVetr.Prezzo = PrezzoDolce * 20 / 100;
				AggiornaVetrina(objVetr);
				return objVetr.Prezzo;
			}
			//Se il dolce è stato messo in vetrina da + di 3 giorni aggiorno il prezzo
			else if (result >= 96)
			{
				objVetr.Prezzo = 0;
				AggiornaVetrina(objVetr);
				return objVetr.Prezzo;
			}
			return prezzo;
		}
		public string CalcolaStato(Vetrina objVetr)
		{
			double result = CountDay(objVetr.Data);
			if (result >= 96)
			{
				objVetr.Stato = StatoDolce.NonCommestibile.ToString();
				AggiornaVetrina(objVetr);
				return objVetr.Stato;
			}
			objVetr.Stato = StatoDolce.InVendita.ToString();
			AggiornaVetrina(objVetr);
			return objVetr.Stato;
		}

		private int CountDay(DateTime start)
		{
			int result = Convert.ToInt32((DateTime.Now - start).TotalHours) == 0 ? 24 : Convert.ToInt32((DateTime.Now - start).TotalHours);
			return result;
		}


		public void AggiornaVetrina(Vetrina objVet)
		{
			Vetrina f = (from s in EmpDetails.Vetrina where s.pk_Vetrina == objVet.pk_Vetrina select s).SingleOrDefault();
			EmpDetails.Entry(f).State = EntityState.Detached;
			EmpDetails.Vetrina.Attach(objVet);
			EmpDetails.Entry(objVet).State = EntityState.Modified;
			EmpDetails.SaveChanges();
		}



	}
}

namespace SweetApi.Controllers.VetrinaControlle
{
	public class WebApiResult
	{
		public string status { get; set; }
		public string message { get; set; }

		public enum state
		{
			OK,
			KO
		}
	}

}