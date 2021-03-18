using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SweetApi.Model
{
    public class Dolce
    {
        [Key]
        public int Pk_Dolce { get; set; }

        public string Nome { get; set; }

        public string Descrizione { get; set; }

        public DateTime Data { get; set; }
        public decimal Prezzo { get; set; }

    }
}
