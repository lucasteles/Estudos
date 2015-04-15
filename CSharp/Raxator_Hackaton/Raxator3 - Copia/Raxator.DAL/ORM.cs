using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Raxator.DAL
{
    public class ORM
    {

        public FormatProperty[] GetProperties(Type tpObject)
        {
            FormatProperty[] formatProperties = null;

            if (tpObject != null)
            {
                var properties = tpObject.GetProperties();

                if (properties != null
                    && properties.Length > 0)
                {
                    formatProperties = new FormatProperty[properties.Length];
                    for (int i = 0; i < formatProperties.Length; i++)
                    {
                        IList<ColumnAttribute> attribute = properties[i]
                            .GetCustomAttributes(typeof(ColumnAttribute), false)
                            .Cast<ColumnAttribute>()
                            .ToList();

                        formatProperties[i] = new FormatProperty
                        {
                            ColumnName =
                                attribute != null
                                && attribute.Count() > 0
                                ? attribute[0].Name
                                : properties[i].Name,
                            PropertyName = properties[i].Name
                        };
                    }
                }
            }

            return formatProperties;
        }

        public List<TNewModel> GetModel<TNewModel>(IDataReader reader, FormatProperty[] properties)
            where TNewModel : class
        {
            var list = new List<TNewModel>();

            if (reader != null && !reader.IsClosed)
            {
                TNewModel domain = Activator.CreateInstance<TNewModel>();
                Type domainType = domain.GetType();

                int countFields = reader.FieldCount;
                List<string> columnNames = new List<string>();

                for (int i = 0; i < countFields; i++)
                {
                    columnNames.Add(reader.GetName(i));
                }

                while (reader.Read())
                {
                    domain = Activator.CreateInstance<TNewModel>();

                    foreach (var prop in properties)
                        if (columnNames.Contains(prop.ColumnName) && reader[prop.ColumnName] != DBNull.Value)
                            domainType.GetProperty(prop.PropertyName).SetValue(domain, reader[prop.ColumnName], null);

                    list.Add(domain);
                }
            }

            if (!reader.IsClosed)
                reader.Close();

            return list;
        }
    }

    public class FormatProperty
    {
        public string ColumnName { get; set; }

        public string PropertyName { get; set; }
    }
}
