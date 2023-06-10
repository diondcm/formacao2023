object frmPesquisa: TfrmPesquisa
  Left = 0
  Top = 0
  Caption = 'Pesquisar'
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
  object PanelPesquisar: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 622
    Height = 41
    Align = alTop
    BevelOuter = bvSpace
    TabOrder = 0
    ExplicitWidth = 616
    object EditPesquisar: TButtonedEdit
      AlignWithMargins = True
      Left = 4
      Top = 8
      Width = 614
      Height = 25
      Margins.Top = 7
      Margins.Bottom = 7
      Align = alClient
      Images = dmdImages.ImageListPrincipal
      RightButton.ImageIndex = 0
      RightButton.Visible = True
      TabOrder = 0
      TextHint = 'Pesquisar...'
      OnKeyDown = EditPesquisarKeyDown
      OnRightButtonClick = EditPesquisarRightButtonClick
      ExplicitWidth = 608
      ExplicitHeight = 23
    end
  end
  object DBGridPesquisa: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 50
    Width = 622
    Height = 323
    Align = alClient
    DataSource = dtsPesquisa
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object PanelControles: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 398
    Width = 622
    Height = 41
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 389
    ExplicitWidth = 616
    object ButtonCancelar: TBitBtn
      AlignWithMargins = True
      Left = 512
      Top = 4
      Width = 106
      Height = 33
      Align = alRight
      Caption = 'Cancelar'
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 0
      ExplicitLeft = 506
    end
    object ButtonSelecionar: TBitBtn
      AlignWithMargins = True
      Left = 400
      Top = 4
      Width = 106
      Height = 33
      Align = alRight
      Caption = 'Selecionar'
      ModalResult = 1
      NumGlyphs = 2
      TabOrder = 1
      OnClick = ButtonSelecionarClick
      ExplicitLeft = 394
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 376
    Width = 628
    Height = 19
    Panels = <
      item
        Width = 150
      end
      item
        Width = 200
      end
      item
        Width = 50
      end>
    ExplicitTop = 367
    ExplicitWidth = 622
  end
  object dtsPesquisa: TDataSource
    OnStateChange = dtsPesquisaStateChange
    Left = 512
    Top = 136
  end
end
