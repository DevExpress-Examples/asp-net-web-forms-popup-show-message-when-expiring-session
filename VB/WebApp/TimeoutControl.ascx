<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TimeoutControl.ascx.cs"
    Inherits="WebApp.TimeoutControl" %>
<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>




<script type="text/javascript">
    window.SessionTimeout = (function() {
        var _timeLeft, _popupTimer, _countDownTimer;

        var stopTimers = function() {
            window.clearTimeout(_popupTimer);
            window.clearTimeout(_countDownTimer);
        };

        var updateCountDown = function() {
            var min = Math.floor(_timeLeft / 60);
            var sec = _timeLeft % 60;
            if(sec < 10)
                sec = "0" + sec;

            document.getElementById("CountDownHolder").innerHTML = min + ":" + sec;

            if(_timeLeft > 0) {
                _timeLeft--;
                _countDownTimer = window.setTimeout(updateCountDown, 1000);
            } else  {
                window.location = <%= QuotedTimeOutUrl %>;
            }            
        };

        var showPopup = function() {
            _timeLeft = 60;
            updateCountDown();
            ClientTimeoutPopup.Show();
        };

        var schedulePopup = function() {       
            stopTimers();
            _popupTimer = window.setTimeout(showPopup, <%= PopupShowDelay %>);
        };

        var sendKeepAlive = function() {
            stopTimers();
            ClientTimeoutPopup.Hide();
            ClientKeepAliveHelper.PerformCallback();
        };

        return {
            schedulePopup: schedulePopup,
            sendKeepAlive: sendKeepAlive
        };

    })();    
</script>

<dx:ASPxPopupControl runat="server" ID="TimeoutPopup" ClientInstanceName="ClientTimeoutPopup"
    CloseAction="None" HeaderText="Session Expiring" Modal="True" PopupHorizontalAlign="WindowCenter"
    PopupVerticalAlign="WindowCenter" ShowCloseButton="False" Width="250px" ShowFooter="true"
    AllowDragging="true">
    <ContentCollection>
        <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server" SupportsDisabledAttribute="True">
            Your session is about to expire!
            <br />
            <br />
            <span id="CountDownHolder"></span>
            <br />
            <br />
            Click OK to continue your session.
        </dx:PopupControlContentControl>
    </ContentCollection>
    <FooterTemplate>
        <dx:ASPxButton runat="server" ID="OkButton" Text="OK" AutoPostBack="false">
            <ClientSideEvents Click="SessionTimeout.sendKeepAlive" />
        </dx:ASPxButton>
    </FooterTemplate>
    <FooterStyle>
        <Paddings Padding="5" />
    </FooterStyle>
</dx:ASPxPopupControl>
<dx:ASPxGlobalEvents runat="server" ID="GlobalEvents">
    <ClientSideEvents ControlsInitialized="SessionTimeout.schedulePopup" />
</dx:ASPxGlobalEvents>
<dx:ASPxCallback runat="server" ID="KeepAliveHelper" ClientInstanceName="ClientKeepAliveHelper">
</dx:ASPxCallback>