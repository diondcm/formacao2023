unit Classe.OpenAI.Image;

interface

type
  TOpenAIItem = class
  private
    FImage: string;
  public
    property Image: string read FImage write FImage;
  end;

  TOpenAI = class
  private
    FStatus: string;
    FItems: TArray<TOpenAIItem>;
  public
    property Status: string read FStatus write FStatus;
    property Items: TArray<TOpenAIItem> read FItems;
  end;

  TOpenAIRoot = class
  private
    Fopenai: TOpenAI;
  public
    property openai: TOpenAI read Fopenai write Fopenai;
    property deepai: TOpenAI read Fopenai write Fopenai;
  end;


implementation

end.
