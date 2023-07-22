object frmTestaComps: TfrmTestaComps
  Left = 0
  Top = 0
  Caption = 'Testa Componentes'
  ClientHeight = 650
  ClientWidth = 832
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 832
    Height = 650
    ActivePage = TabCardViewer
    Align = alClient
    Anchors = [akBottom]
    TabOrder = 0
    ExplicitWidth = 826
    ExplicitHeight = 641
    object TabPanelObrigatorio: TTabSheet
      Caption = 'Panel Obrig'
      object DBGrid1: TDBGrid
        AlignWithMargins = True
        Left = 527
        Top = 57
        Width = 294
        Height = 519
        Align = alClient
        DataSource = dtsPessoa
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DataCadastro'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nome'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Saldo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CPF'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RG'
            Visible = True
          end>
      end
      object DBNavigator1: TDBNavigator
        Left = 0
        Top = 0
        Width = 824
        Height = 54
        DataSource = dtsPessoa
        Align = alTop
        TabOrder = 1
      end
      object Panel1: TPanel
        Left = 0
        Top = 579
        Width = 824
        Height = 41
        Align = alBottom
        TabOrder = 2
        object Button1: TButton
          Left = 56
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Button1'
          TabOrder = 0
          OnClick = Button1Click
        end
      end
      object PanelObrigatorio1: TPanelObrigatorio
        AlignWithMargins = True
        Left = 3
        Top = 57
        Width = 518
        Height = 519
        Align = alLeft
        object Label1: TLabel
          Left = 32
          Top = 24
          Width = 11
          Height = 15
          Caption = 'ID'
          FocusControl = DBEdit1
        end
        object Label2: TLabel
          Left = 32
          Top = 72
          Width = 33
          Height = 15
          Caption = 'Nome'
          FocusControl = DBEdit2
        end
        object Label3: TLabel
          Left = 32
          Top = 120
          Width = 71
          Height = 15
          Caption = 'DataCadastro'
          FocusControl = DBEdit3
        end
        object Label4: TLabel
          Left = 32
          Top = 168
          Width = 29
          Height = 15
          Caption = 'Saldo'
          FocusControl = DBEdit4
        end
        object Label5: TLabel
          Left = 32
          Top = 216
          Width = 21
          Height = 15
          Caption = 'CPF'
          FocusControl = DBEdit5
        end
        object Label6: TLabel
          Left = 32
          Top = 264
          Width = 15
          Height = 15
          Caption = 'RG'
          FocusControl = DBEdit6
        end
        object DBEdit1: TDBEdit
          Left = 32
          Top = 40
          Width = 154
          Height = 23
          DataField = 'ID'
          DataSource = dtsPessoa
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 32
          Top = 88
          Width = 300
          Height = 23
          DataField = 'Nome'
          DataSource = dtsPessoa
          TabOrder = 1
        end
        object DBEdit3: TDBEdit
          Left = 32
          Top = 136
          Width = 154
          Height = 23
          DataField = 'DataCadastro'
          DataSource = dtsPessoa
          TabOrder = 2
        end
        object DBEdit4: TDBEdit
          Left = 32
          Top = 184
          Width = 154
          Height = 23
          DataField = 'Saldo'
          DataSource = dtsPessoa
          TabOrder = 3
        end
        object DBEdit5: TDBEdit
          Left = 32
          Top = 232
          Width = 304
          Height = 23
          DataField = 'CPF'
          DataSource = dtsPessoa
          TabOrder = 4
        end
        object DBEdit6: TDBEdit
          Left = 32
          Top = 280
          Width = 304
          Height = 23
          DataField = 'RG'
          DataSource = dtsPessoa
          TabOrder = 5
        end
      end
    end
    object TabCardViewer: TTabSheet
      Caption = 'CardViewer'
      ImageIndex = 1
      object EditPrompt: TEdit
        Left = 0
        Top = 0
        Width = 824
        Height = 23
        Align = alTop
        TabOrder = 0
        TextHint = 'Prompt para gea'#231#227'o de Imagens'
        OnKeyDown = EditPromptKeyDown
        ExplicitWidth = 818
      end
    end
  end
  object memPessoa: TFDMemTable
    BeforePost = memPessoaBeforePost
    OnNewRecord = memPessoaNewRecord
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 224
    Top = 472
    object memPessoaID: TIntegerField
      FieldName = 'ID'
    end
    object memPessoaNome: TStringField
      DisplayWidth = 50
      FieldName = 'Nome'
      Required = True
      Size = 200
    end
    object memPessoaDataCadastro: TDateField
      FieldName = 'DataCadastro'
    end
    object memPessoaSaldo: TCurrencyField
      FieldName = 'Saldo'
    end
    object memPessoaCPF: TStringField
      FieldName = 'CPF'
      Required = True
    end
    object memPessoaRG: TStringField
      FieldName = 'RG'
      Required = True
    end
  end
  object dtsPessoa: TDataSource
    DataSet = memPessoa
    Left = 312
    Top = 472
  end
  object BindSourceDB1: TBindSourceDB
    DataSet = memPessoa
    ScopeMappings = <>
    Left = 128
    Top = 464
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 20
    Top = 469
  end
end
