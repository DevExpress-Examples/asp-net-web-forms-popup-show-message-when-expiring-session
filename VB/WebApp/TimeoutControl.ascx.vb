Imports Microsoft.VisualBasic
Imports System

Namespace WebApp
	Partial Public Class TimeoutControl
		Inherits System.Web.UI.UserControl
		Public TimeOutUrl As String = ""

		Public ReadOnly Property PopupShowDelay() As Integer
			Get
				Return 60000 * (Session.Timeout - 1)
			End Get
		End Property

		Protected ReadOnly Property QuotedTimeOutUrl() As String
			Get
				Return """"c + ResolveClientUrl(TimeOutUrl).Replace("""", "\""") & """"c
			End Get
		End Property
	End Class
End Namespace