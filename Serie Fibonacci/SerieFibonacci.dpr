program SerieFibonacci;

uses
  Forms,
  Frn_Principal in 'Frn_Principal.pas' {FrmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
