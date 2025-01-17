﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Payment.Domain.Entities
{
    public class PaymentNotification
    {
        public string Id { get; set; } = string.Empty;
        public string PaymentRefId { get; set; } = string.Empty;
        public DateTime? Date { get; set; }
        public string? NotiContent { get; set; } = string.Empty;
        public string? NotiAmount { get; set; } = string.Empty;
        public string? NotiMessage { get; set; } = string.Empty;
        public string? NotiSignature { get; set; } = string.Empty;
        public string? NotiPaymentId { get; set; } = string.Empty;
        public string? NotiMerchantId { get; set; } = string.Empty;
        public string? NotiStatus { get; set; } = string.Empty;
        public DateTime? NotiResDate { get; set; }
        public string? NotiResMassage { get; set; } = string.Empty;
        public string? NotiResHttpCode { get; set; } = string.Empty;


    }
}
