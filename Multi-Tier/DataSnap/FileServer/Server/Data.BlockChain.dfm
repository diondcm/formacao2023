object dmBlockChain: TdmBlockChain
  Height = 750
  Width = 1000
  PixelsPerInch = 120
  object RESTClient1: TRESTClient
    BaseURL = 
      'https://blockchain.info/rawblock/0000000000000bae09a7a393a8acded' +
      '75aa67e46cb81f7acaa5ad94f9eacd103'
    Params = <>
    SynchronizedEvents = False
    Left = 96
    Top = 104
  end
  object RESTRequest1: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 96
    Top = 176
  end
  object RESTResponse1: TRESTResponse
    Left = 224
    Top = 176
  end
end
