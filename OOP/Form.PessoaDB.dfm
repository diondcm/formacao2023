object frmPessoaDB: TfrmPessoaDB
  Left = 0
  Top = 0
  Caption = 'Pesssoa DB'
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
  object DBCtrlGrid1: TDBCtrlGrid
    AlignWithMargins = True
    Left = 3
    Top = 50
    Width = 622
    Height = 370
    Align = alClient
    DataSource = dtsPessoa
    PanelHeight = 74
    PanelWidth = 601
    TabOrder = 0
    RowCount = 5
    ExplicitHeight = 485
    object DBText1: TDBText
      Left = 15
      Top = 7
      Width = 65
      Height = 17
      DataField = 'Nome'
      DataSource = dtsPessoa
    end
    object DBText2: TDBText
      Left = 15
      Top = 22
      Width = 65
      Height = 17
      DataField = 'Documento'
      DataSource = dtsPessoa
    end
    object DBEdit1: TDBEdit
      Left = 15
      Top = 45
      Width = 121
      Height = 23
      DataField = 'DataNascimento'
      DataSource = dtsPessoa
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 152
      Top = 45
      Width = 121
      Height = 23
      DataField = 'Saldo'
      DataSource = dtsPessoa
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 423
      Top = 13
      Width = 121
      Height = 23
      DataField = 'TipoPessoa'
      DataSource = dtsPessoa
      TabOrder = 2
    end
  end
  object PanelControles: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 622
    Height = 41
    Align = alTop
    TabOrder = 1
    ExplicitLeft = 224
    ExplicitTop = 32
    ExplicitWidth = 185
    object ButtonCriaPessoa: TButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 101
      Height = 33
      Align = alLeft
      Caption = 'Cria Pessoas'
      TabOrder = 0
      OnClick = ButtonCriaPessoaClick
    end
    object SpinEditPessoa: TSpinEdit
      Left = 120
      Top = 9
      Width = 65
      Height = 24
      MaxValue = 0
      MinValue = 0
      TabOrder = 1
      Value = 5
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 423
    Width = 628
    Height = 19
    Panels = <
      item
        Width = 150
      end
      item
        Width = 150
      end
      item
        Width = 50
      end>
    ExplicitLeft = 320
    ExplicitTop = 232
    ExplicitWidth = 0
  end
  object memPessoa: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 304
    Top = 224
    object memPessoaCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object memPessoaSaldo: TCurrencyField
      FieldName = 'Saldo'
    end
    object memPessoaDataNascimento: TDateField
      FieldName = 'DataNascimento'
    end
    object memPessoaNome: TStringField
      FieldName = 'Nome'
      Size = 350
    end
    object memPessoaDocumento: TStringField
      FieldName = 'Documento'
    end
    object memPessoaTipoPessoa: TStringField
      FieldName = 'TipoPessoa'
    end
  end
  object dtsPessoa: TDataSource
    DataSet = memPessoa
    OnStateChange = dtsPessoaStateChange
    Left = 192
    Top = 240
  end
end
