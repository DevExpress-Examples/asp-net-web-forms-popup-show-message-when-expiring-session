Imports Microsoft.VisualBasic
Imports System

Namespace WebApp
	Partial Public Class _Default
		Inherits System.Web.UI.Page
		Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
			TimeoutControl1.TimeOutUrl = "~/TimeOutPage.aspx"
		End Sub
	End Class
End Namespace