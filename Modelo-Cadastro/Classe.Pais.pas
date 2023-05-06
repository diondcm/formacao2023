unit Classe.Pais;

interface

uses
  Pkg.Json.DTO, System.Generics.Collections, REST.Json.Types;

{$M+}

type
  TAra = class;
  TBre = class;
  TBRL = class;
  TCapitalInfo = class;
  TCar = class;
  TCes = class;
  TCoatOfArms = class;
  TCurrencies = class;
  TCym = class;
  TDemonyms = class;
  TDeu = class;
  TEng = class;
  TEst = class;
  TFin = class;
  TFlags = class;
  TFra = class;
  TGini = class;
  THrv = class;
  THun = class;
  TIdd = class;
  TIta = class;
  TJpn = class;
  TKor = class;
  TLanguages = class;
  TMaps = class;
  TName = class;
  TNativeName = class;
  TNld = class;
  TPer = class;
  TPol = class;
  TPor = class;
  TPostalCode = class;
  TRus = class;
  TSlk = class;
  TSpa = class;
  TSrp = class;
  TSwe = class;
  TTranslations = class;
  TTur = class;
  TUrd = class;
  TZho = class;

  TPostalCode = class
  private
    FFormat: string;
    FRegex: string;
  published
    property Format: string read FFormat write FFormat;
    property Regex: string read FRegex write FRegex;
  end;
  
  TCapitalInfo = class(TJsonDTO)
  private
    [JSONName('latlng')]
    FLatlngArray: TArray<Double>;
    [JSONMarshalled(False)]
    FLatlng: TList<Double>;
    function GetLatlng: TList<Double>;
  protected
    function GetAsJson: string; override;
  published
    property Latlng: TList<Double> read GetLatlng;
  public
    destructor Destroy; override;
  end;
  
  TCoatOfArms = class
  private
    FPng: string;
    FSvg: string;
  published
    property Png: string read FPng write FPng;
    property Svg: string read FSvg write FSvg;
  end;
  
  TFlags = class
  private
    FAlt: string;
    FPng: string;
    FSvg: string;
  published
    property Alt: string read FAlt write FAlt;
    property Png: string read FPng write FPng;
    property Svg: string read FSvg write FSvg;
  end;
  
  TCar = class(TJsonDTO)
  private
    FSide: string;
    [JSONName('signs')]
    FSignsArray: TArray<string>;
    [JSONMarshalled(False)]
    FSigns: TList<string>;
    function GetSigns: TList<string>;
  protected
    function GetAsJson: string; override;
  published
    property Side: string read FSide write FSide;
    property Signs: TList<string> read GetSigns;
  public
    destructor Destroy; override;
  end;
  
  TGini = class
  private
    [JSONName('2019')]
    F_2019: Double;
  published
    property _2019: Double read F_2019 write F_2019;
  end;
  
  TMaps = class
  private
    FGoogleMaps: string;
    FOpenStreetMaps: string;
  published
    property GoogleMaps: string read FGoogleMaps write FGoogleMaps;
    property OpenStreetMaps: string read FOpenStreetMaps write FOpenStreetMaps;
  end;
  
  TFra = class
  private
    FCommon: string;
    FF: string;
    FM: string;
    FOfficial: string;
  published
    property Common: string read FCommon write FCommon;
    property F: string read FF write FF;
    property M: string read FM write FM;
    property Official: string read FOfficial write FOfficial;
  end;
  
  TEng = class
  private
    FF: string;
    FM: string;
  published
    property F: string read FF write FF;
    property M: string read FM write FM;
  end;
  
  TDemonyms = class
  private
    FEng: TEng;
    FFra: TFra;
  published
    property Eng: TEng read FEng;
    property Fra: TFra read FFra;
  public
    constructor Create;
    destructor Destroy; override;
  end;
  
  TZho = class
  private
    FCommon: string;
    FOfficial: string;
  published
    property Common: string read FCommon write FCommon;
    property Official: string read FOfficial write FOfficial;
  end;
  
  TUrd = class
  private
    FCommon: string;
    FOfficial: string;
  published
    property Common: string read FCommon write FCommon;
    property Official: string read FOfficial write FOfficial;
  end;
  
  TTur = class
  private
    FCommon: string;
    FOfficial: string;
  published
    property Common: string read FCommon write FCommon;
    property Official: string read FOfficial write FOfficial;
  end;
  
  TSwe = class
  private
    FCommon: string;
    FOfficial: string;
  published
    property Common: string read FCommon write FCommon;
    property Official: string read FOfficial write FOfficial;
  end;
  
  TSrp = class
  private
    FCommon: string;
    FOfficial: string;
  published
    property Common: string read FCommon write FCommon;
    property Official: string read FOfficial write FOfficial;
  end;
  
  TSpa = class
  private
    FCommon: string;
    FOfficial: string;
  published
    property Common: string read FCommon write FCommon;
    property Official: string read FOfficial write FOfficial;
  end;
  
  TSlk = class
  private
    FCommon: string;
    FOfficial: string;
  published
    property Common: string read FCommon write FCommon;
    property Official: string read FOfficial write FOfficial;
  end;
  
  TRus = class
  private
    FCommon: string;
    FOfficial: string;
  published
    property Common: string read FCommon write FCommon;
    property Official: string read FOfficial write FOfficial;
  end;
  
  TPor = class
  private
    FCommon: string;
    FOfficial: string;
  published
    property Common: string read FCommon write FCommon;
    property Official: string read FOfficial write FOfficial;
  end;
  
  TPol = class
  private
    FCommon: string;
    FOfficial: string;
  published
    property Common: string read FCommon write FCommon;
    property Official: string read FOfficial write FOfficial;
  end;
  
  TPer = class
  private
    FCommon: string;
    FOfficial: string;
  published
    property Common: string read FCommon write FCommon;
    property Official: string read FOfficial write FOfficial;
  end;
  
  TNld = class
  private
    FCommon: string;
    FOfficial: string;
  published
    property Common: string read FCommon write FCommon;
    property Official: string read FOfficial write FOfficial;
  end;
  
  TKor = class
  private
    FCommon: string;
    FOfficial: string;
  published
    property Common: string read FCommon write FCommon;
    property Official: string read FOfficial write FOfficial;
  end;
  
  TJpn = class
  private
    FCommon: string;
    FOfficial: string;
  published
    property Common: string read FCommon write FCommon;
    property Official: string read FOfficial write FOfficial;
  end;
  
  TIta = class
  private
    FCommon: string;
    FOfficial: string;
  published
    property Common: string read FCommon write FCommon;
    property Official: string read FOfficial write FOfficial;
  end;
  
  THun = class
  private
    FCommon: string;
    FOfficial: string;
  published
    property Common: string read FCommon write FCommon;
    property Official: string read FOfficial write FOfficial;
  end;
  
  THrv = class
  private
    FCommon: string;
    FOfficial: string;
  published
    property Common: string read FCommon write FCommon;
    property Official: string read FOfficial write FOfficial;
  end;
  
  TFin = class
  private
    FCommon: string;
    FOfficial: string;
  published
    property Common: string read FCommon write FCommon;
    property Official: string read FOfficial write FOfficial;
  end;
  
  TEst = class
  private
    FCommon: string;
    FOfficial: string;
  published
    property Common: string read FCommon write FCommon;
    property Official: string read FOfficial write FOfficial;
  end;
  
  TDeu = class
  private
    FCommon: string;
    FOfficial: string;
  published
    property Common: string read FCommon write FCommon;
    property Official: string read FOfficial write FOfficial;
  end;
  
  TCym = class
  private
    FCommon: string;
    FOfficial: string;
  published
    property Common: string read FCommon write FCommon;
    property Official: string read FOfficial write FOfficial;
  end;
  
  TCes = class
  private
    FCommon: string;
    FOfficial: string;
  published
    property Common: string read FCommon write FCommon;
    property Official: string read FOfficial write FOfficial;
  end;
  
  TBre = class
  private
    FCommon: string;
    FOfficial: string;
  published
    property Common: string read FCommon write FCommon;
    property Official: string read FOfficial write FOfficial;
  end;
  
  TAra = class
  private
    FCommon: string;
    FOfficial: string;
  published
    property Common: string read FCommon write FCommon;
    property Official: string read FOfficial write FOfficial;
  end;
  
  TTranslations = class
  private
    FAra: TAra;
    FBre: TBre;
    FCes: TCes;
    FCym: TCym;
    FDeu: TDeu;
    FEst: TEst;
    FFin: TFin;
    FFra: TFra;
    FHrv: THrv;
    FHun: THun;
    FIta: TIta;
    FJpn: TJpn;
    FKor: TKor;
    FNld: TNld;
    FPer: TPer;
    FPol: TPol;
    FPor: TPor;
    FRus: TRus;
    FSlk: TSlk;
    FSpa: TSpa;
    FSrp: TSrp;
    FSwe: TSwe;
    FTur: TTur;
    FUrd: TUrd;
    FZho: TZho;
  published
    property Ara: TAra read FAra;
    property Bre: TBre read FBre;
    property Ces: TCes read FCes;
    property Cym: TCym read FCym;
    property Deu: TDeu read FDeu;
    property Est: TEst read FEst;
    property Fin: TFin read FFin;
    property Fra: TFra read FFra;
    property Hrv: THrv read FHrv;
    property Hun: THun read FHun;
    property Ita: TIta read FIta;
    property Jpn: TJpn read FJpn;
    property Kor: TKor read FKor;
    property Nld: TNld read FNld;
    property Per: TPer read FPer;
    property Pol: TPol read FPol;
    property Por: TPor read FPor;
    property Rus: TRus read FRus;
    property Slk: TSlk read FSlk;
    property Spa: TSpa read FSpa;
    property Srp: TSrp read FSrp;
    property Swe: TSwe read FSwe;
    property Tur: TTur read FTur;
    property Urd: TUrd read FUrd;
    property Zho: TZho read FZho;
  public
    constructor Create;
    destructor Destroy; override;
  end;
  
  TLanguages = class
  private
    FPor: string;
  published
    property Por: string read FPor write FPor;
  end;
  
  TIdd = class(TJsonDTO)
  private
    FRoot: string;
    [JSONName('suffixes')]
    FSuffixesArray: TArray<string>;
    [JSONMarshalled(False)]
    FSuffixes: TList<string>;
    function GetSuffixes: TList<string>;
  protected
    function GetAsJson: string; override;
  published
    property Root: string read FRoot write FRoot;
    property Suffixes: TList<string> read GetSuffixes;
  public
    destructor Destroy; override;
  end;
  
  TBRL = class
  private
    FName: string;
    FSymbol: string;
  published
    property Name: string read FName write FName;
    property Symbol: string read FSymbol write FSymbol;
  end;
  
  TCurrencies = class
  private
    FBRL: TBRL;
  published
    property BRL: TBRL read FBRL;
  public
    constructor Create;
    destructor Destroy; override;
  end;
  
  TNativeName = class
  private
    FPor: TPor;
  published
    property Por: TPor read FPor;
  public
    constructor Create;
    destructor Destroy; override;
  end;
  
  TName = class
  private
    FCommon: string;
    FNativeName: TNativeName;
    FOfficial: string;
  published
    property Common: string read FCommon write FCommon;
    property NativeName: TNativeName read FNativeName;
    property Official: string read FOfficial write FOfficial;
  public
    constructor Create;
    destructor Destroy; override;
  end;
  
  TItems = class(TJsonDTO)
  private
    [JSONName('altSpellings')]
    FAltSpellingsArray: TArray<string>;
    [JSONMarshalled(False)]
    FAltSpellings: TList<string>;
    FArea: Double;
    [JSONName('borders')]
    FBordersArray: TArray<string>;
    [JSONMarshalled(False)]
    FBorders: TList<string>;
    [JSONName('capital')]
    FCapitalArray: TArray<string>;
    [JSONMarshalled(False)]
    FCapital: TList<string>;
    FCapitalInfo: TCapitalInfo;
    FCar: TCar;
    FCca2: string;
    FCca3: string;
    FCcn3: string;
    FCioc: string;
    FCoatOfArms: TCoatOfArms;
    [JSONName('continents')]
    FContinentsArray: TArray<string>;
    [JSONMarshalled(False)]
    FContinents: TList<string>;
    FCurrencies: TCurrencies;
    FDemonyms: TDemonyms;
    FFifa: string;
    FFlag: string;
    FFlags: TFlags;
    FGini: TGini;
    FIdd: TIdd;
    FIndependent: Boolean;
    FLandlocked: Boolean;
    FLanguages: TLanguages;
    [JSONName('latlng')]
    FLatlngArray: TArray<Double>;
    [JSONMarshalled(False)]
    FLatlng: TList<Double>;
    FMaps: TMaps;
    FName: TName;
    FPopulation: Integer;
    FPostalCode: TPostalCode;
    FRegion: string;
    FStartOfWeek: string;
    FStatus: string;
    FSubregion: string;
    [JSONName('timezones')]
    FTimezonesArray: TArray<string>;
    [JSONMarshalled(False)]
    FTimezones: TList<string>;
    [JSONName('tld')]
    FTldArray: TArray<string>;
    [JSONMarshalled(False)]
    FTld: TList<string>;
    FTranslations: TTranslations;
    FUnMember: Boolean;
    function GetAltSpellings: TList<string>;
    function GetBorders: TList<string>;
    function GetCapital: TList<string>;
    function GetContinents: TList<string>;
    function GetLatlng: TList<Double>;
    function GetTimezones: TList<string>;
    function GetTld: TList<string>;
  protected
    function GetAsJson: string; override;
  published
    property AltSpellings: TList<string> read GetAltSpellings;
    property Area: Double read FArea write FArea;
    property Borders: TList<string> read GetBorders;
    property Capital: TList<string> read GetCapital;
    property CapitalInfo: TCapitalInfo read FCapitalInfo;
    property Car: TCar read FCar;
    property Cca2: string read FCca2 write FCca2;
    property Cca3: string read FCca3 write FCca3;
    property Ccn3: string read FCcn3 write FCcn3;
    property Cioc: string read FCioc write FCioc;
    property CoatOfArms: TCoatOfArms read FCoatOfArms;
    property Continents: TList<string> read GetContinents;
    property Currencies: TCurrencies read FCurrencies;
    property Demonyms: TDemonyms read FDemonyms;
    property Fifa: string read FFifa write FFifa;
    property Flag: string read FFlag write FFlag;
    property Flags: TFlags read FFlags;
    property Gini: TGini read FGini;
    property Idd: TIdd read FIdd;
    property Independent: Boolean read FIndependent write FIndependent;
    property Landlocked: Boolean read FLandlocked write FLandlocked;
    property Languages: TLanguages read FLanguages;
    property Latlng: TList<Double> read GetLatlng;
    property Maps: TMaps read FMaps;
    property Name: TName read FName;
    property Population: Integer read FPopulation write FPopulation;
    property PostalCode: TPostalCode read FPostalCode;
    property Region: string read FRegion write FRegion;
    property StartOfWeek: string read FStartOfWeek write FStartOfWeek;
    property Status: string read FStatus write FStatus;
    property Subregion: string read FSubregion write FSubregion;
    property Timezones: TList<string> read GetTimezones;
    property Tld: TList<string> read GetTld;
    property Translations: TTranslations read FTranslations;
    property UnMember: Boolean read FUnMember write FUnMember;
  public
    constructor Create; override;
    destructor Destroy; override;
  end;
  
  TPais = class(TJsonDTO)
  private
    [JSONName('Items'), JSONMarshalled(False)]
    FItemsArray: TArray<TItems>;
    [GenericListReflect]
    FItems: TObjectList<TItems>;
    function GetItems: TObjectList<TItems>;
  protected
    function GetAsJson: string; override;
  published
    property Items: TObjectList<TItems> read GetItems;
  public
    destructor Destroy; override;
  end;
  
