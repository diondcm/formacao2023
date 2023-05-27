object dmdConexao: TdmdConexao
  Height = 750
  Width = 1000
  PixelsPerInch = 120
  object FDConnection: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\AQUASOFT\Documents\formacao2023\db\cadastroTem' +
        'plate.db'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 376
    Top = 208
  end
end
