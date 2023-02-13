program RESTDWConsoleApp;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  // vers�o 2.0 ou 2.1 Indy
  uRESTDWIdBase,
  // vers�o 2.1 ICS Delphi VCL
  // uRESTDWIcsBase,

  uDM in 'src\uDM.pas' {DM: TDataModule};

var
  // vers�o 2.0 ou 2.1 Indy
  Server: TRESTDWIdServicePooler;

  // vers�o 2.1 ICS Delphi VCL
  // Server: TRESTDWIcsServicePooler;

begin
  // vers�o 2.0 ou 2.1 Indy
  Server := TRESTDWIdServicePooler.Create(nil);

  // vers�o 2.1 ICS Delphi VCL
  // Server := TRESTDWIcsServicePooler.Create(nil);
  try
    try
      // se n�o configurar nada, ele vai usar por padr�o rdwAONone e porta 8082
      // voc� pode atribuir somente 1 datamodule atrav�s desse comando:
      Server.ServerMethodClass := TDM;
      // ou v�rios comentando a linha de cima e usando as linhas de baixo:
      {
        Server.AddDataRoute('nomedarota', DMRota1);
        Server.AddDataRoute('nomedarota', DMRota2);
        Server.AddDataRoute('nomedarota', DMRota3);
        Server.AddDataRoute('nomedarota', DMRota4);
        Server.AddDataRoute('nomedarota', DMRota5);
      }
      Server.Active := true;
      Writeln('Servidor REST DataWare rodando na porta: ' +
        IntToStr(Server.ServicePort));
      Writeln('');
      Writeln('Pressione alguma tecla pra fechar a aplica��o...');
      ReadLn;
    except
      on E: Exception do
        Writeln(E.ClassName, ': ', E.Message);
    end;
  finally
    Server.Free;
  end;

end.
