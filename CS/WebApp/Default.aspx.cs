using System;

namespace WebApp {
    public partial class _Default : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            TimeoutControl1.TimeOutUrl = "~/TimeOutPage.aspx";
        }
    }
}