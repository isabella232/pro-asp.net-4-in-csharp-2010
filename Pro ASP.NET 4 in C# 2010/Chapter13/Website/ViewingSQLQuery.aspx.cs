﻿using System;
using System.Data.Objects;
using System.Linq;
using NorthwindModel;

public partial class ViewingSQLQuery : System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {

        NorthwindEntities db = new NorthwindEntities();

        var result = from c in db.Customers
                     let o = from q in c.Orders
                             where (q.Employee.LastName != "King")
                             select (q)
                     where c.City == "London" && o.Count() > 5
                     select new {
                         Name = c.CompanyName,
                         Contact = c.ContactName,
                         OrderCount = o.Count()
                     };

        Label1.Text = (result as ObjectQuery).ToTraceString();
    }
}