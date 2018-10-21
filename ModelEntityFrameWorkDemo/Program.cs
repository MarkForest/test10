using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ModelEntityFrameWorkDemo
{
    class Program
    {
        static void Main(string[] args)
        {
            //Author author = new Author { FirstName = "Isaac", LastName = "Azimov" };
            //Author author2 = new Author { FirstName = "Bubon", LastName = "Bubonovich" };
            //Author author3 = new Author { FirstName = "Bubon", LastName = "Bubonsky" };
            //Author author4 = new Author { FirstName = "Bubon", LastName = "Bubini" };
            //using(LibraryContext db = new LibraryContext())
            //{
            //    db.AuthorSet.Add(author);
            //    db.AuthorSet.Add(author2);
            //    db.AuthorSet.Add(author3);
            //    db.AuthorSet.Add(author4);
            //    db.SaveChanges();
            //}
            using (LibraryContext db = new LibraryContext())
            {
                Book book = db.BookSet.Where(b => b.Title == "Унисеные ветром").FirstOrDefault();
                book.Author.Add(db.AuthorSet.FirstOrDefault(a=>a.LastName == "Azimov"));
                book.Author.Add(db.AuthorSet.FirstOrDefault(a=>a.LastName == "Bubini"));
                
                db.SaveChanges();
            }
        }
    }
}
