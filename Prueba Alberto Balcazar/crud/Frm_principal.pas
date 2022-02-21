unit Frm_principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, DBXpress, DB, SqlExpr, DBClient, SimpleDS, StdCtrls,
  ADODB, DBCtrls, Mask, ExtCtrls, Grids, DBGrids,DM_Data;

type
  TFrmPrincipal = class(TForm)
    PnlPrincipal: TPanel;
    LblNombre: TLabel;
    LblCodigo: TLabel;
    LblNombreRepresentante: TLabel;
    LblTelefonoPpal: TLabel;
    LblTelefonoSecundario: TLabel;
    LblEmail: TLabel;
    LblPersonaContacto: TLabel;
    LblTipoIdentificaicon: TLabel;
    LblNumeroIdentificacion: TLabel;
    DsCliente: TDataSource;
    PnlDatosCliente: TPanel;
    LblActivos: TLabel;
    LblValorActivos: TLabel;
    LblValorPasivos: TLabel;
    LblValorPatrimonio: TLabel;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    BtnTodosClientes: TButton;
    BtnBuscar: TButton;
    BtnEditar: TButton;
    DsTipoId: TDataSource;
    DsValores: TDataSource;
    PnlTitulo: TPanel;
    LblTitulo: TLabel;
    PnlBotonera: TPanel;
    PnlDatos: TPanel;
    LblBuscaId: TLabel;
    EdtCodigo: TEdit;
    DBLCTipoIde: TDBLookupComboBox;
    DBCodigoCliente: TDBEdit;
    DBENumeroIdentificacion: TDBEdit;
    BtnGuardar: TButton;
    BtnEliminar: TButton;
    DBEIdCliente: TDBEdit;
    BtnRegistrar: TButton;
    BtnCancelar: TButton;
    DsTodosClientes: TDataSource;
    Label1: TLabel;
    DBENombreCliente: TDBEdit;
    DBENombreRepresentante: TDBEdit;
    DBETelefono: TDBEdit;
    DBETelefono2: TDBEdit;
    DBECorreo: TDBEdit;
    DBEPersonaContacto: TDBEdit;
    DBEActivos: TDBEdit;
    DBEPasivos: TDBEdit;
    DBEPatrimonio: TDBEdit;
    LblAlertCodigo: TLabel;
    LblAlertIdentificaicon: TLabel;
    LblAlertaTipoIde: TLabel;
    procedure BtnTodosClientesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnBuscarClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnGuardarClick(Sender: TObject);
    procedure BtnEliminarClick(Sender: TObject);
    procedure BtnRegistrarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure DBETelefonosKeyPress(Sender: TObject; var Key: Char);
    procedure DBEActivosKeyPress(Sender: TObject; var Key: Char);
    procedure DBESoloLetrasKeyPress(Sender: TObject; var Key: Char);
    procedure DBENumeroIdentificacionKeyPress(Sender: TObject;
      var Key: Char);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    Dm : TDmData;
    FEstado: integer;
    procedure CrearModulo;
    procedure HabilitarBotones(pEstado:Boolean);
    procedure HabilitarBotones1(pEstado:Boolean);
    procedure Editar;
    procedure Eliminar;
    procedure Insertar;
    function ValidarDatos:Boolean;
    procedure LimpiarAlertas(pEstado:Boolean);
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

procedure TFrmPrincipal.BtnTodosClientesClick(Sender: TObject);
begin
    Dm.CargarTodos;
end;

procedure TFrmPrincipal.CrearModulo;
begin

  Dm := TDmData.Create(Self);

  DsCliente.DataSet := Dm.ADOQClientes;
  DsTipoId.DataSet := Dm.ADOQTipoIdentificacion;
  DsValores.DataSet := Dm.ADOQActivos;
  DsTodosClientes.DataSet := Dm.ADOTClientes;

  Dm.CargarDatos;
  Dm.CargarTodos;
  HabilitarBotones(False);

  {Los valores que toma FEstado son
  1:Para editar
  2:Para insertar
  Se usan para saber si se desea editar o insertar un registro}
  FEstado :=-1;
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  CrearModulo;
end;

procedure TFrmPrincipal.BtnBuscarClick(Sender: TObject);
begin

  if EdtCodigo.Text <> EmptyStr then
  begin
    Dm.BuscarCliente(EdtCodigo.text);

    if Dm.ADOQClientes.RecordCount>0 then
      HabilitarBotones1(True)
    else
      Application.MessageBox('Cliente no existe','', MB_OK + MB_ICONINFORMATION);
  end
  else
    raise Exception.Create('Debe ingresar la identificación del cliente');
end;

