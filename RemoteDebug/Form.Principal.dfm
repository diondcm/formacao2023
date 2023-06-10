object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Remote Debug'
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
  object PanelControles: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 622
    Height = 41
    Align = alTop
    Color = clActiveCaption
    ParentBackground = False
    TabOrder = 0
    ExplicitLeft = 232
    ExplicitTop = 224
    ExplicitWidth = 185
    object ButtonLoop: TButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 189
      Height = 33
      Align = alLeft
      Caption = 'Loop Com Bug'
      TabOrder = 0
      OnClick = ButtonLoopClick
    end
  end
end
