using PoC.Owin.OData.WebApiApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PoC.Owin.OData.WebApiApp.DataSource
{
    public class DataSources
    {
        private static DataSources instance = null;
        public static DataSources Instance
        {
            get
            {
                if (instance == null)
                    instance = new DataSources();

                return instance;
            }
        }
        public List<Person> People { get; set; }
        public List<Trip> Trips { get; set; }

        private DataSources()
        {
            Reset();
            Initialize();
        }

        public void Reset()
        {
            People = new List<Person>();
            Trips = new List<Trip>();
        }

        public void Initialize()
        {
            Trips.AddRange(
                new List<Trip>()
                {
                    new Trip()
                    {
                        Id = 1,
                        Name = "Trip 1"
                    },
                    new Trip()
                    {
                        Id = 2,
                        Name = "Trip 2"
                    },
                    new Trip()
                    {
                        Id = 3,
                        Name = "Trip 3"
                    },
                    new Trip()
                    {
                        Id = 4,
                        Name = "Trip 4"
                    }
                }
            );

            People.AddRange(
                new List<Person>
                {
                    new Person()
                    {
                        Id = 1,
                        Name = "Angel",
                        Trips = new List<Trip>
                        {
                            Trips[0],
                            Trips[1]
                        }
                    },
                    new Person()
                    {
                        Id = 2,
                        Name = "Clyde",
                        Description = "Contrary to popular belief, Lorem Ipsum is not simply random text.",
                        Trips = new List<Trip>
                        {
                            Trips[2],
                            Trips[3]
                        }
                    },
                    new Person()
                    {
                        Id = 3,
                        Name = "Elaine",
                        Description = "It has roots in a piece of classical Latin literature from 45 BC, making Lorems over 2000 years old."
                    }
                }
            );
        }
    }
}