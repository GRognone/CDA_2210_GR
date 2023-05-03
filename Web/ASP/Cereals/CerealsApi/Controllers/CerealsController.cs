using CerealsApi.Db;
using CerealsApi.Models;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace CerealsApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CerealsController : ControllerBase 
    {
        CerealsDbContext context;

        Repository<Model> repository;

        public CerealsController() : base()
        {
            context = new(); // ou new CerealsDbContext();

            repository = new Repository<Model>(context);
            repository.Get();
        }

        // GET: api/<CerealsController>
        [HttpGet]
        public IEnumerable<Cereal> Get()
        {
            return (IEnumerable<Cereal>) repository.Get();
        }

        // GET api/<CerealsController>/5
        [HttpGet("{id}")]
        public Cereal? Get(int id)
        {
            /*foreach(Cereal c in context.Cereals)
            {
                if(c.CerealId == id)
                {
                    return c;
                }
            }
            return null;*/

            return context.Cereals.FirstOrDefault(c => c.CerealId == id);

        }
        //public Cereal Get(int id) => context.Cereals.Single(c => c.CerealId == id);

        // POST api/<CerealsController>
        [HttpPost]
        public void Post([FromBody] Cereal value)
        {
            context.Cereals.Add(value);
            context.SaveChanges();
        }

        // PUT api/<CerealsController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] Cereal value)
        {
            if (this.Get(id) is Cereal cereal && value.CerealId == cereal.CerealId)
            {
                cereal.Name = value.Name;
                cereal.Calories = value.Calories;
                cereal.Protein = value.Protein;
                // context.Cereals.Update(cereal);
                context.SaveChanges();
            }
        }

        // DELETE api/<CerealsController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            if (this.Get(id) is Cereal cereal)
            {
                context.Cereals.Remove(cereal);
                context.SaveChanges();
            }
        }
    }
}
