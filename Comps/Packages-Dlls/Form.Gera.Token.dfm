object frmGeraToken: TfrmGeraToken
  Left = 0
  Top = 0
  Caption = 'Gera'#231#227'o de Token'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  TextHeight = 15
  object PanelControles: TPanel
    Left = 0
    Top = 0
    Width = 628
    Height = 41
    Align = alTop
    TabOrder = 0
    ExplicitLeft = 248
    ExplicitTop = 128
    ExplicitWidth = 185
    object ButtonToken: TButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 101
      Height = 33
      Align = alLeft
      Caption = 'Gerar Token'
      TabOrder = 0
      OnClick = ButtonTokenClick
    end
  end
  object MemoLog: TMemo
    AlignWithMargins = True
    Left = 3
    Top = 44
    Width = 622
    Height = 395
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 232
    ExplicitTop = 200
    ExplicitWidth = 185
    ExplicitHeight = 89
  end
end
