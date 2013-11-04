using System;
using System.Collections.Generic;
using System.Data;
using System.Data.EntityClient;
using System.Linq;
using System.Web;

namespace com.Encore.Web
{
    public class EntityExtensions
    {
        public static void ExecuteProcedure(EntityConnection ctx, 
            string storedProcedureName,
            params KeyValuePair<string, object>[] arguments)
        {

            using (EntityCommand command = ctx.CreateCommand())
            {
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = storedProcedureName;
                foreach (var argument in arguments)
                {
                    command.Parameters.AddWithValue(argument.Key, argument.Value);
                }
                ctx.Open();
                command.ExecuteNonQuery();
                ctx.Close();
            }

        }
    }
}