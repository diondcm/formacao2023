unit Classe.ZipHelper;

interface

uses
  System.SysUtils, System.Zip, System.IOUtils;

type
  TZipHelper = class helper for TZipFile
  public
    class procedure DesZippaArquivos(ArqZip: string; CriarPasta: string = '');
    class procedure ZipparArquivos(ArqZipSaida: string; listaArqs: TArray<string>);

  end;

implementation

{ TZipHelper }

class procedure TZipHelper.DesZippaArquivos(ArqZip, CriarPasta: string);
begin
  var zip: TZipFile := TZipFile.Create;
  try
    zip.Open(ArqZip, zmRead);

    var outPutDir: string := IncludeTrailingPathDelimiter(ExtractFilePath(ArqZip));
    if CriarPasta <> '' then
    begin
      outPutDir := IncludeTrailingPathDelimiter(IncludeTrailingPathDelimiter(outPutDir) + CriarPasta);
      TDirectory.CreateDirectory(outPutDir)
    end;

    zip.ExtractAll(outPutDir);

  finally
    zip.Free;
  end;
end;

class procedure TZipHelper.ZipparArquivos(ArqZipSaida: string;
  listaArqs: TArray<string>);
begin
  DeleteFile(ArqZipSaida);

  var zip: TZipFile := TZipFile.Create;
  try
    zip.Open(ArqZipSaida, zmWrite);

    for var arq: string in listaArqs do
    begin
      zip.Add(arq);
    end;

  finally
    zip.Free;
  end;
end;

end.
