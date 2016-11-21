using Queries.Persistence;
using System.Linq;

namespace Queries
{
    class Program
    {
        static void Main(string[] args)
        {
            using (var unitOfWork = new UnitOfWork(new PlutoContext()))
            {
                // Example1
                var course = unitOfWork.Courses.Get(1);

                // Example2
                var courses = unitOfWork.Courses.GetCoursesWithAuthors(1, 4);
                var blá = unitOfWork.Courses.GetTopSellingCourses(10);


                var xx = from x in unitOfWork.Authors.entity
                         join prod in unitOfWork.Courses.entity on x.Id equals prod.Level into grp
                         select new { couseName = x.Name, Cpurse = grp};

                var xxl = xx.ToList();




                // Example3
                var author = unitOfWork.Authors.GetAuthorWithCourses(2);
                //unitOfWork.Courses.RemoveRange(author.Courses);
                //unitOfWork.Authors.Remove(author);

                author.Name = "Lucas Teles";


                unitOfWork.Complete();
            }
        }
    }
}
  