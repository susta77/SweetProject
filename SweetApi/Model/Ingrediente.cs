using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SweetApi.Model
{
	public class Ingrediente
	{
		[Key]
		public int Pk_ingrediente {get;set;}
		public string Nome { get; set; }
	}
}
