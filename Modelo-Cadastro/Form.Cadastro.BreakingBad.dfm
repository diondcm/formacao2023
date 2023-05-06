object frmBreakingBad: TfrmBreakingBad
  Left = 0
  Top = 0
  Caption = 'Breaking Bad'
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
  object PanelControles: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 622
    Height = 41
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 616
    object EditFrases: TEdit
      AlignWithMargins = True
      Left = 4
      Top = 6
      Width = 140
      Height = 29
      Margins.Top = 5
      Margins.Bottom = 5
      Align = alLeft
      TabOrder = 0
      TextHint = 'Informe a qtd de frases'
      OnKeyDown = EditFrasesKeyDown
      ExplicitLeft = 85
    end
  end
  object GridPanelFrases: TGridPanel
    AlignWithMargins = True
    Left = 3
    Top = 50
    Width = 622
    Height = 389
    Align = alClient
    ColumnCollection = <
      item
        Value = 50.000000000000000000
      end
      item
        Value = 50.000000000000000000
      end>
    ControlCollection = <
      item
        Column = 1
        Control = memoFrases
        Row = 0
      end
      item
        Column = 0
        Control = StaticTextFrases
        Row = 0
      end>
    RowCollection = <
      item
        Value = 100.000000000000000000
      end>
    TabOrder = 1
    ExplicitWidth = 616
    ExplicitHeight = 380
    DesignSize = (
      622
      389)
    object memoFrases: TMemo
      Left = 373
      Top = 47
      Width = 185
      Height = 294
      Anchors = []
      Lines.Strings = (
        'memoFrases')
      TabOrder = 0
      ExplicitTop = 75
    end
    object StaticTextFrases: TStaticText
      Left = 112
      Top = 185
      Width = 87
      Height = 19
      Anchors = []
      Caption = 'StaticTextFrases'
      TabOrder = 1
      ExplicitLeft = 78
      ExplicitTop = 126
    end
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 368
    Top = 272
  end
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'https://api.breakingbadquotes.xyz/v1/quotes'
    Params = <>
    SynchronizedEvents = False
    Left = 448
    Top = 272
  end
  object RESTResponse1: TRESTResponse
    ContentType = 'application/json'
    Left = 536
    Top = 272
  end
  object memFrases: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 144
    Top = 296
    object memFrasesJSON: TStringField
      FieldName = 'JSON'
      Size = 2000
    end
  end
  object BindSourceDB1: TBindSourceDB
    DataSet = memFrases
    ScopeMappings = <>
    Left = 200
    Top = 168
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 92
    Top = 165
    object LinkControlToField1: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'JSON'
      Control = memoFrases
      Track = False
    end
    object LinkPropertyToFieldCaption: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'JSON'
      Component = StaticTextFrases
      ComponentProperty = 'Caption'
    end
  end
end
