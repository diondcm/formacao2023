object frmBaseCadastro: TfrmBaseCadastro
  Left = 0
  Top = 0
  Caption = 'Base Cadastro'
  ClientHeight = 462
  ClientWidth = 973
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object PanelControles: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 967
    Height = 45
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 776
    object ShapeSeparador: TShape
      Left = 263
      Top = 1
      Width = 6
      Height = 43
      Align = alLeft
      Brush.Color = clBtnFace
      ExplicitLeft = 445
      ExplicitTop = -1
    end
    object BitBtn1: TBitBtn
      AlignWithMargins = True
      Left = 665
      Top = 4
      Width = 125
      Height = 37
      Action = DatasetLast1
      Align = alLeft
      Caption = '&'#218'ltimo'
      TabOrder = 0
      ExplicitLeft = 748
      ExplicitTop = 0
    end
    object BitBtn2: TBitBtn
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 125
      Height = 37
      Action = DatasetInsert1
      Align = alLeft
      Caption = '&Inserir'
      TabOrder = 1
      ExplicitLeft = 308
    end
    object BitBtn3: TBitBtn
      AlignWithMargins = True
      Left = 135
      Top = 4
      Width = 125
      Height = 37
      Action = DatasetPost1
      Align = alLeft
      Caption = '&Salvar'
      TabOrder = 2
      ExplicitLeft = 414
    end
    object BitBtn4: TBitBtn
      AlignWithMargins = True
      Left = 272
      Top = 4
      Width = 125
      Height = 37
      Action = DatasetFirst1
      Align = alLeft
      Caption = '&Primeiro'
      TabOrder = 3
      ExplicitLeft = 520
    end
    object BitBtn5: TBitBtn
      AlignWithMargins = True
      Left = 403
      Top = 4
      Width = 125
      Height = 37
      Action = DatasetPrior1
      Align = alLeft
      Caption = '&Anterior'
      TabOrder = 4
      ExplicitLeft = 651
    end
    object BitBtn6: TBitBtn
      AlignWithMargins = True
      Left = 534
      Top = 4
      Width = 125
      Height = 37
      Action = DatasetNext1
      Align = alLeft
      Caption = '&Pr'#243'ximo'
      TabOrder = 5
      ExplicitLeft = 757
    end
  end
  object PageControlCadastro: TPageControl
    Left = 0
    Top = 51
    Width = 973
    Height = 411
    ActivePage = TabPesquisa
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 806
    object TabPesquisa: TTabSheet
      Caption = 'Pesquisa'
      object DBGridCadastro: TDBGrid
        Left = 0
        Top = 0
        Width = 965
        Height = 381
        Align = alClient
        DataSource = dtsDados
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
    end
    object TabCadastro: TTabSheet
      Caption = 'Cadastro'
      ImageIndex = 1
    end
  end
  object dtsDados: TDataSource
    Left = 392
    Top = 240
  end
  object ActionListCadastro: TActionList
    Images = dmdImages.ImageListPrincipal
    Left = 552
    Top = 240
    object DatasetFirst1: TDataSetFirst
      Category = 'Dataset'
      Caption = '&First'
      Hint = 'First'
      ImageIndex = 2
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
  end
end
