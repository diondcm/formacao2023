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
    ActivePage = TabBlockChain
    Align = alClient
    TabOrder = 0
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
        ExplicitLeft = 144
        ExplicitTop = 248
        ExplicitWidth = 185
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
        ExplicitLeft = 6
        ExplicitTop = 11
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
          ExplicitLeft = 493
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
          ExplicitLeft = 212
          ExplicitTop = -3
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
        ExplicitLeft = 216
        ExplicitTop = 160
        ExplicitWidth = 185
        ExplicitHeight = 89
      end
    end
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
end
