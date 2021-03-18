using System;

using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using SweetApi.Context;


namespace SweetApi
{
	public class Startup
	{
		public Startup(IConfiguration configuration)
		{
			Configuration = configuration;
	
		}

		public IConfiguration Configuration { get; }

		// This method gets called by the runtime. Use this method to add services to the container.
		public void ConfigureServices(IServiceCollection services)
		{
			services.AddControllers();
			services.AddDbContextPool<SweetContext>
		(options => options.UseSqlServer(Configuration.GetConnectionString("SweetDbConnection")));
			services.AddSpaStaticFiles(configuration => {
				configuration.RootPath = "FrontEnd/dist";
			});
		}

		// This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
		public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
		{
			if (env.IsDevelopment())
			{
				app.UseDeveloperExceptionPage();
			}

			app.UseCors(builder => builder
			  .AllowAnyHeader()
			  .AllowAnyMethod()
			  .SetIsOriginAllowed((host) => true)
			  .AllowCredentials()
			  );
			app.UseHttpsRedirection();
			app.UseRouting();
			app.UseAuthorization();

			app.UseEndpoints(endpoints =>
			{
				endpoints.MapControllers();
			});

			app.UseSpaStaticFiles();
			app.UseSpa(spa =>
			{
				spa.Options.SourcePath = "FrontEnd";
			});

		}
	}
}