implementation

{ TCapitalInfo }

destructor TCapitalInfo.Destroy;
begin
  GetLatlng.Free;
  inherited;
end;

function TCapitalInfo.GetLatlng: TList<Double>;
begin
  Result := List<Double>(FLatlng, FLatlngArray);
end;

function TCapitalInfo.GetAsJson: string;
begin
  RefreshArray<Double>(FLatlng, FLatlngArray);
  Result := inherited;
end;

{ TCar }

destructor TCar.Destroy;
begin
  GetSigns.Free;
  inherited;
end;

function TCar.GetSigns: TList<string>;
begin
  Result := List<string>(FSigns, FSignsArray);
end;

function TCar.GetAsJson: string;
begin
  RefreshArray<string>(FSigns, FSignsArray);
  Result := inherited;
end;

{ TDemonyms }

constructor TDemonyms.Create;
begin
  inherited;
  FEng := TEng.Create;
  FFra := TFra.Create;
end;

destructor TDemonyms.Destroy;
begin
  FEng.Free;
  FFra.Free;
  inherited;
end;

{ TTranslations }

constructor TTranslations.Create;
begin
  inherited;
  FAra := TAra.Create;
  FBre := TBre.Create;
  FCes := TCes.Create;
  FCym := TCym.Create;
  FDeu := TDeu.Create;
  FEst := TEst.Create;
  FFin := TFin.Create;
  FFra := TFra.Create;
  FHrv := THrv.Create;
  FHun := THun.Create;
  FIta := TIta.Create;
  FJpn := TJpn.Create;
  FKor := TKor.Create;
  FNld := TNld.Create;
  FPer := TPer.Create;
  FPol := TPol.Create;
  FPor := TPor.Create;
  FRus := TRus.Create;
  FSlk := TSlk.Create;
  FSpa := TSpa.Create;
  FSrp := TSrp.Create;
  FSwe := TSwe.Create;
  FTur := TTur.Create;
  FUrd := TUrd.Create;
  FZho := TZho.Create;
