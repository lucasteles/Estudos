using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Linq.Expressions;

namespace ExpressionTeste
{
    public class FluentLambda<T>
    {

        protected Expression<Func<T, bool>> expr;

        public FluentLambda()
        {
            Expression<Func<T, bool>> ex =  (e => true);
            expr = ex;
        }
        
        public FluentLambda(Expression<Func<T, bool>> ex)
        {
            Set(ex);
        }

        public FluentLambda<T> Set(Expression<Func<T, bool>> ex)
        {
            expr = ex;
            return this;
        }

        public Expression<Func<T, bool>> Exp()
        {
            return expr;
        }


        private  Expression<T> Compose<T>( Expression<T> first, Expression<T> second, Func<Expression, Expression, Expression> merge,bool negate = false)
        {
            // build parameter map (from parameters of second to parameters of first)
            var map = first.Parameters.Select((f, i) => new { f, s = second.Parameters[i] }).ToDictionary(p => p.s, p => p.f);

            // replace parameters in the second lambda expression with parameters from the first
            var secondBody = ParameterRebinder.ReplaceParameters(map, second.Body);

            if (negate)
                secondBody = Expression.Lambda<T>(Expression.Not(secondBody), first.Parameters).Body;


            // apply composition of lambda expression bodies to parameters from the first expression 
            return Expression.Lambda<T>(merge(first.Body, secondBody), first.Parameters);
        }


        public FluentLambda<T> And(params Expression<Func<T, bool>>[] ands)
        {

            foreach (var item in ands)
            {
                expr = Compose(expr, item, Expression.AndAlso);
            }

            return this;
        }

        
        public FluentLambda<T> Or(params Expression<Func<T, bool>>[] ors)
        {

            foreach (var item in ors)
            {
                expr = Compose(expr, item, Expression.OrElse);
            }

            return this;
        }


        public FluentLambda<T> AndNot(params Expression<Func<T, bool>>[] ands)
        {

            foreach (var item in ands)
            {
                expr = Compose(expr, item, Expression.AndAlso, true);
            }

            return this;
        }

        public FluentLambda<T> OrNot(params Expression<Func<T, bool>>[] ors)
        {

            foreach (var item in ors)
            {
                expr = Compose(expr, item, Expression.OrElse, true);
            }
            
            return this;
        }


    }
}
