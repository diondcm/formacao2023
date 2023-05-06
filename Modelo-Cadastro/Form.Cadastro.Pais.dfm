object frmCadastroPais: TfrmCadastroPais
  Left = 0
  Top = 0
  Caption = 'Pa'#237'ses'
  ClientHeight = 445
  ClientWidth = 626
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 15
  object PanelControles: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 620
    Height = 41
    Align = alTop
    Color = clTeal
    ParentBackground = False
    TabOrder = 0
    StyleElements = []
    ExplicitWidth = 612
    object EditSigla: TEdit
      AlignWithMargins = True
      Left = 4
      Top = 6
      Width = 133
      Height = 29
      Margins.Top = 5
      Margins.Bottom = 5
      Align = alLeft
      TabOrder = 0
      TextHint = 'Informe a sigla'
      ExplicitHeight = 23
    end
    object ButtonPais: TButton
      AlignWithMargins = True
      Left = 143
      Top = 4
      Width = 122
      Height = 33
      Align = alLeft
      Caption = 'Buscar Pa'#237's'
      Default = True
      TabOrder = 1
      OnClick = ButtonPaisClick
    end
  end
  object PanelGrid: TPanel
    Left = 0
    Top = 47
    Width = 626
    Height = 398
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 618
    ExplicitHeight = 384
    object Splitter1: TSplitter
      Left = 437
      Top = 1
      Height = 396
      Align = alRight
      ExplicitLeft = 312
      ExplicitTop = 144
      ExplicitHeight = 100
    end
    object PanelImagem: TPanel
      Left = 440
      Top = 1
      Width = 185
      Height = 396
      Align = alRight
      TabOrder = 0
      ExplicitLeft = 432
      ExplicitHeight = 382
      object ImagemPais: TImage
        AlignWithMargins = True
        Left = 11
        Top = 51
        Width = 163
        Height = 294
        Margins.Left = 10
        Margins.Top = 50
        Margins.Right = 10
        Margins.Bottom = 50
        Align = alClient
        ExplicitLeft = 40
        ExplicitTop = 144
        ExplicitWidth = 105
        ExplicitHeight = 105
      end
    end
    object DBGridDados: TDBGrid
      Left = 1
      Top = 1
      Width = 436
      Height = 396
      Align = alClient
      DataSource = DataSourcePais
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'Name'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Cca2'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Population'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Flag'
          Width = 100
          Visible = True
        end>
    end
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 240
    Top = 264
  end
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'https://restcountries.com/v3.1/alpha'
    Params = <>
    SynchronizedEvents = False
    Left = 320
    Top = 264
  end
  object RESTResponse1: TRESTResponse
    ContentType = 'application/json'
    Left = 408
    Top = 264
  end
  object memPais: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 64
    Top = 152
    object memPaisName: TStringField
      FieldName = 'Name'
      Size = 300
    end
    object memPaisCca2: TStringField
      FieldName = 'Cca2'
      Size = 50
    end
    object memPaisPopulation: TLargeintField
      FieldName = 'Population'
    end
    object memPaisFlag: TStringField
      FieldName = 'Flag'
      Size = 500
    end
  end
  object DataSourcePais: TDataSource
    DataSet = memPais
    OnDataChange = DataSourcePaisDataChange
    Left = 64
    Top = 80
  end
  object TimerOpen: TTimer
    Enabled = False
    OnTimer = TimerOpenTimer
    Left = 344
    Top = 152
  end
end