end;

destructor TTranslations.Destroy;
begin
  FAra.Free;
  FBre.Free;
  FCes.Free;
  FCym.Free;
  FDeu.Free;
  FEst.Free;
  FFin.Free;
  FFra.Free;
  FHrv.Free;
  FHun.Free;
  FIta.Free;
  FJpn.Free;
  FKor.Free;
  FNld.Free;
  FPer.Free;
  FPol.Free;
  FPor.Free;
  FRus.Free;
  FSlk.Free;
  FSpa.Free;
  FSrp.Free;
  FSwe.Free;
  FTur.Free;
  FUrd.Free;
  FZho.Free;
  inherited;
end;

{ TIdd }

destructor TIdd.Destroy;
begin
  GetSuffixes.Free;
  inherited;
end;

function TIdd.GetSuffixes: TList<string>;
begin
  Result := List<string>(FSuffixes, FSuffixesArray);
end;

function TIdd.GetAsJson: string;
begin
  RefreshArray<string>(FSuffixes, FSuffixesArray);
  Result := inherited;
end;

{ TCurrencies }

constructor TCurrencies.Create;
begin
  inherited;
  FBRL := TBRL.Create;
end;

destructor TCurrencies.Destroy;
begin
  FBRL.Free;
  inherited;
end;

{ TNativeName }

