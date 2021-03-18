using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SweetApi.Model
{
	public class Ricetta
	{
		[Key]
		public int Pk_Ricetta { get; set; }
		public int Fk_Ingrediente {get;set;}		
		public int Fk_Dolce { get; set; }
		public int FK_Misura { get; set; }	
		public decimal Quantita { get; set; }
	}
}
