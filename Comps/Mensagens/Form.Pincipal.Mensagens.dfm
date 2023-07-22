object frmPrincipalMensagens: TfrmPrincipalMensagens
  Left = 0
  Top = 0
  Caption = 'Teste Mensagens'
  ClientHeight = 442
  ClientWidth = 745
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  TextHeight = 15
  object Splitter1: TSplitter
    Left = 185
    Top = 135
    Height = 307
    ExplicitLeft = 320
    ExplicitTop = 192
    ExplicitHeight = 100
  end
  object PanelControles: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 739
    Height = 41
    Align = alTop
    Color = clSkyBlue
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 733
    object ButtonProcessamento: TButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 117
      Height = 33
      Align = alLeft
      Caption = 'Processamento'
      TabOrder = 0
      OnClick = ButtonProcessamentoClick
    end
    object EditAviso: TEdit
      Left = 127
      Top = 9
      Width = 121
      Height = 23
      TabOrder = 1
      TextHint = 'Aviso'
      OnChange = EditAvisoChange
    end
    object EditHWND: TEdit
      Left = 403
      Top = 9
      Width = 121
      Height = 23
      TabOrder = 2
    end
    object EditTexto: TEdit
      Left = 267
      Top = 9
      Width = 121
      Height = 23
      TabOrder = 3
      Text = 'Texto alterado'
    end
    object ButtonFormWin: TButton
      Left = 536
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Form Win'
      TabOrder = 4
      OnClick = ButtonFormWinClick
    end
    object ButtonFreeze: TButton
      Left = 648
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Freeze'
      TabOrder = 5
      OnClick = ButtonFreezeClick
    end
  end
  object PanelMessage: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 50
    Width = 739
    Height = 41
    Align = alTop
    Color = clActiveCaption
    ParentBackground = False
    TabOrder = 1
    ExplicitWidth = 733
    object Label1: TLabel
      Left = 403
      Top = 14
      Width = 11
      Height = 15
      Caption = 'W'
    end
    object Label2: TLabel
      Left = 507
      Top = 13
      Width = 6
      Height = 15
      Caption = 'L'
    end
    object Label3: TLabel
      Left = 267
      Top = 13
      Width = 23
      Height = 15
      Caption = 'Msg'
    end
    object ButtonSend: TButton
      AlignWithMargins = True
      Left = 191
      Top = 4
      Width = 54
      Height = 33
      Align = alLeft
      Caption = 'Send'
      TabOrder = 0
      OnClick = ButtonSendClick
    end
    object EditW: TEdit
      Left = 424
      Top = 9
      Width = 75
      Height = 23
      BiDiMode = bdLeftToRight
      NumbersOnly = True
      ParentBiDiMode = False
      TabOrder = 1
    end
    object EditL: TEdit
      Left = 528
      Top = 8
      Width = 75
      Height = 23
      BiDiMode = bdLeftToRight
      NumbersOnly = True
      ParentBiDiMode = False
      TabOrder = 2
    end
    object EditHandleDestino: TEdit
      AlignWithMargins = True
      Left = 4
      Top = 8
      Width = 121
      Height = 25
      Margins.Top = 7
      Margins.Bottom = 7
      Align = alLeft
      Color = clMoneyGreen
      TabOrder = 3
      ExplicitHeight = 23
    end
    object EditMsg: TEdit
      Left = 296
      Top = 8
      Width = 75
      Height = 23
      BiDiMode = bdLeftToRight
      NumbersOnly = True
      ParentBiDiMode = False
      TabOrder = 4
    end
    object Button3: TButton
      Left = 648
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Show Form'
      TabOrder = 5
      OnClick = Button3Click
    end
    object ButtonPost: TButton
      AlignWithMargins = True
      Left = 131
      Top = 4
      Width = 54
      Height = 33
      Align = alLeft
      Caption = 'Post'
      TabOrder = 6
      OnClick = ButtonPostClick
    end
  end
  object MemoLog: TMemo
    AlignWithMargins = True
    Left = 191
    Top = 138
    Width = 551
    Height = 301
    Align = alClient
    Color = clInfoBk
    TabOrder = 2
    ExplicitWidth = 545
    ExplicitHeight = 292
  end
  object Panel1: TPanel
    Left = 0
    Top = 135
    Width = 185
    Height = 307
    Align = alLeft
    TabOrder = 3
    ExplicitHeight = 298
    object ListBoxHandles: TListBox
      AlignWithMargins = True
      Left = 4
      Top = 51
      Width = 177
      Height = 252
      Align = alClient
      ItemHeight = 15
      TabOrder = 0
      OnClick = ListBoxHandlesClick
      ExplicitHeight = 243
    end
    object Panel2: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 177
      Height = 41
      Align = alTop
      TabOrder = 1
      object CheckBoxAtivar: TCheckBox
        Left = 16
        Top = 11
        Width = 97
        Height = 17
        Caption = 'Ativar Busca'
        TabOrder = 0
        OnClick = CheckBoxAtivarClick
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 94
    Width = 745
    Height = 41
    Align = alTop
    TabOrder = 4
    ExplicitWidth = 739
    object ButtonClick: TButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 120
      Height = 33
      Align = alLeft
      Caption = 'Click'
      TabOrder = 0
      OnClick = ButtonClickClick
    end
    object ButtonSetText: TButton
      AlignWithMargins = True
      Left = 130
      Top = 4
      Width = 120
      Height = 33
      Align = alLeft
      Caption = 'SetText'
      TabOrder = 1
      OnClick = ButtonSetTextClick
    end
    object ButtonClose: TButton
      AlignWithMargins = True
      Left = 256
      Top = 4
      Width = 120
      Height = 33
      Align = alLeft
      Caption = 'Close'
      TabOrder = 2
      OnClick = ButtonCloseClick
    end
    object ButtonShake: TButton
      AlignWithMargins = True
      Left = 382
      Top = 4
      Width = 120
      Height = 33
      Align = alLeft
      Caption = 'Shake'
      TabOrder = 3
      OnClick = ButtonShakeClick
    end
    object ButtonSetParent: TButton
      AlignWithMargins = True
      Left = 508
      Top = 4
      Width = 120
      Height = 33
      Align = alLeft
      Caption = 'SetParent'
      TabOrder = 4
      OnClick = ButtonSetParentClick
    end
    object Button2: TButton
      Left = 634
      Top = 13
      Width = 75
      Height = 25
      Caption = 'Button2'
      TabOrder = 5
      OnClick = Button2Click
    end
  end
  object TimerBusca: TTimer
    Enabled = False
    Interval = 3000
    OnTimer = TimerBuscaTimer
    Left = 304
    Top = 224
  end
end
