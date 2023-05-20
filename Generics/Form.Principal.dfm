object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Generics'
  ClientHeight = 529
  ClientWidth = 656
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
  object Splitter1: TSplitter
    Left = 458
    Top = 47
    Height = 482
    Align = alRight
    ExplicitLeft = 336
    ExplicitTop = 232
    ExplicitHeight = 100
  end
  object PanelControles: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 650
    Height = 41
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 644
    object ColorBoxSel: TColorBox
      AlignWithMargins = True
      Left = 4
      Top = 9
      Width = 145
      Height = 22
      Margins.Top = 8
      Align = alLeft
      DefaultColorColor = clDefault
      TabOrder = 0
      ExplicitLeft = 14
      ExplicitTop = 10
    end
    object ButtonAdd: TButton
      AlignWithMargins = True
      Left = 239
      Top = 4
      Width = 23
      Height = 33
      Align = alLeft
      Caption = '+'
      TabOrder = 1
      OnClick = ButtonAddClick
      ExplicitLeft = 347
      ExplicitTop = 8
    end
    object EditNome: TEdit
      AlignWithMargins = True
      Left = 155
      Top = 9
      Width = 78
      Height = 23
      Margins.Top = 8
      Margins.Bottom = 8
      Align = alLeft
      TabOrder = 2
      OnKeyDown = EditNomeKeyDown
    end
    object ButtonArray: TButton
      Left = 544
      Top = 8
      Width = 91
      Height = 25
      Caption = 'Arrays'
      TabOrder = 3
      OnClick = ButtonArrayClick
    end
  end
  object PanelCor: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 50
    Width = 452
    Height = 476
    Align = alClient
    Color = clAqua
    ParentBackground = False
    TabOrder = 1
    StyleElements = [seFont, seBorder]
  end
  object ListBoxCores: TListBox
    AlignWithMargins = True
    Left = 464
    Top = 50
    Width = 189
    Height = 476
    Align = alRight
    ItemHeight = 15
    TabOrder = 2
    OnClick = ListBoxCoresClick
  end
end
