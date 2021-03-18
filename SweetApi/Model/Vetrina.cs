using SweetApi.Controllers;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SweetApi.Model
{
	public class Vetrina
	{
		[Key]
		public int pk_Vetrina { get; set; }
		public int fk_Dolce { get; set; }
		public DateTime Data { get; set; }
		public string Stato { get; set; }
		public decimal Prezzo { get; set; }

		public enum StatoDolce
		{
			InVendita,
			NonCommestibile
		}

		
	}
}
