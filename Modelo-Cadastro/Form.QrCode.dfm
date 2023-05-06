object frmQrCode: TfrmQrCode
  Left = 0
  Top = 0
  Caption = 'Gerar QrCode'
  ClientHeight = 447
  ClientWidth = 630
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object ImageQrCode: TImage
    AlignWithMargins = True
    Left = 3
    Top = 50
    Width = 624
    Height = 394
    Align = alClient
    ExplicitLeft = 272
    ExplicitTop = 192
    ExplicitWidth = 105
    ExplicitHeight = 105
  end
  object PanelControles: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 624
    Height = 41
    Align = alTop
    TabOrder = 0
    ExplicitLeft = 176
    ExplicitTop = 120
    ExplicitWidth = 185
    object EditDados: TEdit
      AlignWithMargins = True
      Left = 4
      Top = 7
      Width = 121
      Height = 27
      Margins.Top = 6
      Margins.Bottom = 6
      Align = alLeft
      TabOrder = 0
      ExplicitLeft = 304
      ExplicitTop = 24
      ExplicitHeight = 23
    end
    object ButtonGerarQrCode: TButton
      AlignWithMargins = True
      Left = 131
      Top = 4
      Width = 118
      Height = 33
      Align = alLeft
      Caption = 'Gerar'
      Default = True
      TabOrder = 1
      OnClick = ButtonGerarQrCodeClick
    end
  end
end
