unit Data.Imagens;

interface

uses
  System.SysUtils, System.Classes, System.ImageList, Vcl.ImgList, Vcl.Controls;

type
  TdmdImages = class(TDataModule)
    ImageListPrincipal: TImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmdImages: TdmdImages;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
