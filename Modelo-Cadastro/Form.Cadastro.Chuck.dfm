object frmCadastroChuck: TfrmCadastroChuck
  Left = 0
  Top = 0
  Caption = 'Cadastro Chuck'
  ClientHeight = 442
  ClientWidth = 653
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object DBGridChuck: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 50
    Width = 647
    Height = 389
    Align = alClient
    DataSource = DataSourceChuck
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'value'
        Width = 308
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'icon_url'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'id'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'url'
        Width = 100
        Visible = True
      end>
  end
  object PanelControles: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 647
    Height = 41
    Align = alTop
    TabOrder = 1
    ExplicitLeft = 240
    ExplicitTop = 224
    ExplicitWidth = 185
    object ButtonBuscaFrase: TButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 101
      Height = 33
      Align = alLeft
      Caption = 'Busca Frase'
      TabOrder = 0
      OnClick = ButtonBuscaFraseClick
    end
  end
  object DataSourceChuck: TDataSource
    DataSet = memChuck
    Left = 64
    Top = 80
  end
  object memChuck: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 64
    Top = 152
    object memChuckicon_url: TStringField
      FieldName = 'icon_url'
      Size = 255
    end
    object memChuckid: TStringField
      FieldName = 'id'
      Size = 30
    end
    object memChuckurl: TStringField
      FieldName = 'url'
      Size = 255
    end
    object memChuckvalue: TStringField
      FieldName = 'value'
      Size = 1000
    end
  end
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'https://api.chucknorris.io/jokes/random'
    Params = <>
    SynchronizedEvents = False
    Left = 320
    Top = 264
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 240
    Top = 264
  end
  object RESTResponse1: TRESTResponse
    ContentType = 'application/json'
    Left = 408
    Top = 264
  end
  object TimerOpen: TTimer
    Enabled = False
    OnTimer = TimerOpenTimer
    Left = 544
    Top = 104
  end
end
