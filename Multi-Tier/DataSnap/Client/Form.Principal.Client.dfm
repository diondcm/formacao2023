object frmPrincipalClient: TfrmPrincipalClient
  Left = 0
  Top = 0
  Caption = 'DataSnap Client'
  ClientHeight = 728
  ClientWidth = 1016
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object PageControlGeral: TPageControl
    Left = 0
    Top = 0
    Width = 1016
    Height = 728
    ActivePage = TabDataSet
    Align = alClient
    TabOrder = 0
    object TabJSON: TTabSheet
      Caption = 'JSON'
      object PanelControlesJSON: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 1002
        Height = 54
        Align = alTop
        TabOrder = 0
        object ButtonSerealizar: TButton
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 93
          Height = 46
          Align = alLeft
          Caption = 'Serealizar'
          TabOrder = 0
          OnClick = ButtonSerealizarClick
        end
        object ButtonDesserealizar: TButton
          AlignWithMargins = True
          Left = 905
          Top = 4
          Width = 93
          Height = 46
          Align = alRight
          Caption = 'Desserealizar'
          TabOrder = 1
          OnClick = ButtonDesserealizarClick
          ExplicitLeft = 4
        end
      end
      object MemoJSON: TMemo
        AlignWithMargins = True
        Left = 3
        Top = 63
        Width = 1002
        Height = 632
        Align = alClient
        TabOrder = 1
        ExplicitLeft = 416
        ExplicitTop = 304
        ExplicitWidth = 185
        ExplicitHeight = 89
      end
    end
    object TabDataSnap: TTabSheet
      Caption = 'DataSnap'
      ImageIndex = 1
      object Splitter1: TSplitter
        Left = 0
        Top = 300
        Width = 1008
        Height = 3
        Cursor = crVSplit
        Align = alTop
        ExplicitTop = 217
        ExplicitWidth = 481
      end
      object PanelDataSnapNativo: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 1002
        Height = 294
        Align = alTop
        Color = clScrollBar
        ParentBackground = False
        TabOrder = 0
        object Label1: TLabel
          Left = 1
          Top = 1
          Width = 1000
          Height = 31
          Align = alTop
          Caption = 'Nativo DataSnap'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -23
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 181
        end
        object Panel1: TPanel
          Left = 1
          Top = 32
          Width = 280
          Height = 261
          Align = alLeft
          TabOrder = 0
          object ButtonDataSnapNativoEnvia: TButton
            Left = 1
            Top = 1
            Width = 278
            Height = 50
            Align = alTop
            Caption = 'Envia Pessoa'
            TabOrder = 0
            OnClick = ButtonDataSnapNativoEnviaClick
            ExplicitLeft = 32
            ExplicitTop = 63
            ExplicitWidth = 185
          end
          object MemoDataSnapNativoEnvia: TMemo
            Left = 1
            Top = 51
            Width = 278
            Height = 209
            Align = alClient
            Lines.Strings = (
              '{'
              #9'"iD": 23123,'
              #9'"nome": "Teste",'
              #9'"dataNascimento": '
              '"2023-05-28T10:13:48.201Z",'
              #9'"renda": 43254.9,'
              #9'"ativo": false'
              '}')
            TabOrder = 1
            ExplicitLeft = 88
            ExplicitTop = 78
            ExplicitWidth = 193
            ExplicitHeight = 193
          end
        end
        object Panel2: TPanel
          Left = 281
          Top = 32
          Width = 280
          Height = 261
          Align = alLeft
          TabOrder = 1
          object ButtonDataSnapNativoRecebe: TButton
            Left = 1
            Top = 1
            Width = 278
            Height = 50
            Align = alTop
            Caption = 'Recebe Pessoa'
            TabOrder = 0
            OnClick = ButtonDataSnapNativoRecebeClick
            ExplicitLeft = 0
            ExplicitTop = 123
            ExplicitWidth = 185
          end
          object MemoDataSnapNativoRecebe: TMemo
            Left = 1
            Top = 51
            Width = 278
            Height = 209
            Align = alClient
            TabOrder = 1
            ExplicitLeft = -8
            ExplicitTop = 48
            ExplicitWidth = 193
            ExplicitHeight = 193
          end
        end
      end
      object PanelDataSnapTJson: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 306
        Width = 1002
        Height = 389
        Align = alClient
        Color = clSkyBlue
        ParentBackground = False
        TabOrder = 1
        ExplicitLeft = 416
        ExplicitTop = 328
        ExplicitWidth = 185
        ExplicitHeight = 41
        object Label2: TLabel
          Left = 1
          Top = 1
          Width = 1000
          Height = 31
          Align = alTop
          Caption = 'TJson'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -23
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 59
        end
        object Panel3: TPanel
          Left = 1
          Top = 32
          Width = 280
          Height = 356
          Align = alLeft
          TabOrder = 0
          ExplicitLeft = 9
          ExplicitTop = 33
          object ButtonDSNaoNativoEnvia: TButton
            Left = 1
            Top = 1
            Width = 278
            Height = 50
            Align = alTop
            Caption = 'Envia Pessoa'
            TabOrder = 0
            OnClick = ButtonDSNaoNativoEnviaClick
          end
          object MemoDSNaoNativoEnvia: TMemo
            Left = 1
            Top = 51
            Width = 278
            Height = 304
            Align = alClient
            Lines.Strings = (
              '{'
              #9'"iD": 23123,'
              #9'"nome": "Teste",'
              #9'"dataNascimento": '
              '"2023-05-28T10:13:48.201Z",'
              #9'"renda": 43254.9,'
              #9'"ativo": false'
              '}')
            TabOrder = 1
            ExplicitLeft = 88
            ExplicitTop = 78
            ExplicitWidth = 193
            ExplicitHeight = 193
          end
        end
        object Panel4: TPanel
          Left = 281
          Top = 32
          Width = 280
          Height = 356
          Align = alLeft
          TabOrder = 1
          ExplicitLeft = 289
          ExplicitTop = 33
          object ButtonDSNaoNativoRecebe: TButton
            Left = 1
            Top = 1
            Width = 278
            Height = 50
            Align = alTop
            Caption = 'Recebe Pessoa'
            TabOrder = 0
            OnClick = ButtonDSNaoNativoRecebeClick
          end
          object MemoDSNaoNativoRecebe: TMemo
            Left = 1
            Top = 51
            Width = 278
            Height = 304
            Align = alClient
            TabOrder = 1
          end
        end
      end
    end
    object TabThreads: TTabSheet
      Caption = 'Threads'
      ImageIndex = 2
      object Panel5: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 1002
        Height = 54
        Align = alTop
        TabOrder = 0
        object ButtonCurrentThreadID: TButton
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 176
          Height = 46
          Align = alLeft
          Caption = 'Current Thread  ID'
          TabOrder = 0
          OnClick = ButtonCurrentThreadIDClick
          ExplicitLeft = 1
          ExplicitTop = 1
          ExplicitHeight = 52
        end
        object ButtonGetThreadID: TButton
          AlignWithMargins = True
          Left = 186
          Top = 4
          Width = 176
          Height = 46
          Align = alLeft
          Caption = 'Get Thread ID'
          TabOrder = 1
          OnClick = ButtonGetThreadIDClick
          ExplicitLeft = 308
          ExplicitTop = 0
        end
        object ButtonMetodoDemorado: TButton
          AlignWithMargins = True
          Left = 368
          Top = 4
          Width = 176
          Height = 46
          Align = alLeft
          Caption = 'M'#233'todo Demorado'
          TabOrder = 2
          OnClick = ButtonMetodoDemoradoClick
          ExplicitLeft = 482
          ExplicitTop = 0
        end
        object ButtonGetLog: TButton
          AlignWithMargins = True
          Left = 550
          Top = 4
          Width = 176
          Height = 46
          Align = alLeft
          Caption = 'Log Server'
          TabOrder = 3
          OnClick = ButtonGetLogClick
          ExplicitLeft = 720
          ExplicitTop = -3
        end
      end
      object MemoThreads: TMemo
        AlignWithMargins = True
        Left = 3
        Top = 63
        Width = 1002
        Height = 632
        Align = alClient
        Color = clInfoBk
        TabOrder = 1
        ExplicitLeft = 416
        ExplicitTop = 304
        ExplicitWidth = 185
        ExplicitHeight = 89
      end
    end
    object TabDataSet: TTabSheet
      Caption = 'DataSet'
      ImageIndex = 3
      object Panel6: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 1002
        Height = 278
        Align = alTop
        TabOrder = 0
        object DBNavigator1: TDBNavigator
          Left = 1
          Top = 42
          Width = 1000
          Height = 25
          DataSource = dtsPessoa
          Align = alTop
          TabOrder = 0
          ExplicitLeft = -7
          ExplicitTop = 177
        end
        object DBGrid1: TDBGrid
          Left = 1
          Top = 67
          Width = 1000
          Height = 210
          Align = alClient
          DataSource = dtsPessoa
          TabOrder = 1
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
              FieldName = 'Nome'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DataNascimento'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Renda'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Ativo'
              Visible = True
            end>
        end
        object Panel7: TPanel
          Left = 1
          Top = 1
          Width = 1000
          Height = 41
          Align = alTop
          TabOrder = 2
          ExplicitLeft = 224
          ExplicitTop = 237
          ExplicitWidth = 489
          object Label3: TLabel
            Left = 1
            Top = 1
            Width = 169
            Height = 39
            Align = alLeft
            Caption = 'Dados mem'#243'ria'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -23
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitHeight = 31
          end
          object Button1: TButton
            AlignWithMargins = True
            Left = 759
            Top = 4
            Width = 75
            Height = 33
            Align = alRight
            Caption = 'Load'
            TabOrder = 0
            OnClick = Button1Click
            ExplicitLeft = 410
          end
          object Button2: TButton
            AlignWithMargins = True
            Left = 678
            Top = 4
            Width = 75
            Height = 33
            Align = alRight
            Caption = 'Save'
            TabOrder = 1
            OnClick = Button2Click
            ExplicitLeft = 329
          end
          object Button3: TButton
            AlignWithMargins = True
            Left = 597
            Top = 4
            Width = 75
            Height = 33
            Align = alRight
            Caption = 'Delta'
            TabOrder = 2
            OnClick = Button3Click
            ExplicitLeft = 329
          end
          object Button4: TButton
            AlignWithMargins = True
            Left = 840
            Top = 4
            Width = 75
            Height = 33
            Align = alRight
            Caption = 'Get Server'
            TabOrder = 3
            OnClick = Button4Click
            ExplicitLeft = 942
            ExplicitTop = -4
          end
          object Button5: TButton
            AlignWithMargins = True
            Left = 921
            Top = 4
            Width = 75
            Height = 33
            Align = alRight
            Caption = 'Set Server'
            TabOrder = 4
            OnClick = Button5Click
            ExplicitLeft = 984
            ExplicitTop = 2
          end
        end
      end
      object Panel8: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 287
        Width = 1002
        Height = 234
        Align = alTop
        TabOrder = 1
        object Label4: TLabel
          Left = 1
          Top = 1
          Width = 1000
          Height = 31
          Align = alTop
          Caption = 'Status Filter'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -23
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 128
        end
        object DBGrid2: TDBGrid
          Left = 1
          Top = 32
          Width = 1000
          Height = 201
          Align = alClient
          DataSource = dtsDelta
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
        end
      end
      object Panel9: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 527
        Width = 1002
        Height = 168
        Align = alClient
        TabOrder = 2
        ExplicitLeft = 144
        ExplicitTop = 616
        ExplicitWidth = 185
        ExplicitHeight = 41
        object Panel10: TPanel
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 357
          Height = 160
          Align = alLeft
          TabOrder = 0
          object Label5: TLabel
            Left = 1
            Top = 1
            Width = 355
            Height = 31
            Align = alTop
            Caption = 'Deletados'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -23
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitWidth = 107
          end
          object DBGrid3: TDBGrid
            Left = 1
            Top = 32
            Width = 355
            Height = 127
            Align = alClient
            DataSource = dtsDeletados
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = []
          end
        end
        object Panel11: TPanel
          AlignWithMargins = True
          Left = 367
          Top = 4
          Width = 290
          Height = 160
          Align = alLeft
          TabOrder = 1
          object Label6: TLabel
            Left = 1
            Top = 1
            Width = 288
            Height = 31
            Align = alTop
            Caption = 'Incluidos'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -23
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitWidth = 98
          end
          object DBGrid4: TDBGrid
            Left = 1
            Top = 32
            Width = 288
            Height = 127
            Align = alClient
            DataSource = dtsIncluidos
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = []
          end
        end
        object Panel12: TPanel
          AlignWithMargins = True
          Left = 663
          Top = 4
          Width = 335
          Height = 160
          Align = alClient
          TabOrder = 2
          ExplicitLeft = 200
          ExplicitTop = 592
          ExplicitWidth = 185
          ExplicitHeight = 41
          object Label7: TLabel
            Left = 1
            Top = 1
            Width = 333
            Height = 31
            Align = alTop
            Caption = 'Alterados'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -23
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitWidth = 103
          end
          object DBGrid5: TDBGrid
            Left = 1
            Top = 32
            Width = 333
            Height = 127
            Align = alClient
            DataSource = dtsAlterados
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = []
          end
        end
      end
    end
  end
  object memPessoa: TFDMemTable
    FieldDefs = <>
    CachedUpdates = True
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 512
    Top = 112
    object memPessoaID: TIntegerField
      FieldName = 'ID'
    end
    object memPessoaNome: TStringField
      FieldName = 'Nome'
      Size = 300
    end
    object memPessoaDataNascimento: TDateTimeField
      FieldName = 'DataNascimento'
    end
    object memPessoaRenda: TCurrencyField
      FieldName = 'Renda'
    end
    object memPessoaAtivo: TBooleanField
      FieldName = 'Ativo'
    end
  end
  object dtsPessoa: TDataSource
    DataSet = memPessoa
    Left = 512
    Top = 168
  end
  object memDelta: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 336
    Top = 336
  end
  object dtsDelta: TDataSource
    DataSet = memDelta
    Left = 344
    Top = 392
  end
  object dtsDeletados: TDataSource
    DataSet = memDeletados
    Left = 248
    Top = 536
  end
  object memDeletados: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 240
    Top = 480
  end
  object dtsIncluidos: TDataSource
    DataSet = memIncluidos
    Left = 504
    Top = 528
  end
  object memIncluidos: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 496
    Top = 472
  end
  object dtsAlterados: TDataSource
    DataSet = memAlterados
    Left = 856
    Top = 528
  end
  object memAlterados: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 848
    Top = 472
  end
end
