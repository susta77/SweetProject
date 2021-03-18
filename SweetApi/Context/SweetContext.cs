using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using SweetApi;
using SweetApi.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SweetApi.Context
{
	public class SweetContext : DbContext
	{
		public SweetContext(DbContextOptions<SweetContext> options) : 
			base(options)
		{
		}
		public DbSet<Vetrina> Vetrina { get; set; }
		public DbSet<Dolce> Dolce { get; set; }
		public DbSet<Ricetta> Ricetta { get; set; }
		public DbSet<Ingrediente> Ingrediente { get; set; }
		public DbSet<Misura> Misura { get; set; }

		public DbSet<Auth> Auth { get; set; }

	}
}
