using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace Vivo.PositivacaoMapas
{

   public class ModelSqlBuilder<T>
    {
        private string _condition;
        public string TableName { get; }
        public IList<string> Fields { get; }
        public string Condition { get { return _condition; }  }

        public IList<string> Orders { get; }

        public ModelSqlBuilder()
        {
            var type = typeof(T);
            _condition = string.Empty;
            Orders = new List<string>();

            var TableAtt = GetAttributeFrom<TableAttribute>(type);

            if (TableAtt != null)
                TableName = TableAtt.Name;
            else
                TableName = nameof(T);

            var props = type.GetProperties().ToList();

            Fields = new List<string>();

            foreach (var item in props)
            {

                if (item.GetGetMethod().IsVirtual && (item.PropertyType.IsGenericType && item.PropertyType.GetGenericTypeDefinition() == typeof(ICollection<>)))
                    continue;

                var propAtt = GetAttributeFrom<ColumnAttribute>(type, item.Name);

                if (propAtt != null)
                    Fields.Add(propAtt.Name);
                else
                    Fields.Add(item.Name);

            }


        }
        
        private string BaseQuery()
        {
            var ret = $"SELECT \n{string.Join(",\n", Fields)} \nFROM {TableName}";

            if (Condition != string.Empty)
                ret += " WHERE " + Condition;

            return ret;
        }

        public string BuildQuery()
        {
            var ret = BaseQuery();

            if (Orders.Count() > 0)
            {
                var order = string.Join(",", Orders);
                ret += $" ORDER BY {order}";
            }

            return ret;
        }

        public string BuildQueryWithPagination(int page, int offset)
        {
            var select = BaseQuery();

            select = select
           //.ToUpper()
           .Replace(
               "SELECT ",
               "SELECT ROW_NUMBER() OVER (ORDER BY (@@ROWCOUNT) ) AS RowNum, \n"
           );

            string template = $@"WITH CTE AS ({select}) SELECT * FROM CTE WHERE RowNum BETWEEN ({page} - 1) * {offset}+ 1
                             AND {page *  offset}
                            ";

            if (Orders.Count() > 0)
            {
                var order = string.Join(",", Orders);
                template = template.Replace("(@@ROWCOUNT)", order);
            }

            return template;
        }

        public void ClearOrder(Expression<Func<T, bool>> cond)
        {
            Orders.Clear();
        }

        public void AddOrder(Expression<Func<T, object>> cond, OrderOrientation order = OrderOrientation.Asc)
        {
            var propInfo = getInfo(cond);

            var propAtt = GetAttributeFrom<ColumnAttribute>(typeof(T), propInfo.Name);

            var field = string.Empty;

            if (propAtt != null)
                field = propAtt.Name;
            else
                field = propInfo.Name;

            if (order == OrderOrientation.Desc)
                field += " DESC";


            Orders.Add(field);

        }

        public void AddOrder(OrderCollection<T> orders)
        {
            foreach (var item in orders)
            {
                AddOrder(item.Key, item.Value);
            }
        }


        public void Where(Expression<Func<T,bool>> cond)
        {
            _condition = ToMSSqlString(cond);
        }
        


        private AT GetAttributeFrom<AT>(Type type, string propertyName="") where AT : Attribute
        {
            var attrType = typeof(AT);
            IList<object> atts = null;

            if (propertyName != "")
            {
                var property = type.GetProperty(propertyName);
                atts = property.GetCustomAttributes(attrType, false).ToList();
            }
            else
            {
                atts = type.GetCustomAttributes(attrType, false).ToList();
            }

            if (atts.Count > 0)
                return (AT)atts.FirstOrDefault();

            return null;
        }

        private string ToMSSqlString(Expression expression)
        {

            var binaryOperations = new Dictionary<ExpressionType, string> {
                {ExpressionType.Add, "+" },
                {ExpressionType.Subtract , "-"},
                {ExpressionType.Multiply , "*"},
                {ExpressionType.Divide , "/"},
                {ExpressionType.GreaterThan , ">"},
                {ExpressionType.LessThan , "<"},
                {ExpressionType.GreaterThanOrEqual , ">="},
                {ExpressionType.LessThanOrEqual , "<="},
                {ExpressionType.Equal , "="},
                {ExpressionType.AndAlso , "AND"},
                {ExpressionType.OrElse , "OR"}

            };

            if (binaryOperations.ContainsKey(expression.NodeType))
            {
                var exp = expression as BinaryExpression;
                return ToMSSqlString(exp.Left) + " " + binaryOperations[expression.NodeType] + " " + ToMSSqlString(exp.Right);

            }
            else
                switch (expression.NodeType)
                {

                    case ExpressionType.Constant:
                        var constant = expression as ConstantExpression;
                        if (constant.Type == typeof(string))
                            return "N'" + constant.Value.ToString().Replace("'", "''") + "'";
                        if (constant.Type == typeof(DateTime))
                        {
                            var data = (DateTime)constant.Value;
                            return $"N'{data.Year.ToString("D4")}{data.Month.ToString("D2")}{data.Day.ToString("D2")}'";
                        }

                        return constant.Value.ToString();

                    case ExpressionType.Coalesce:
                        var exp = expression as BinaryExpression;
                        return $"COALESCE({ToMSSqlString(exp.Left)},'{ToMSSqlString(exp.Right)}')";

                    case ExpressionType.Lambda:
                        var l = expression as LambdaExpression;
                        return ToMSSqlString(l.Body);

                    case ExpressionType.MemberAccess:
                        var memberaccess = expression as MemberExpression;

                        var attributes = memberaccess.Member.GetCustomAttributes(typeof(ColumnAttribute), true);

                        string name;
                        if (attributes.Count() == 0)
                            name = memberaccess.Member.Name;
                        else
                            name = ((ColumnAttribute)attributes[0]).Name;

                        // try eval 
                        try
                        {
                            var val = GetValue(memberaccess);
                            return ToMSSqlString(Expression.Constant(val));
                        }
                        catch {}
                    

                        if (memberaccess.Type == typeof(bool))
                        {
                            return "[" + name + "] = 1";
                        }


                        return "[" + name + "]";


                    case ExpressionType.Call:
                        var call = expression as MethodCallExpression;
                        if (call.Method.Name.ToUpper() == "CONTAINS")
                        {
                            return (call.Object as MemberExpression).Member.Name + " LIKE '%" + call.Arguments[0] + "%'";
                        }
                        if (call.Method.Name.ToUpper() == "STARTSWITH")
                        {
                            return (call.Object as MemberExpression).Member.Name + " LIKE '" + call.Arguments[0] + "%'";
                        }
                        if (call.Method.Name.ToUpper() == "ENDSWITH")
                        {
                            return (call.Object as MemberExpression).Member.Name + " LIKE '%" + call.Arguments[0] + "'";
                        }
                        break;



                }

            throw new NotImplementedException(
                  expression.GetType().ToString() + " " +
                  expression.NodeType.ToString());
        }


        private PropertyInfo getInfo(Expression<Func<T, object>> fieldModel)
        {

            Type type = typeof(T);

            MemberExpression member;


            if (fieldModel.Body is UnaryExpression)
                member = (fieldModel.Body as UnaryExpression).Operand as MemberExpression;
            else
                member = fieldModel.Body as MemberExpression;


            if (member == null)
                throw new ArgumentException(string.Format(
                    "Expression '{0}' refers to a method, not a property.",
                    fieldModel.ToString()));



            PropertyInfo propInfo = member.Member as PropertyInfo;
            if (propInfo == null)
                throw new ArgumentException(string.Format(
                    "Expression '{0}' refers to a field, not a property.",
                    fieldModel.ToString()));


            if (type != propInfo.ReflectedType && !type.IsSubclassOf(propInfo.ReflectedType))
                throw new ArgumentException(string.Format(
                    "Expresion '{0}' refers to a property that is not from type {1}.",
                    fieldModel.ToString(),
                    type));

            return propInfo;
        }

        private object GetValue(MemberExpression member)
        {
            var objectMember = Expression.Convert(member, typeof(object));

            var getterLambda = Expression.Lambda<Func<object>>(objectMember);

            var getter = getterLambda.Compile();

            return getter();
        }

    }

    public enum OrderOrientation
    {
        Asc,
        Desc
    }

    public class OrderCollection<T> : Dictionary<Expression<Func<T, object>>, OrderOrientation>
    {
        public OrderCollection() : base(){}
    }

}
