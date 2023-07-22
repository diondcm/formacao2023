object frmDestino: TfrmDestino
  Left = 0
  Top = 0
  Caption = 'Destino'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object PanelMov: TPanel
    Left = 8
    Top = 8
    Width = 233
    Height = 161
    Color = clSkyBlue
    ParentBackground = False
    TabOrder = 0
    OnMouseDown = PanelMovMouseDown
  end
  object PanelSize: TPanel
    Left = 387
    Top = 273
    Width = 233
    Height = 161
    Color = clMoneyGreen
    ParentBackground = False
    TabOrder = 1
    OnMouseDown = PanelSizeMouseDown
  end
end
