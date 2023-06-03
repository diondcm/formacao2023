object frmCriticalSection: TfrmCriticalSection
  Left = 0
  Top = 0
  Caption = 'Critical Section'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 628
    Height = 65
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 622
    object ButtonPrimos: TButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 120
      Height = 57
      Align = alLeft
      Caption = 'Gera Lista Primos'
      TabOrder = 0
      OnClick = ButtonPrimosClick
    end
  end
  object MemoPrimos: TMemo
    AlignWithMargins = True
    Left = 3
    Top = 68
    Width = 622
    Height = 371
    Align = alClient
    Color = clMoneyGreen
    TabOrder = 1
    ExplicitWidth = 616
    ExplicitHeight = 362
  end
  object TimerListaNumeros: TTimer
    Interval = 3000
    OnTimer = TimerListaNumerosTimer
    Left = 304
    Top = 224
  end
end
