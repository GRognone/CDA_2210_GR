using CerealsApi.Models;
using Microsoft.EntityFrameworkCore;

namespace CerealsApi.Db
{
    public class Repository<T> where T : Model
    {
        private DbContext ctx;

        private DbSet<T> items;


        public Repository(DbContext context)
        {
            ctx = context;
            items = ctx.Set<T>();
        }

        public IEnumerable<T> Get()
        {
            return items.ToList();
        }

        public T? Get(int id)
        {
            return items.FirstOrDefault(item => item.Id == id);
        }

        public bool Update(T value)
        {
            if(Get(value.Id) is T item && item.UpdateFromModel(value))
            {
                ctx.SaveChanges();
                return true;        
            }
            return false;
        }
    }
}
