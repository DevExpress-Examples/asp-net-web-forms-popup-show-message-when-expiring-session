Imports System

Namespace WebApp

    Public Partial Class _Default
        Inherits Web.UI.Page

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
            TimeoutControl1.TimeOutUrl = "~/TimeOutPage.aspx"
        End Sub
    End Class
End Namespace
