using System;

namespace WebApp {
    public partial class TimeoutControl : System.Web.UI.UserControl {
        public string TimeOutUrl = "";

        public int PopupShowDelay {
            get { return 60000 * (Session.Timeout - 1); }
        }

        protected string QuotedTimeOutUrl {
            get { return '"' + ResolveClientUrl(TimeOutUrl).Replace("\"", "\\\"") + '"'; }
        }
    }
}