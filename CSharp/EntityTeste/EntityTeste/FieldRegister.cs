using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Linq.Expressions;
using System.Reflection;
using System.ComponentModel;


namespace EntityTeste
{
    public class FieldRegister<T> : IFieldRegister<T> where T : class, IModel, new()
    {
        private T Model;

        private IList<Tuple<Expression<Func<T, object>>, Control>> controls;

        /// <summary>
        /// registra campos
        /// </summary>
        public FieldRegister()
        {
            Model = new T();
            controls = new List<Tuple<Expression<Func<T, object>>, Control>>();
        }

        public IFieldRegister<T> Register(Expression<Func<T, object>> fieldModel, Control control)
        {
            getInfo(fieldModel); // valida lambda

            
            var valuePair = new Tuple<Expression<Func<T, object>>, Control>(fieldModel, control);
            controls.Add(valuePair);

            return this;
        }


        private void fillModel()
        {

            foreach (var item in controls)
            {
                var info = getInfo(item.Item1);
                object value = null;

                var control = item.Item2;

                if (control is TextBoxBase)
                     value = ((TextBoxBase) item.Item2).Text;
                else if (control is ComboBox)
                     value = ((ComboBox)item.Item2).SelectedValue;
                else if (control is CheckBox)
                    value = ((CheckBox)item.Item2).Checked ? 1 : 0;

                Type convType = Model.GetType().GetProperty(info.Name).PropertyType;

                if (Nullable.GetUnderlyingType(convType) != null)
                    convType = Nullable.GetUnderlyingType(convType);


                if (!value.ToString().Equals(""))
                {
                    if ((new List<Type>() { typeof(decimal), typeof(double), typeof(float) }).Contains(convType))
                    {
                        value = Convert.ToDecimal(value);
                    }


                    if (convType == typeof(DateTime))
                        value = Convert.ToDateTime(value);

                    if (convType == typeof(int))
                        value = Convert.ToInt32(value);

                    Model.GetType().GetProperty(info.Name).SetValue(Model, value, new object[] { });
                }
                else
                {
                     if (convType == typeof(String))
                         Model.GetType().GetProperty(info.Name).SetValue(Model, value, new object[] { });
                }

                
            }
                                     
            
        }



        private void fillControls()
        {
            foreach (var item in controls)
            {
                var info = getInfo(item.Item1);
                
                object value = 
                    Model.GetType().GetProperty(info.Name).GetValue(Model, new object[] { });

                var control = item.Item2;

                if (control is TextBoxBase)
                   ((TextBoxBase)item.Item2).Text = value.ToString();
                else if (control is ComboBox)
                   ((ComboBox)item.Item2).SelectedValue = value;
                else if (control is CheckBox)
                    ((CheckBox)item.Item2).Checked  =  (int)value==1;


                
            }
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

       

        public T getModel()
        {
            fillModel();
            return Model;
        }

        public IFieldRegister<T> setModel(T model) 
        {
            Model = model;

            fillControls();

            return this;
        }

    }
}
