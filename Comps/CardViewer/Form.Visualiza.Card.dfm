object frmVisualizaCard: TfrmVisualizaCard
  Left = 0
  Top = 0
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnKeyDown = FormKeyDown
  TextHeight = 15
  object ImagePreview: TImage
    AlignWithMargins = True
    Left = 3
    Top = 39
    Width = 622
    Height = 400
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
    Width = 622
    Height = 30
    Align = alTop
    Color = clSkyBlue
    ParentBackground = False
    TabOrder = 0
    object CheckBoxProportional: TCheckBox
      Left = 11
      Top = 7
      Width = 97
      Height = 17
      Caption = 'Proportional'
      TabOrder = 0
      OnClick = CheckBoxProportionalClick
    end
    object CheckBoxStretch: TCheckBox
      Left = 104
      Top = 7
      Width = 97
      Height = 17
      Caption = 'Stretch'
      TabOrder = 1
      OnClick = CheckBoxStretchClick
    end
  end
end
