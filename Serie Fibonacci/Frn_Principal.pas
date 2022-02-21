unit Frn_Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFrmPrincipal = class(TForm)
    PnlPrincipal: TPanel;
    LblEtiqueta1: TLabel;
    BtnSerieFibonacci: TButton;
    EdtNumero: TEdit;
    EdtListaNumeros: TEdit;
    procedure BtnSerieFibonacciClick(Sender: TObject);
    procedure EdtNumeroKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    function SerieFibonacci(pNumero:integer):integer;
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

procedure TFrmPrincipal.BtnSerieFibonacciClick(Sender: TObject);
var
  vEnesimoTermino,
  i:integer;
  vSerie:TStringList;
begin
  vEnesimoTermino:= StrToIntDef(EdtNumero.Text,0);
  EdtListaNumeros.Clear;

  vSerie:= TStringList.Create;
  try
    if (vEnesimoTermino < 1) or (vEnesimoTermino > 20) then
      MessageDlg('El número debe estar entre 1 y 20', mtError, [mbOK], 0)
    else
    begin
      for i:=0 to vEnesimoTermino-1 do
      vSerie.Add(IntToStr(SerieFibonacci(i)))
    end;

    EdtListaNumeros.Text := vSerie.CommaText;
  finally
    vSerie.Free;
  end;
end;

procedure TFrmPrincipal.EdtNumeroKeyPress(Sender: TObject; var Key: Char);
begin
  if not(key in [#8,'0'..'9']) then
    key:=#0;
end;

function TFrmPrincipal.SerieFibonacci(pNumero: integer):integer;
begin
  if pNumero in [0,1] then
    Result := 1
  else //f(n) = f(n-1) + f(n-2)
    Result:= SerieFibonacci(pNumero-1) + SerieFibonacci(pNumero-2);
end;

end.

