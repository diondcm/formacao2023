object frmRelatoriosSimples: TfrmRelatoriosSimples
  Left = 0
  Top = 0
  Caption = 'Relatorios Simples'
  ClientHeight = 445
  ClientWidth = 778
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 772
    Height = 41
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 616
    object ButtonExemplo: TButton
      Left = 8
      Top = 9
      Width = 90
      Height = 25
      Caption = 'Exemplo'
      TabOrder = 0
      OnClick = ButtonExemploClick
    end
    object ButtonListaSimples: TButton
      Left = 104
      Top = 9
      Width = 97
      Height = 25
      Caption = 'Lista Simples'
      TabOrder = 1
      OnClick = ButtonListaSimplesClick
    end
    object ButtonMainDetail: TButton
      Left = 207
      Top = 9
      Width = 97
      Height = 25
      Caption = 'Main/Detail'
      TabOrder = 2
      OnClick = ButtonMainDetailClick
    end
    object Button1: TButton
      Left = 520
      Top = 9
      Width = 91
      Height = 25
      Caption = 'Vars'
      TabOrder = 3
      OnClick = Button1Click
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 50
    Width = 772
    Height = 392
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 616
    ExplicitHeight = 380
    object Splitter1: TSplitter
      Left = 1
      Top = 243
      Width = 770
      Height = 3
      Cursor = crVSplit
      Align = alBottom
      ExplicitLeft = -15
      ExplicitTop = 256
      ExplicitWidth = 620
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 26
      Width = 770
      Height = 217
      Align = alClient
      DataSource = dtsCountry
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
    object DBGrid2: TDBGrid
      Left = 1
      Top = 246
      Width = 770
      Height = 120
      Align = alBottom
      DataSource = dtsCustomer
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
    object DBNavigator1: TDBNavigator
      Left = 1
      Top = 1
      Width = 770
      Height = 25
      Align = alTop
      TabOrder = 2
      ExplicitWidth = 614
    end
    object DBNavigator2: TDBNavigator
      Left = 1
      Top = 366
      Width = 770
      Height = 25
      Align = alBottom
      TabOrder = 3
      ExplicitTop = 354
      ExplicitWidth = 614
    end
  end
  object dtsCountry: TDataSource
    DataSet = dmdRelatoriosSimples.memCountry
    Left = 296
    Top = 304
  end
  object dtsCustomer: TDataSource
    DataSet = dmdRelatoriosSimples.memCustomer
    Left = 472
    Top = 168
  end
end