constructor TNativeName.Create;
begin
  inherited;
  FPor := TPor.Create;
end;

destructor TNativeName.Destroy;
begin
  FPor.Free;
  inherited;
end;

{ TName }

constructor TName.Create;
begin
  inherited;
  FNativeName := TNativeName.Create;
end;

destructor TName.Destroy;
begin
  FNativeName.Free;
  inherited;
end;

{ TItems }

constructor TItems.Create;
begin
  inherited;
  FName := TName.Create;
  FCurrencies := TCurrencies.Create;
  FIdd := TIdd.Create;
  FLanguages := TLanguages.Create;
  FTranslations := TTranslations.Create;
  FDemonyms := TDemonyms.Create;
  FMaps := TMaps.Create;
  FGini := TGini.Create;
  FCar := TCar.Create;
  FFlags := TFlags.Create;
  FCoatOfArms := TCoatOfArms.Create;
  FCapitalInfo := TCapitalInfo.Create;
  FPostalCode := TPostalCode.Create;
end;

destructor TItems.Destroy;
begin
  FName.Free;
  FCurrencies.Free;
  FIdd.Free;
  FLanguages.Free;
  FTranslations.Free;
  FDemonyms.Free;
  FMaps.Free;
  FGini.Free;
  FCar.Free;
  FFlags.Free;
  FCoatOfArms.Free;
  FCapitalInfo.Free;
  FPostalCode.Free;
  GetTld.Free;
  GetCapital.Free;
  GetAltSpellings.Free;
  GetLatlng.Free;
  GetBorders.Free;
  GetTimezones.Free;
  GetContinents.Free;
  inherited;
