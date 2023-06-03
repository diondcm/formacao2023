object frmThreadsExcept: TfrmThreadsExcept
  Left = 0
  Top = 0
  Caption = 'Exceptions on Threads'
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
  OnDestroy = FormDestroy
  TextHeight = 15
  object PanelControles: TPanel
    Left = 0
    Top = 0
    Width = 628
    Height = 57
    Align = alTop
    TabOrder = 0
    object ButtonException: TButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 101
      Height = 49
      Align = alLeft
      Caption = 'Exception'
      TabOrder = 0
      OnClick = ButtonExceptionClick
    end
    object ButtonExceptionThr: TButton
      AlignWithMargins = True
      Left = 111
      Top = 4
      Width = 101
      Height = 49
      Align = alLeft
      Caption = 'Exception Thr'
      TabOrder = 1
      OnClick = ButtonExceptionThrClick
      ExplicitLeft = 188
    end
  end
  object PanelTempoErro: TPanel
    Left = 0
    Top = 57
    Width = 628
    Height = 56
    Align = alTop
    TabOrder = 1
    object ButtonSemException: TButton
      AlignWithMargins = True
      Left = 111
      Top = 4
      Width = 101
      Height = 48
      Align = alLeft
      Caption = 'Sem Exception'
      TabOrder = 0
      OnClick = ButtonSemExceptionClick
      ExplicitLeft = 12
      ExplicitTop = 8
    end
    object ButtonComException: TButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 101
      Height = 48
      Align = alLeft
      Caption = 'Com Exception'
      TabOrder = 1
      OnClick = ButtonComExceptionClick
      ExplicitLeft = 12
      ExplicitTop = 8
    end
  end
end
