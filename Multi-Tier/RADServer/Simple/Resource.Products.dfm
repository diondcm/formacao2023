object ProdutosResource1: TProdutosResource1
  Height = 375
  Width = 750
  PixelsPerInch = 120
  object FDConnection1: TFDConnection
    Params.Strings = (
      'ConnectionDef=SQLite_Demo')
    LoginPrompt = False
    Left = 38
    Top = 20
  end
  object qryProducts: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from Products'
      '{if !SORT}order by !SORT{fi}')
    Left = 163
    Top = 20
    MacroData = <
      item
        Value = Null
        Name = 'SORT'
      end>
  end
  object dsrProducts: TEMSDataSetResource
    AllowedActions = [List, Get, Post, Put, Delete]
    DataSet = qryProducts
    ValueFields = 
      'CategoryID;Discontinued;ProductID;ProductName;QuantityPerUnit;Re' +
      'orderLevel;SupplierID;UnitPrice;UnitsInStock;UnitsOnOrder'
    Left = 163
    Top = 80
  end
end
