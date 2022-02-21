program SalarioSemanal;

uses
  Forms,
  Frm_SalarioSemanal in 'Frm_SalarioSemanal.pas' {FrmSalarioSemanal};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmSalarioSemanal, FrmSalarioSemanal);
  Application.Run;
end.
