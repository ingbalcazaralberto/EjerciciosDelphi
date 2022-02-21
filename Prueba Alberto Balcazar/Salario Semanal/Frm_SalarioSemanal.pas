unit Frm_SalarioSemanal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFrmSalarioSemanal = class(TForm)
    PnlPrincipal: TPanel;
    LblNombre: TLabel;
    LblHorasTrabajadas: TLabel;
    EdtNombreEmpleado: TEdit;
    EdtHorasTrabajadas: TEdit;
    BtnCalcuarSalario: TButton;
    procedure EdtHorasTrabajadasKeyPress(Sender: TObject; var Key: Char);
    procedure EdtNombreEmpleadoKeyPress(Sender: TObject; var Key: Char);
    procedure BtnCalcuarSalarioClick(Sender: TObject);
  private
    { Private declarations }
    procedure validarDatos;

  public
    { Public declarations }
  end;

  const cValorHora = 15000;
  const cvalorHoraExtra = 19000;
  const cvHorasBasicasSemanales = 35;
var
  FrmSalarioSemanal: TFrmSalarioSemanal;

implementation

{$R *.dfm}

procedure TFrmSalarioSemanal.EdtHorasTrabajadasKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not(key in [#8,'0'..'9']) then
    key:=#0;
end;

procedure TFrmSalarioSemanal.EdtNombreEmpleadoKeyPress(Sender: TObject; var Key: Char);
begin
  if not(key in [#8,'A'..'Z','a'..'z','Ñ','ñ',#032,'Ó','Ú','Í','Á','É','ó','ú','í','á','é']) then
    key:=#0;
end;

procedure TFrmSalarioSemanal.BtnCalcuarSalarioClick(Sender: TObject);
var
  vSalario,
  vTotalHoras,
  vHorasTrabajadas,
  vHorasExtras : Double;

  I : integer;
  s:string;


  first:integer;
begin
  vHorasExtras := 0;
  vHorasTrabajadas := 0;

  validarDatos;

  vTotalHoras := StrToInt(EdtHorasTrabajadas.Text);

  if vTotalHoras > cvHorasBasicasSemanales then
  begin
    vHorasExtras := vTotalHoras - cvHorasBasicasSemanales;
    vHorasTrabajadas := vTotalHoras-vHorasExtras;
  end
  else
    vHorasTrabajadas := vTotalHoras;

  vSalario := (vHorasTrabajadas*cValorHora) + (vHorasExtras*cvalorHoraExtra);

  MessageDlg('Al empleado '+ EdtNombreEmpleado.Text+' se le debe pagar la suma de '+
              formatfloat('###,###',vSalario)+ ' pesos.',  mtInformation,[mbOK], 0);


end;

procedure TFrmSalarioSemanal.validarDatos;
begin
  if EdtNombreEmpleado.Text = EmptyStr then
   Raise Exception.Create('Debe digitar el nombre del empleado');

  if StrToIntDef(EdtHorasTrabajadas.Text,-1) = 0 then
   Raise Exception.Create('Las horas trabajadas del empleado deben ser mayor a 0');

  if StrToIntDef(EdtHorasTrabajadas.Text,-1) = -1 then
   Raise Exception.Create('Debe digitar las horas trabajadas del empleado en la semana');
end;

end.