procedure TFrmPrincipal.HabilitarBotones1(pEstado:Boolean);
begin
  PnlDatos.Enabled := not pEstado;
  EdtCodigo.Enabled := not pEstado;

  BtnBuscar.Enabled := not pEstado;
  BtnEditar.Enabled := pEstado;
  BtnEliminar.Enabled := pEstado;
  BtnRegistrar.Enabled := not pEstado;

  BtnCancelar.Enabled := pEstado;
  BtnGuardar.Enabled := not pEstado;

end;

procedure TFrmPrincipal.BtnEditarClick(Sender: TObject);
begin

  FEstado := 1;
  //Se realizan las consultas a las tablas correspondientes para traer los datos a editar
  Dm.EditarCliente(DBEIdCliente.text);

  PnlDatos.Enabled := True;
  EdtCodigo.Enabled := False;
 
  BtnBuscar.Enabled := False;
  BtnEditar.Enabled := False;
  BtnEliminar.Enabled := False;
  BtnRegistrar.Enabled := False;
  
  BtnGuardar.Enabled := True;
  BtnCancelar.Enabled := True;


end;

procedure TFrmPrincipal.BtnGuardarClick(Sender: TObject);
begin
  if ValidarDatos then
  begin
    if FEstado = 1 then
      Editar
    else if FEstado = 2 then
      Insertar;

    FEstado := -1;

    EdtCodigo.Clear;

    HabilitarBotones(False);

    Dm.CargarTodos;
  end;

end;

procedure TFrmPrincipal.Editar;
var
  vSqlEditar,
  vSqlEditarValores:string;
begin

  vSqlEditar := 'UPDATE clientes SET codigo_cliente='+QuotedStr(DBCodigoCliente.Text)+', nombre_cliente='+QuotedStr(DBENombreCliente.Text)+
               ',nombre_representante='+QuotedStr(DBENombreRepresentante.Text)+',telefono_principal='+QuotedStr(DBETelefono.Text)+
               ',telefono_secundario='+QuotedStr(DBETelefono2.Text)+',email='+QuotedStr(DBECorreo.Text)+
               ',persona_contacto='+QuotedStr(DBEPersonaContacto.Text)+',id_tipo_identificacion='+IntToStr(DBLCTipoIde.KeyValue)+
               ',numero_identificacion='+QuotedStr(DBENumeroIdentificacion.Text)+' WHERE id_cliente='+QuotedStr(DBEIdCliente.Text);


  if (DBEActivos.Text <> EmptyStr) or  (DBEPasivos.Text<> EmptyStr)  or (DBEPatrimonio.Text<> EmptyStr) then
  begin
    //Si el cliente no tiene datos en la tabla activos_clientes, entonces se debe insertar sino editar
    if DsValores.DataSet.State in [dsInsert] then
      vSqlEditarValores := 'INSERT INTO activos_cliente(valor_activos,valor_pasivos,valor_patrimonio,id_cliente) '+
               ' VALUES('+QuotedStr(DBEActivos.Text)+','+QuotedStr(DBEPasivos.Text)+','+QuotedStr(DBEPatrimonio.Text)+','+QuotedStr(DBEIdCliente.Text)+')'
    else if DsValores.DataSet.State in [dsEdit] then
      vSqlEditarValores := 'UPDATE activos_cliente SET valor_activos='+QuotedStr(DBEActivos.Text)+', valor_pasivos='+QuotedStr(DBEPasivos.Text)+
               ',valor_patrimonio='+QuotedStr(DBEPatrimonio.Text)+' WHERE id_cliente='+QuotedStr(DBEIdCliente.Text);

  end;

  Dm.EjecutarConsulta(vSqlEditar,vSqlEditarValores,'1');


  Application.MessageBox(PChar('Se guardaron los datos del cliente :' + DBENumeroIdentificacion.Text),'', MB_OK + MB_ICONINFORMATION);
end;

procedure TFrmPrincipal.BtnEliminarClick(Sender: TObject);
begin
  if
   Application.MessageBox('Esta seguro de eliminar el registro',
   'Eliminar Registro', MB_YESNO + 
   MB_ICONQUESTION) = IDYES then
  begin
    Eliminar;
  end;

  BtnBuscar.Enabled := True;
  EdtCodigo.Enabled := True;
end;

procedure TFrmPrincipal.Eliminar;
var
  vSqlEditar,
  vSqlEditarValores:string;
begin

 vSqlEditar := 'DELETE FROM activos_cliente WHERE id_cliente='+DBEIdCliente.Text;
 vSqlEditarValores := 'DELETE FROM clientes WHERE id_cliente='+DBEIdCliente.Text;

 Dm.EjecutarConsulta(vSqlEditar,vSqlEditarValores,'0');

 EdtCodigo.Clear;

 HabilitarBotones(False);

 
 Application.MessageBox(PChar('Se eliminaron los datos del cliente :' + DBEIdCliente.Text),'', MB_OK + MB_ICONINFORMATION);
 Dm.CargarTodos;
