﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Payment.Application.Fetures.PaymentDestination.Commands
{
    public class CreatePaymentDestination
    {
        public string? DesName { get; set; } = string.Empty;
        public string? DesShortName { get; set; } = string.Empty;
        public string? DesParentId { get; set; } = string.Empty;
        public string? DesLogo { get; set; } = string.Empty;
        public int SortIndex { get; set; }
    }
}
