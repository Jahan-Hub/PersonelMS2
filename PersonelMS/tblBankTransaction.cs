//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PersonelMS
{
    using System;
    using System.Collections.Generic;
    
    public partial class tblBankTransaction
    {
        public Nullable<int> IdClient { get; set; }
        public int TrackId { get; set; }
        public int TransactionID { get; set; }
        public Nullable<System.DateTime> TransactionDate { get; set; }
        public string TransactionType { get; set; }
        public string Bank { get; set; }
        public Nullable<decimal> Amount { get; set; }
        public Nullable<decimal> Deposit { get; set; }
        public Nullable<decimal> Withdraw { get; set; }
        public string Remarks { get; set; }
        public string ChequeNo { get; set; }
        public Nullable<System.DateTime> ChequeDate { get; set; }
        public string ChequeDetails { get; set; }
        public string UserId { get; set; }
        public Nullable<System.DateTime> Lmdt { get; set; }
    }
}