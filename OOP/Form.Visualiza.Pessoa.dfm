object frmVisualizaPessoa: TfrmVisualizaPessoa
  Left = 0
  Top = 0
  Caption = 'Visualiza Pessoa'
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
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object ListBoxPessoas: TListBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 182
    Height = 436
    Align = alLeft
    Color = clMenu
    ItemHeight = 15
    TabOrder = 0
    OnClick = ListBoxPessoasClick
  end
  object MemoPessoa: TMemo
    AlignWithMargins = True
    Left = 191
    Top = 3
    Width = 434
    Height = 436
    Align = alClient
    Color = clScrollBar
    TabOrder = 1
    ExplicitLeft = 232
    ExplicitTop = 200
    ExplicitWidth = 185
    ExplicitHeight = 89
  end
end