end;

procedure TFrmPrincipal.BtnRegistrarClick(Sender: TObject);
begin

 EdtCodigo.Clear;

 Dm.Registrar;
 FEstado := 2;

 PnlDatos.Enabled := True;
 EdtCodigo.Enabled := False;
 BtnBuscar.Enabled := False;
 BtnEditar.Enabled := False;
 BtnEliminar.Enabled := False;
 BtnRegistrar.Enabled := False;

 BtnGuardar.Enabled := True;
 BtnCancelar.Enabled := True;

end;

procedure TFrmPrincipal.Insertar;
var
  vSqlEditar,
  vSqlEditarValores:string;
begin

    vSqlEditar := 'INSERT INTO clientes(codigo_cliente,nombre_cliente,nombre_representante,telefono_principal,telefono_secundario, '+
               'email,persona_contacto,id_tipo_identificacion,numero_identificacion) VALUES ( '+QuotedStr(DBCodigoCliente.Text)+
               ','+QuotedStr(DBENombreCliente.Text)+','+QuotedStr(DBENombreRepresentante.Text)+','+QuotedStr(DBETelefono.Text)+
               ','+QuotedStr(DBETelefono2.Text)+','+QuotedStr(DBECorreo.Text)+','+QuotedStr(DBEPersonaContacto.Text)+
               ','+IntToStr(DBLCTipoIde.KeyValue)+','+QuotedStr(DBENumeroIdentificacion.Text)+')';

    if (DBEActivos.Text <> EmptyStr) or  (DBEPasivos.Text<> EmptyStr)  or (DBEPatrimonio.Text<> EmptyStr) then
      vSqlEditarValores := 'INSERT INTO activos_cliente(valor_activos,valor_pasivos,valor_patrimonio,id_cliente) '+
               ' VALUES('+QuotedStr(DBEActivos.Text)+','+QuotedStr(DBEPasivos.Text)+','+QuotedStr(DBEPatrimonio.Text)+',';


    Dm.EjecutarConsulta(vSqlEditar,vSqlEditarValores,'2');

    EdtCodigo.Clear;
    PnlDatos.Enabled := False;
    
    Application.MessageBox(PChar('Se insertaron los datos del cliente :' + DBENumeroIdentificacion.Text),'', MB_OK + MB_ICONINFORMATION);

end;

procedure TFrmPrincipal.BtnCancelarClick(Sender: TObject);
begin

//canelar igual que inicio
  FEstado := -1;

  EdtCodigo.Clear;

  HabilitarBotones(False);
  LimpiarAlertas(False);

  Dm.BuscarCliente('-1');
  Dm.CargarTodos;
end;

function TFrmPrincipal.ValidarDatos: Boolean;
begin
  LblAlertCodigo.Visible := DBCodigoCliente.Text = EmptyStr;
  LblAlertIdentificaicon.Visible := DBENumeroIdentificacion.Text = EmptyStr;
  LblAlertaTipoIde.Visible := DBLCTipoIde.KeyValue<1;

  Result:=not( LblAlertCodigo.Visible or LblAlertIdentificaicon.Visible or LblAlertaTipoIde.Visible);
end;

procedure TFrmPrincipal.HabilitarBotones(pEstado: Boolean);
begin
  PnlDatos.Enabled     := pEstado;
  
  EdtCodigo.Enabled    := not pEstado;
  BtnBuscar.Enabled    := not pEstado;
  BtnEditar.Enabled    := pEstado;
  BtnEliminar.Enabled  := pEstado;
  BtnRegistrar.Enabled := not pEstado;

  BtnCancelar.Enabled  := pEstado;
  BtnGuardar.Enabled   := pEstado;
end;

procedure TFrmPrincipal.DBETelefonosKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not(key in [#8,'0'..'9']) then
    key:=#0;
end;

procedure TFrmPrincipal.DBEActivosKeyPress(Sender: TObject; var Key: Char);
begin
  if not(key in [#8,'0'..'9']) then
    key:=#0;
end;

procedure TFrmPrincipal.DBESoloLetrasKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not(key in [#8,'A'..'Z','a'..'z','Ñ','ñ',#032,'Ó','Ú','Í','Á','É','ó','ú','í','á','é']) then
    key:=#0;
end;

procedure TFrmPrincipal.DBENumeroIdentificacionKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not(key in [#8,'0'..'9','A'..'Z']) then
    key:=#0;
end;

procedure TFrmPrincipal.FormDestroy(Sender: TObject);
begin
  Dm.Free;
end;

procedure TFrmPrincipal.LimpiarAlertas(pEstado: Boolean);
begin
  LblAlertCodigo.Visible:=pEstado;
  LblAlertIdentificaicon.Visible:= pEstado;
  LblAlertaTipoIde.Visible := pEstado;
end;

end.




