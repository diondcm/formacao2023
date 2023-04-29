object frmClienteConversor: TfrmClienteConversor
  Left = 0
  Top = 0
  Caption = 'Conversor Moeda'
  ClientHeight = 242
  ClientWidth = 380
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object PanelTitulo: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 374
    Height = 41
    Align = alTop
    Caption = 'Conversor Moeda'
    Color = clSkyBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    ExplicitLeft = 256
    ExplicitTop = 168
    ExplicitWidth = 185
  end
  object PanelValorEmReal: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 50
    Width = 374
    Height = 41
    Align = alTop
    Color = clMoneyGreen
    ParentBackground = False
    TabOrder = 1
    ExplicitLeft = 208
    ExplicitTop = 136
    ExplicitWidth = 185
    object Label1: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 181
      Height = 33
      Align = alLeft
      Alignment = taRightJustify
      Caption = 'Valor em Real (R$)'
      Layout = tlCenter
    end
    object EditValorEmReal: TEdit
      AlignWithMargins = True
      Left = 191
      Top = 11
      Width = 121
      Height = 19
      Margins.Top = 10
      Margins.Bottom = 10
      Align = alLeft
      Alignment = taRightJustify
      TabOrder = 0
      OnKeyDown = EditValorEmRealKeyDown
      ExplicitLeft = 119
      ExplicitHeight = 21
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 97
    Width = 374
    Height = 41
    Align = alTop
    Color = clMoneyGreen
    ParentBackground = False
    TabOrder = 2
    ExplicitLeft = 35
    ExplicitTop = 178
    ExplicitWidth = 393
    object Label2: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 181
      Height = 33
      Align = alLeft
      Alignment = taRightJustify
      Caption = 'Valor em Dolar (US$)'
      Layout = tlCenter
    end
    object EditValorEmDolar: TEdit
      AlignWithMargins = True
      Left = 191
      Top = 11
      Width = 121
      Height = 19
      Margins.Top = 10
      Margins.Bottom = 10
      Align = alLeft
      TabOrder = 0
      OnKeyDown = EditValorEmDolarKeyDown
      ExplicitLeft = 233
      ExplicitHeight = 21
    end
  end
  object IdHTTP1: TIdHTTP
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 48
    Top = 168
  end
end
