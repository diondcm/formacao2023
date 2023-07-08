object frmClientPrincipal: TfrmClientPrincipal
  Left = 0
  Top = 0
  Caption = 'Client Files'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object PageControlClient: TPageControl
    Left = 0
    Top = 0
    Width = 628
    Height = 442
    ActivePage = TabProduto
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 622
    ExplicitHeight = 433
    object TabImagem: TTabSheet
      Caption = 'Imagem'
      object ImagemLogo: TImage
        Left = 0
        Top = 47
        Width = 620
        Height = 365
        Align = alClient
        ExplicitLeft = 272
        ExplicitTop = 192
        ExplicitWidth = 105
        ExplicitHeight = 105
      end
      object PanelControles: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 614
        Height = 41
        Align = alTop
        TabOrder = 0
        object ButtonGetFile: TButton
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 117
          Height = 33
          Align = alLeft
          Caption = 'Baixa Imagem'
          TabOrder = 0
          OnClick = ButtonGetFileClick
        end
        object ButtonSetFile: TButton
          AlignWithMargins = True
          Left = 127
          Top = 4
          Width = 117
          Height = 33
          Align = alLeft
          Caption = 'Envia Imagem'
          TabOrder = 1
          OnClick = ButtonSetFileClick
        end
      end
    end
    object TabBlockChain: TTabSheet
      Caption = 'BlockChain'
      ImageIndex = 1
      object Panel1: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 614
        Height = 41
        Align = alTop
        TabOrder = 0
        object ButtonBlockChain: TButton
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 117
          Height = 33
          Align = alLeft
          Caption = 'Acessar BlockChain'
          TabOrder = 0
          OnClick = ButtonBlockChainClick
        end
        object ButtonCriaClasses: TButton
          AlignWithMargins = True
          Left = 127
          Top = 4
          Width = 117
          Height = 33
          Align = alLeft
          Caption = 'Cria Classes'
          TabOrder = 1
          OnClick = ButtonCriaClassesClick
        end
      end
      object MemoBlockChain: TMemo
        AlignWithMargins = True
        Left = 3
        Top = 50
        Width = 614
        Height = 359
        Align = alClient
        TabOrder = 1
      end
    end
    object TabProduto: TTabSheet
      Caption = 'Teste Produto'
      ImageIndex = 2
      object LabelQtdExecutando: TLabel
        Left = 536
        Top = 45
        Width = 62
        Height = 15
        Caption = 'Executando'
      end
      object LabelQtdErro: TLabel
        Left = 536
        Top = 66
        Width = 21
        Height = 15
        Caption = 'Erro'
      end
      object LabelQtdConcluido: TLabel
        Left = 536
        Top = 87
        Width = 60
        Height = 15
        Caption = 'Concluidos'
      end
      object Button1: TButton
        Left = 24
        Top = 24
        Width = 161
        Height = 41
        Caption = 'Testa Produtos'
        TabOrder = 0
        OnClick = Button1Click
      end
      object ButtonSessionID: TButton
        Left = 24
        Top = 88
        Width = 161
        Height = 25
        Caption = 'Get Data Atual + Session ID'
        TabOrder = 1
        OnClick = ButtonSessionIDClick
      end
      object Edit1: TEdit
        Left = 248
        Top = 192
        Width = 121
        Height = 23
        TabOrder = 2
        Text = '2023-07-01 11:34:19.240'
      end
      object ButtonTryConverDateTime: TButton
        Left = 24
        Top = 191
        Width = 161
        Height = 25
        Caption = 'ButtonTryConverDateTime'
        TabOrder = 3
        OnClick = ButtonTryConverDateTimeClick
      end
      object ButtonUnixDate: TButton
        Left = 24
        Top = 248
        Width = 161
        Height = 25
        Caption = 'Unix Date'
        TabOrder = 4
        OnClick = ButtonUnixDateClick
      end
      object ButtonISO8601: TButton
        Left = 24
        Top = 296
        Width = 161
        Height = 25
        Caption = 'ISO 8601'
        TabOrder = 5
        OnClick = ButtonISO8601Click
      end
    end
  end
  object CheckBoxProducao: TCheckBox
    Left = 312
    Top = 50
    Width = 121
    Height = 17
    Caption = 'Ativar Produ'#231#227'o'
    TabOrder = 1
    OnClick = CheckBoxProducaoClick
  end
  object EditProduto: TEdit
    Left = 312
    Top = 73
    Width = 121
    Height = 23
    Color = clInactiveCaption
    TabOrder = 2
  end
  object OpenPictureDialog: TOpenPictureDialog
    Left = 192
    Top = 16
  end
  object RESTClient1: TRESTClient
    BaseURL = 
      'https://blockchain.info/rawblock/0000000000000bae09a7a393a8acded' +
      '75aa67e46cb81f7acaa5ad94f9eacd103'
    Params = <>
    SynchronizedEvents = False
    Left = 56
    Top = 312
  end
  object RESTRequest1: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 56
    Top = 368
  end
  object RESTResponse1: TRESTResponse
    Left = 144
    Top = 368
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
    Left = 312
    Top = 320
  end
  object TimerProducao: TTimer
    Enabled = False
    OnTimer = TimerProducaoTimer
    Left = 256
    Top = 80
  end
  object TimerThreads: TTimer
    Enabled = False
    OnTimer = TimerThreadsTimer
    Left = 544
    Top = 152
  end
end
