inherited frmBaseCadastro: TfrmBaseCadastro
  Caption = 'Base Cadastro'
  ClientHeight = 502
  ClientWidth = 1233
  PopupMenu = PopupMenuNavegacao
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  ExplicitLeft = 3
  ExplicitTop = 3
  ExplicitWidth = 1245
  ExplicitHeight = 540
  TextHeight = 15
  inherited StatusBar1: TStatusBar
    Top = 483
    Width = 1233
    ExplicitLeft = 0
    ExplicitTop = 474
    ExplicitWidth = 1227
  end
  object PanelControles: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 1227
    Height = 45
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 1221
    object ShapeSeparador: TShape
      Left = 656
      Top = 1
      Width = 6
      Height = 43
      Align = alLeft
      Brush.Color = clBtnFace
      ExplicitLeft = 445
      ExplicitTop = -1
    end
    object ButtonUltimo: TBitBtn
      AlignWithMargins = True
      Left = 1058
      Top = 4
      Width = 125
      Height = 37
      Action = DatasetLast1
      Align = alLeft
      Caption = '&'#218'ltimo'
      TabOrder = 0
    end
    object ButtonInserir: TBitBtn
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 125
      Height = 37
      Action = DatasetInsert1
      Align = alLeft
      Caption = '&Inserir'
      TabOrder = 1
    end
    object ButtonSalvar: TBitBtn
      AlignWithMargins = True
      Left = 397
      Top = 4
      Width = 125
      Height = 37
      Action = DatasetPost1
      Align = alLeft
      Caption = '&Salvar'
      TabOrder = 2
    end
    object ButtonPrimeiro: TBitBtn
      AlignWithMargins = True
      Left = 665
      Top = 4
      Width = 125
      Height = 37
      Action = DatasetFirst1
      Align = alLeft
      Caption = 'Pri&meiro'
      TabOrder = 3
    end
    object ButtonAnterior: TBitBtn
      AlignWithMargins = True
      Left = 796
      Top = 4
      Width = 125
      Height = 37
      Action = DatasetPrior1
      Align = alLeft
      Caption = '&Anterior'
      TabOrder = 4
    end
    object ButtonProximo: TBitBtn
      AlignWithMargins = True
      Left = 927
      Top = 4
      Width = 125
      Height = 37
      Action = DatasetNext1
      Align = alLeft
      Caption = '&Pr'#243'ximo'
      TabOrder = 5
    end
    object ButtonCancelar: TBitBtn
      AlignWithMargins = True
      Left = 266
      Top = 4
      Width = 125
      Height = 37
      Action = DatasetCancel1
      Align = alLeft
      Caption = '&Cancelar'
      TabOrder = 6
    end
    object ButtonEditar: TBitBtn
      AlignWithMargins = True
      Left = 135
      Top = 4
      Width = 125
      Height = 37
      Action = DatasetEdit1
      Align = alLeft
      Caption = '&Editar'
      TabOrder = 7
    end
    object ButtonDeltar: TBitBtn
      AlignWithMargins = True
      Left = 528
      Top = 4
      Width = 125
      Height = 37
      Action = DatasetDelete1
      Align = alLeft
      Caption = '&Deletar'
      TabOrder = 8
    end
  end
  object PageControlCadastro: TPageControl
    Left = 0
    Top = 51
    Width = 1233
    Height = 432
    ActivePage = TabPesquisa
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 1227
    ExplicitHeight = 423
    object TabPesquisa: TTabSheet
      Caption = 'Pesquisa'
      object DBGridCadastro: TDBGrid
        Left = 0
        Top = 0
        Width = 1225
        Height = 402
        Align = alClient
        DataSource = dtsDados
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        PopupMenu = PopupMenuNavegacao
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnDblClick = DBGridCadastroDblClick
        OnTitleClick = DBGridCadastroTitleClick
      end
    end
    object TabCadastro: TTabSheet
      Caption = 'Cadastro'
      ImageIndex = 1
      PopupMenu = PopupMenuNavegacao
    end
  end
  object dtsDados: TDataSource
    OnStateChange = dtsDadosStateChange
    Left = 392
    Top = 240
  end
  object ActionListCadastro: TActionList
    Images = dmdImages.ImageListPrincipal
    Left = 552
    Top = 240
    object DatasetFirst1: TDataSetFirst
      Category = 'Dataset'
      Caption = 'Pri&meiro'
      Hint = 'First'
      ImageIndex = 2
      ShortCut = 16466
      DataSource = dtsDados
    end
    object DatasetPrior1: TDataSetPrior
      Category = 'Dataset'
      Caption = '&Anterior'
      Hint = 'Prior'
      ImageIndex = 3
      DataSource = dtsDados
    end
    object DatasetNext1: TDataSetNext
      Category = 'Dataset'
      Caption = '&Pr'#243'ximo'
      Hint = 'Next'
      ImageIndex = 4
      DataSource = dtsDados
    end
    object DatasetLast1: TDataSetLast
      Category = 'Dataset'
      Caption = '&'#218'ltimo'
      Hint = 'Last'
      ImageIndex = 5
      ShortCut = 16468
      DataSource = dtsDados
    end
    object DatasetInsert1: TDataSetInsert
      Category = 'Dataset'
      Caption = '&Inserir'
      Hint = 'Insert'
      ImageIndex = 6
      DataSource = dtsDados
    end
    object DatasetDelete1: TDataSetDelete
      Category = 'Dataset'
      Caption = '&Deletar'
      Hint = 'Delete'
      ImageIndex = 7
      OnExecute = DatasetDelete1Execute
      DataSource = dtsDados
    end
    object DatasetEdit1: TDataSetEdit
      Category = 'Dataset'
      Caption = '&Editar'
      Hint = 'Edit'
      ImageIndex = 8
      DataSource = dtsDados
    end
    object DatasetPost1: TDataSetPost
      Category = 'Dataset'
      Caption = '&Salvar'
      Hint = 'Post'
      ImageIndex = 9
      DataSource = dtsDados
    end
    object DatasetCancel1: TDataSetCancel
      Category = 'Dataset'
      Caption = '&Cancelar'
      Hint = 'Cancel'
      ImageIndex = 10
      DataSource = dtsDados
    end
    object DatasetRefresh1: TDataSetRefresh
      Category = 'Dataset'
      Caption = '&Atualizar'
      Hint = 'Refresh'
      ImageIndex = 11
      DataSource = dtsDados
    end
    object ActionPesquisar: TAction
      Caption = 'Pesquisar'
      OnExecute = ActionPesquisarExecute
    end
  end
  object TimerOpen: TTimer
    Enabled = False
    OnTimer = TimerOpenTimer
    Left = 684
    Top = 237
  end
  object PopupMenuNavegacao: TPopupMenu
    Left = 544
    Top = 160
    object Inserir1: TMenuItem
      Action = DatasetInsert1
    end
    object Editar1: TMenuItem
      Action = DatasetEdit1
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Primeiro1: TMenuItem
      Action = DatasetFirst1
    end
    object ltimo1: TMenuItem
      Action = DatasetLast1
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object Deletar1: TMenuItem
      Action = DatasetDelete1
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object Pesquisar1: TMenuItem
      Action = ActionPesquisar
      ShortCut = 16465
    end
  end
end