end;

function TItems.GetAltSpellings: TList<string>;
begin
  Result := List<string>(FAltSpellings, FAltSpellingsArray);
end;

function TItems.GetBorders: TList<string>;
begin
  Result := List<string>(FBorders, FBordersArray);
end;

function TItems.GetCapital: TList<string>;
begin
  Result := List<string>(FCapital, FCapitalArray);
end;

function TItems.GetContinents: TList<string>;
begin
  Result := List<string>(FContinents, FContinentsArray);
end;

function TItems.GetLatlng: TList<Double>;
begin
  Result := List<Double>(FLatlng, FLatlngArray);
end;

function TItems.GetTimezones: TList<string>;
begin
  Result := List<string>(FTimezones, FTimezonesArray);
end;

function TItems.GetTld: TList<string>;
begin
  Result := List<string>(FTld, FTldArray);
end;

function TItems.GetAsJson: string;
begin
  RefreshArray<string>(FAltSpellings, FAltSpellingsArray);
  RefreshArray<string>(FBorders, FBordersArray);
  RefreshArray<string>(FCapital, FCapitalArray);
  RefreshArray<string>(FContinents, FContinentsArray);
  RefreshArray<Double>(FLatlng, FLatlngArray);
  RefreshArray<string>(FTimezones, FTimezonesArray);
  RefreshArray<string>(FTld, FTldArray);
  Result := inherited;
end;

{ TRoot }

destructor TPais.Destroy;
begin
  GetItems.Free;
  inherited;
end;

function TPais.GetItems: TObjectList<TItems>;
begin
  Result := ObjectList<TItems>(FItems, FItemsArray);
end;

function TPais.GetAsJson: string;
begin
  RefreshArray<TItems>(FItems, FItemsArray);
  Result := inherited;
end;

end.
