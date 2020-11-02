using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace Exceptions
{
    public class UnknowException : Exception
    {
        public UnknowException()
        {
        }

        public UnknowException(string message) : base(message)
        {
        }

        public UnknowException(string message, Exception innerException) : base(message, innerException)
        {
        }

        protected UnknowException(SerializationInfo info, StreamingContext context) : base(info, context)
        {
        }
    }
}
