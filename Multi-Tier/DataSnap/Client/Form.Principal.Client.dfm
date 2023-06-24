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
    ActivePage = TabListas
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
          end
          object MemoDataSnapNativoRecebe: TMemo
            Left = 1
            Top = 51
            Width = 278
            Height = 209
            Align = alClient
            TabOrder = 1
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
          end
        end
        object Panel4: TPanel
          Left = 281
          Top = 32
          Width = 280
          Height = 356
          Align = alLeft
          TabOrder = 1
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
        ExplicitWidth = 996
        object DBNavigator1: TDBNavigator
          Left = 1
          Top = 42
          Width = 1000
          Height = 25
          DataSource = dtsPessoa
          Align = alTop
          TabOrder = 0
          ExplicitWidth = 994
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
          ExplicitWidth = 994
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
            ExplicitLeft = 753
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
            ExplicitLeft = 672
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
            ExplicitLeft = 591
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
            ExplicitLeft = 834
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
            ExplicitLeft = 915
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
        ExplicitWidth = 996
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
        ExplicitWidth = 996
        ExplicitHeight = 159
        object Panel10: TPanel
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 357
          Height = 160
          Align = alLeft
          TabOrder = 0
          ExplicitHeight = 151
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
          ExplicitHeight = 151
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
          ExplicitWidth = 329
          ExplicitHeight = 151
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
    object TabHash: TTabSheet
      Caption = 'Hash'
      ImageIndex = 4
      object Splitter3: TSplitter
        Left = 820
        Top = 0
        Height = 698
        Align = alRight
        ExplicitLeft = 504
        ExplicitTop = 296
        ExplicitHeight = 100
      end
      object PanelHash: TPanel
        Left = 823
        Top = 0
        Width = 185
        Height = 698
        Align = alRight
        TabOrder = 0
        ExplicitLeft = 416
        ExplicitTop = 328
        ExplicitHeight = 41
        object Splitter2: TSplitter
          Left = 1
          Top = 96
          Width = 183
          Height = 3
          Cursor = crVSplit
          Align = alTop
          ExplicitTop = 93
        end
        object MemoDados: TMemo
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 177
          Height = 89
          Align = alTop
          TabOrder = 0
          OnChange = MemoDadosChange
          ExplicitLeft = 8
          ExplicitTop = 12
        end
        object MemoHash: TMemo
          AlignWithMargins = True
          Left = 4
          Top = 102
          Width = 177
          Height = 592
          Align = alClient
          Color = clInactiveCaption
          TabOrder = 1
          ExplicitTop = 698
          ExplicitHeight = 0
        end
      end
      object Panel13: TPanel
        Left = 0
        Top = 0
        Width = 820
        Height = 698
        Align = alClient
        TabOrder = 1
        ExplicitLeft = 416
        ExplicitTop = 328
        ExplicitWidth = 185
        ExplicitHeight = 41
        object EditSenha: TEdit
          Left = 16
          Top = 16
          Width = 121
          Height = 23
          TabOrder = 0
          TextHint = 'Informe a senha'
        end
        object Button6: TButton
          Left = 160
          Top = 15
          Width = 105
          Height = 25
          Caption = 'Autenticar'
          TabOrder = 1
          OnClick = Button6Click
        end
        object MemoRespostaHash: TMemo
          AlignWithMargins = True
          Left = 4
          Top = 376
          Width = 812
          Height = 318
          Align = alBottom
          Color = clMedGray
          TabOrder = 2
        end
      end
    end
    object TabListas: TTabSheet
      Caption = 'Listas'
      ImageIndex = 5
      object MemoRetornoListas: TMemo
        AlignWithMargins = True
        Left = 3
        Top = 50
        Width = 1002
        Height = 645
        Align = alClient
        Color = clInactiveCaption
        TabOrder = 0
        ExplicitTop = 272
        ExplicitHeight = 423
      end
      object Panel14: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 1002
        Height = 41
        Align = alTop
        TabOrder = 1
        ExplicitLeft = 208
        ExplicitTop = 152
        ExplicitWidth = 185
        object ButtonRetornoResponse: TButton
          AlignWithMargins = True
          Left = 266
          Top = 4
          Width = 125
          Height = 33
          Align = alLeft
          Caption = 'Retorno no Response'
          TabOrder = 0
          OnClick = ButtonRetornoResponseClick
        end
        object ButtonListaString: TButton
          AlignWithMargins = True
          Left = 135
          Top = 4
          Width = 125
          Height = 33
          Align = alLeft
          Caption = 'Retorno Lista String'
          TabOrder = 1
          OnClick = ButtonListaStringClick
        end
        object ButtonListaDataSnap: TButton
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 125
          Height = 33
          Align = alLeft
          Caption = 'Lista DataSnap'
          TabOrder = 2
          OnClick = ButtonListaDataSnapClick
        end
        object EditQtdPessoa: TEdit
          AlignWithMargins = True
          Left = 856
          Top = 8
          Width = 142
          Height = 25
          Margins.Top = 7
          Margins.Bottom = 7
          Align = alRight
          NumbersOnly = True
          TabOrder = 3
          TextHint = 'Qtd Pessoas'
          ExplicitTop = 4
          ExplicitHeight = 33
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
  object IdHTTP1: TIdHTTP
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 824
    Top = 160
  end
end
