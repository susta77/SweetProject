using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SweetApi.Model
{
	public class Auth
	{
		[Key]
		public int pk_user { get; set; }
		public string password { get; set; }
		public string email { get; set; }
		public string token { get; set; }
	}
}
