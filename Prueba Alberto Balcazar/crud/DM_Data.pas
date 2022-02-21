unit DM_Data;

interface

uses
  SysUtils, Classes, Provider, DBClient, ADODB, DB;

type
  TDmData = class(TDataModule)
    ADOConnecion: TADOConnection;
    ADOQClientes: TADOQuery;
    ADOQActivos: TADOQuery;
    ADOQTipoIdentificacion: TADOQuery;
    ADOTClientes: TADOTable;
    ADOTClientescodigo_cliente: TWideStringField;
    ADOTClientesnombre_cliente: TWideStringField;
    ADOTClientesnombre_representante: TWideStringField;
    ADOTClientestelefono_principal: TWideStringField;
    ADOTClientestelefono_secundario: TWideStringField;
    ADOTClientesemail: TWideStringField;
    ADOTClientespersona_contacto: TWideStringField;
    ADOTClientesid_tipo_identificacion: TIntegerField;
    ADOTClientesnumero_identificacion: TWideStringField;
    ADOTClientestipo_id: TStringField;
    procedure ADOTClientesCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CargarDatos;
    procedure CargarTodos;
    procedure Registrar;
    procedure BuscarCliente(pCodigoCliente:string);
    procedure EjecutarConsulta(pSqlEdita,pSqlEditaValores: String; pAccion:char);
    procedure EditarCliente(pidCliente:string);
  end;

var
  DmData: TDmData;

implementation

{$R *.dfm}

{ TDmData }

procedure TDmData.BuscarCliente(pCodigoCliente: string);
begin
  ADOQClientes.Close;
  ADOQClientes.SQL.Clear;
  ADOQClientes.SQL.Add('SELECT id_cliente, codigo_cliente, nombre_cliente, nombre_representante, telefono_principal, telefono_secundario, '+
                          ' email, persona_contacto, id_tipo_identificacion, numero_identificacion FROM clientes WHERE numero_identificacion='+QuotedStr(pCodigoCliente));
  ADOQClientes.Open;

  ADOQActivos.Close;
  ADOQActivos.SQL.Clear;
  ADOQActivos.SQL.Add('SELECT id_cliente, valor_activos, valor_pasivos, valor_patrimonio FROM activos_cliente WHERE id_cliente='+QuotedStr(ADOQClientes.FieldByName('id_cliente').AsString));
  ADOQActivos.Open;

end;

procedure TDmData.CargarDatos;
begin
  ADOQTipoIdentificacion.Close;
  ADOQTipoIdentificacion.Open;
end;

procedure TDmData.CargarTodos;
begin
  ADOTClientes.Close;
  ADOTClientes.Open;
end;

procedure TDmData.EditarCliente(pidCliente: string);
begin
 ADOQClientes.Close;
 ADOQClientes.SQL.Clear;
 ADOQClientes.SQL.Add('SELECT * FROM clientes WHERE id_cliente='+QuotedStr(pidCliente));
 ADOQClientes.open;
 ADOQClientes.Edit;

 ADOQActivos.Close;
 ADOQActivos.SQL.Clear;
 ADOQActivos.SQL.Add('SELECT * FROM activos_cliente WHERE id_cliente='+QuotedStr(pidCliente));
 ADOQActivos.open;

 //Si el cliente no tiene datos en activos_cliente se debe poner en modos inserción, sino se debe editar el registro
 if ADOQActivos.RecordCount>0 then
   ADOQActivos.Edit
 else
  ADOQActivos.Insert;
end;

procedure TDmData.EjecutarConsulta(pSqlEdita,pSqlEditaValores: String; pAccion:char);
var
  TADOGenerico:TADOQuery;
begin
  ADOQClientes.Close;
  ADOQClientes.SQL.Clear;
  ADOQClientes.SQL.Add(pSqlEdita);
  ADOQClientes.ExecSQL;

  if pSqlEditaValores <> EmptyStr then
  begin
    if pAccion = '2' then
    begin
        TADOGenerico := TADOQuery.Create(Self);
        try
          TADOGenerico.Connection := ADOConnecion;
          TADOGenerico.Close;
          TADOGenerico.SQL.Clear;
          TADOGenerico.SQL.Add('SELECT id_cliente FROM clientes ORDER BY id_cliente DESC LIMIT 1');
          TADOGenerico.Open;

          pSqlEditaValores := pSqlEditaValores+QuotedStr(TADOGenerico.FieldByName('id_cliente').AsString)+')';
        finally
          TADOGenerico.Free
        end;
    end;

    ADOQActivos.Close;
    ADOQActivos.SQL.Clear;
    ADOQActivos.SQL.Add(pSqlEditaValores);
    ADOQActivos.ExecSQL;
  end;
end;

procedure TDmData.Registrar;
begin
  ADOQClientes.Close;
  ADOQClientes.SQL.Clear;
  ADOQClientes.SQL.Add('SELECT * FROM clientes WHERE id_cliente='+'-1');
  ADOQClientes.open;
  ADOQClientes.Insert;

  ADOQActivos.Close;
  ADOQActivos.SQL.Clear;
  ADOQActivos.SQL.Add('SELECT * FROM activos_cliente WHERE id_cliente='+'-1');
  ADOQActivos.open;
  ADOQActivos.Insert;
end;

procedure TDmData.ADOTClientesCalcFields(DataSet: TDataSet);
var
  TADOGenerico:TADOQuery;
begin

        TADOGenerico := TADOQuery.Create(Self);
        try
          TADOGenerico.Connection := ADOConnecion;
          TADOGenerico.Close;
          TADOGenerico.SQL.Clear;
          TADOGenerico.SQL.Add('SELECT codigo_identificacion FROM cat_tipo_identificacion WHERE id_tipo_identificacion='+QuotedStr(ADOTClientes.FieldByName('id_tipo_identificacion').AsString));
          TADOGenerico.Open;
           ADOTClientes.FieldByName('tipo_id').AsString := TADOGenerico.FieldByName('codigo_identificacion').AsString;
        finally
          TADOGenerico.Free
        end;


end;

end.
