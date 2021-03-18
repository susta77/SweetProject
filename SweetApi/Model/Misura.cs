using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SweetApi.Model
{
	public class Misura
	{
		[Key]
		public int PK_Misura { get; set; }	
		public string Descrizione { get; set; }
	}
}
