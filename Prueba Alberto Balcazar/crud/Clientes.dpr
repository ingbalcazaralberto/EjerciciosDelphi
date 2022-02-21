program Clientes;

uses
  Forms,
  Frm_principal in 'Frm_principal.pas' {FrmPrincipal},
  DM_Data in 'DM_Data.pas' {DmData: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
