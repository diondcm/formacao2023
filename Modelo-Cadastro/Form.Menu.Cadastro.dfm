object frmMenuCadastros: TfrmMenuCadastros
  Left = 0
  Top = 0
  Caption = 'Menu Cadastros'
  ClientHeight = 442
  ClientWidth = 674
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu
  Position = poScreenCenter
  TextHeight = 15
  object FlowPanelMenu: TFlowPanel
    Left = 0
    Top = 0
    Width = 674
    Height = 442
    Align = alClient
    Color = clSkyBlue
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 666
    ExplicitHeight = 428
    object BitBtnCadastroChuck: TBitBtn
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 160
      Height = 64
      Action = ActionCadastroChuck
      Caption = 'Cadastro Chuck'
      Images = ImageList
      TabOrder = 0
    end
    object BitBtnBreakingBad: TBitBtn
      AlignWithMargins = True
      Left = 170
      Top = 4
      Width = 160
      Height = 64
      Action = ActionCadastroBB
      Caption = 'Breaking Bad'
      TabOrder = 1
    end
    object BitBtn1: TBitBtn
      AlignWithMargins = True
      Left = 336
      Top = 4
      Width = 160
      Height = 64
      Action = ActionCadastroPais
      Caption = 'Cadastro Pa'#237'ses'
      TabOrder = 2
    end
    object BitBtnGeraQrCode: TBitBtn
      AlignWithMargins = True
      Left = 502
      Top = 4
      Width = 160
      Height = 64
      Action = ActionGeraQrCode
      Caption = 'Gera QrCode'
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFC25826FFC55F2FFFC76537FFC76638FFC765
        37FFC55F2FFFC35826FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD2845EFFC76637FFCA6639FFC76739FFC86739FFC66536FFC463
        35FFCC6B3DFFD37145FFCE6C3EFFCF815BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFD07D55FFC86739FFCD6539FF08A52BFFC96437FFDB7A4EFFEC8A5FFFEA88
        5EFFE9875CFFEA885DFFEA885DFFF98360FFF19776FFFFFFFFFFFFFFFFFFFDF9
        F8FFC76638FFC86739FFCF6439FF1C9A2BFF50C643FFFA8160FFEA885DFFEA88
        5DFFEA885DFFEA885DFFEC875DFF1ED137FF24CF37FFFFF7FBFFFFFFFFFFC153
        20FFC86739FFC86739FFCB6338FF2BD33CFF39C83CFF33CA3AFFFA8260FFEA87
        5DFFEA885DFFEA885DFFEA875DFF3DC63CFF39C83CFF48B22BFFEBC8B8FFC35B
        2AFFC86739FFC86739FFCE6138FF2BCD39FF39C83CFF37C83BFFDB8D5AFFF384
        5EFFEA885DFFEA885DFFEA885DFFCC9257FF38C83BFF20C72BFFD07E56FFC664
        35FFC86739FFC76638FFFC8664FF31CA3AFF39C83CFF39C83CFF2FCB3AFF56BD
        41FFEA885DFFEA885DFFEA885DFFF5845FFF37C83BFF2EC937FFC76537FFC766
        38FFC86739FFC46335FFBE9955FF39C83CFF39C83CFF39C83CFF2CCC39FF4BC0
        3FFFEA875DFFEA875DFF91A84CFF76B147FF39C73CFF34C93BFFD07E57FFC664
        35FFC86739FFCB6A3CFFFA8160FF2FCB3AFF39C83CFF20D037FFFF7F61FFEB87
        5DFFEA885DFFFB8160FF34C93BFF39C83CFF39C83CFF33C738FFEBCABAFFC35B
        29FFC86739FFCE6D40FFE48A5CFF7AB048FF4BC13FFFF6835FFFEA885DFFEA88
        5DFFEA885DFFF3845EFF2BCD39FF39C83CFF39C83CFF2BC42EFFFFFFFFFFC154
        20FFC86739FFCC6B3DFF91A84CFFFC8160FFFB8160FFEA885DFFEA885DFFEA88
        5DFFEA885DFFF1855EFF22D037FF39C83CFF2FCB3AFF1FC122FFFFFFFFFFFDFB
        FAFFC76638FFB06A36FFFF8161FFDD8C5AFFEE865DFFEA885DFFEA885DFFEA88
        5DFFEA885DFFEA885DFFF8835FFFC29655FF24CF38FFE9F8E9FFFFFFFFFFFFFF
        FFFFD17F58FF837D34FF34D03CFF29CD39FFDE8C5AFFF2845EFFEA875DFFEA87
        5DFFEA885DFFEA885DFFFF7F61FF31CA3AFF4BCD4EFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD48560FF718231FF39C83CFF38C83BFF1CD236FF45C33EFFF982
        5FFFEA885DFFEB875DFFCC9257FF48CD4CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF1FB424FF21CA2FFFF9815EFFF1855EFFEA86
        5BFFED8055FF12C520FFE9F9EAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6C59DFFEB916AFFEA885EFFEB90
        69FFF4BBA4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      TabOrder = 3
    end
  end
  object MainMenu: TMainMenu
    Images = ImageList
    Left = 184
    Top = 136
    object Cadastros1: TMenuItem
      Caption = 'C&adastros'
      object CadastroChuck1: TMenuItem
        Action = ActionCadastroChuck
      end
      object BreakingBad1: TMenuItem
        Action = ActionCadastroBB
      end
      object CadastroPases1: TMenuItem
        Action = ActionCadastroPais
      end
      object GeraQrCode1: TMenuItem
        Action = ActionGeraQrCode
      end
    end
  end
  object ActionList: TActionList
    Images = ImageList
    Left = 536
    Top = 144
    object ActionCadastroChuck: TAction
      Caption = 'Cadastro Chuck'
      ImageIndex = 0
      OnExecute = ActionCadastroChuckExecute
    end
    object ActionCadastroBB: TAction
      Caption = 'Breaking Bad'
      ImageIndex = 1
      OnExecute = ActionCadastroBBExecute
    end
    object ActionCadastroPais: TAction
      Caption = 'Cadastro Pa'#237'ses'
      ImageIndex = 2
      OnExecute = ActionCadastroPaisExecute
    end
    object ActionGeraQrCode: TAction
      Caption = 'Gera QrCode'
      OnExecute = ActionGeraQrCodeExecute
    end
  end
  object ImageList: TImageList
    Left = 536
    Top = 208
    Bitmap = {
      494C010103000800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF174800FF395C13FF294800FF495C24FF2F4204FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFC25826FFC55F2FFFC76537FFC76638FFC76537FFC55F2FFFC358
      26FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF303235FF000000FF000000FF6F7179FF000000FF000000FFBBBB
      BBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF75955BFFD5DECEFF667D48FF96A482FFFFFFFFFFACB49BFF7885
      5DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD284
      5EFFC76637FFCA6639FFC76739FFC86739FFC66536FFC46335FFCC6B3DFFD371
      45FFCE6C3EFFCF815BFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF444646FF141616FFE7E7E7FF121616FF111314FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF739559FF002A00FFB2BFA4FFAEB99FFFF9F9F6FF4B5C26FFE0E3
      DAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD07D55FFC867
      39FFCD6539FF08A52BFFC96437FFDB7A4EFFEC8A5FFFEA885EFFE9875CFFEA88
      5DFFEA885DFFF98360FFF19776FFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF0B0E0EFF000000FF020606FF151717FF000000FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF69914FFFCEDAC6FF1A4700FF677F4AFFFFFFFFFFA0A98DFF9DA7
      8AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDF9F8FFC76638FFC867
      39FFCF6439FF1C9A2BFF50C643FFFA8160FFEA885DFFEA885DFFEA885DFFEA88
      5DFFEC875DFF1ED137FF24CF37FFFFF7FBFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF171C1DFF0E0F0FFF232828FF141616FF000000FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF749B5BFF0C4600FF7E9967FF7C9464FF405F1BFFFFFFFFFFA8B0
      96FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC15320FFC86739FFC867
      39FFCB6338FF2BD33CFF39C83CFF33CA3AFFFA8260FFEA875DFFEA885DFFEA88
      5DFFEA875DFF3DC63CFF39C83CFF48B22BFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF272B2CFF202424FF1C1F1FFF181916FF3C588BFFC5D5
      F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF437A23FFC7D6BDFF225400FF335A0DFF3E611AFFFFFFFFFFB4BB
      A5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBC8B8FFC35B2AFFC86739FFC867
      39FFCE6138FF2BCD39FF39C83CFF37C83BFFDB8D5AFFF3845EFFEA885DFFEA88
      5DFFEA885DFFCC9257FF38C83BFF20C72BFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF6296F1FFCDCDCDFFA5D0B7FF08142BFF082B5EFF315081FF4068
      B3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF004D00FF0E5100FF205700FF4E742DFFA1B48EFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD07E56FFC66435FFC86739FFC766
      38FFFC8664FF31CA3AFF39C83CFF39C83CFF2FCB3AFF56BD41FFEA885DFFEA88
      5DFFEA885DFFF5845FFF37C83BFF2EC937FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF96C0FAFF09317FFF604708FF002D75FF0A316BFF28406CFF577C
      BDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF839876FF859C75FF849E75FF839F
      74FF84A374FF799D68FF7A9A69FF7B986AFF789266FF708B5CFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC76537FFC76638FFC86739FFC463
      35FFBE9955FF39C83CFF39C83CFF39C83CFF2CCC39FF4BC03FFFEA875DFFEA87
      5DFF91A84CFF76B147FF39C73CFF34C93BFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF785D14FF667F6CFFD6B027FF0F5197FF0D59ABFFCBA927FF4D3E
      05FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF204700FF1B4900FF104800FF1D59
      00FF1B5F00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFCACFBFFFA7AF95FFD07E57FFC66435FFC86739FFCB6A
      3CFFFA8160FF2FCB3AFF39C83CFF20D037FFFF7F61FFEB875DFFEA885DFFFB81
      60FF34C93BFF39C83CFF39C83CFF33C738FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFBEC0C4FF373C44FF8BB8F1FF5A654DFF0B3D80FF756213FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF224600FF8A9F74FFDCE4D6FF124C
      00FF1A5900FFFFFFFFFF717F55FF79865EFF717F55FFB9C0ABFFFFFFFFFFBDC3
      AFFFCDD2C3FFF1F2EEFFA1AA8FFF8B9674FFEBCABAFFC35B29FFC86739FFCE6D
      40FFE48A5CFF7AB048FF4BC13FFFF6835FFFEA885DFFEA885DFFEA885DFFF384
      5EFF2BCD39FF39C83CFF39C83CFF2BC42EFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF000029FF000035FF556783FF494335FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F3F00FFC2CCB6FF174500FF7797
      5FFF0F4E00FF858C6BFFFFFFFFFF2C4001FF384B11FFFFFFFFFF6A794DFFFFFF
      FFFFFFFFFFFFFFFFFFFFF7F7F5FF9CA688FFFFFFFFFFC15420FFC86739FFCC6B
      3DFF91A84CFFFC8160FFFB8160FFEA885DFFEA885DFFEA885DFFEA885DFFF185
      5EFF22D037FF39C83CFF2FCB3AFF1FC122FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFAFDFEFF648ECEFF95BDF0FF2A4987FF2F3034FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF203D00FFB7C1A8FFA8B999FF2554
      00FF3A6B17FF8D9475FF8F9A79FFBDC3B0FF3C4F15FFFFFFFFFF6D7B50FFFFFF
      FFFFFFFFFFFFFFFFFFFFCED3C4FFE5E7E0FFFFFFFFFFFDFBFAFFC76638FFB06A
      36FFFF8161FFDD8C5AFFEE865DFFEA885DFFEA885DFFEA885DFFEA885DFFEA88
      5DFFF8835FFFC29655FF24CF38FFE9F8E9FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF515151FF686767FF666968FF0C1124FF000000FF000000FF000000FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF223B00FFBDC6B1FF234700FF2853
      01FFD7E0D0FFFFFFFFFF808C67FF98A284FFABB39AFFFFFFFFFFC0C6B4FFE0E3
      DAFFDADED3FF68774AFFFFFFFFFF828E69FFFFFFFFFFFFFFFFFFD17F58FF837D
      34FF34D03CFF29CD39FFDE8C5AFFF2845EFFEA875DFFEA875DFFEA885DFFEA88
      5DFFFF7F61FF31CA3AFF4BCD4EFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF000000FF000000FF333233FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF233900FFC4CAB7FFDCE2D6FF2C51
      05FF154700FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFACB49BFFFFFFFFFFF9FA
      F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD485
      60FF718231FF39C83CFF38C83BFF1CD236FF45C33EFFF9825FFFEA885DFFEB87
      5DFFCC9257FF48CD4CFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF334411FF2E4103FF284400FF3051
      08FFA2B58FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF1FB424FF21CA2FFFF9815EFFF1855EFFEA865BFFED8055FF12C5
      20FFE9F9EAFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2E3E10FF344411FF31470EFF2E4B
      0CFF406022FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFD6C59DFFEB916AFFEA885EFFEB9069FFF4BBA4FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
end
