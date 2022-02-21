object FrmPrincipal: TFrmPrincipal
  Left = 421
  Top = 221
  Width = 983
  Height = 656
  Caption = 'Clientes'
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 15
  object PnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 975
    Height = 625
    Align = alClient
    Color = clWhite
    TabOrder = 0
    object PnlDatosCliente: TPanel
      Left = 1
      Top = 33
      Width = 973
      Height = 416
      Align = alTop
      Color = clWhite
      TabOrder = 0
      object PnlBotonera: TPanel
        Left = 672
        Top = 1
        Width = 300
        Height = 414
        Align = alRight
        BevelOuter = bvNone
        Color = clWhite
        TabOrder = 0
        object LblBuscaId: TLabel
          Left = 64
          Top = 16
          Width = 179
          Height = 15
          Caption = 'Digite la identificacion del cliente'
        end
        object BtnEditar: TButton
          Left = 76
          Top = 124
          Width = 164
          Height = 25
          Caption = ' Editar Cliente'
          Enabled = False
          TabOrder = 0
          OnClick = BtnEditarClick
        end
        object BtnBuscar: TButton
          Left = 76
          Top = 68
          Width = 161
          Height = 25
          Caption = 'Buscar Cliente'
          TabOrder = 1
          OnClick = BtnBuscarClick
        end
        object BtnTodosClientes: TButton
          Left = 79
          Top = 274
          Width = 161
          Height = 25
          Caption = 'Cargar Todos los Clientes'
          TabOrder = 2
          Visible = False
          OnClick = BtnTodosClientesClick
        end
        object EdtCodigo: TEdit
          Left = 81
          Top = 36
          Width = 145
          Height = 23
          TabOrder = 3
          OnKeyPress = DBENumeroIdentificacionKeyPress
        end
        object BtnGuardar: TButton
          Left = 76
          Top = 210
          Width = 164
          Height = 25
          Caption = 'Guardar'
          Enabled = False
          TabOrder = 4
          OnClick = BtnGuardarClick
        end
        object BtnEliminar: TButton
          Left = 76
          Top = 152
          Width = 164
          Height = 25
          Caption = 'Eliminar Cliente'
          Enabled = False
          TabOrder = 5
          OnClick = BtnEliminarClick
        end
        object BtnRegistrar: TButton
          Left = 77
          Top = 181
          Width = 164
          Height = 25
          Caption = 'Registrar Cliente'
          TabOrder = 6
          OnClick = BtnRegistrarClick
        end
        object BtnCancelar: TButton
          Left = 76
          Top = 239
          Width = 164
          Height = 25
          Caption = 'Cancelar'
          Enabled = False
          TabOrder = 7
          OnClick = BtnCancelarClick
        end
      end
      object PnlDatos: TPanel
        Left = 1
        Top = 1
        Width = 671
        Height = 414
        Align = alClient
        BevelOuter = bvNone
        Color = clWhite
        Enabled = False
        TabOrder = 1
        object LblTelefonoSecundario: TLabel
          Left = 168
          Top = 151
          Width = 113
          Height = 15
          Caption = 'Telefono Secundario'
        end
        object LblActivos: TLabel
          Left = 16
          Top = 288
          Width = 80
          Height = 15
          Caption = 'Activos Cliente'
        end
        object LblCodigo: TLabel
          Left = 16
          Top = 5
          Width = 82
          Height = 15
          Caption = 'Codigo Cliente'
        end
        object LblEmail: TLabel
          Left = 16
          Top = 196
          Width = 32
          Height = 15
          Caption = 'Email'
        end
        object LblNombre: TLabel
          Left = 16
          Top = 56
          Width = 99
          Height = 15
          Caption = 'Nombre completo'
        end
        object LblNombreRepresentante: TLabel
          Left = 16
          Top = 101
          Width = 125
          Height = 15
          Caption = 'Nombre representante'
        end
        object LblNumeroIdentificacion: TLabel
          Left = 265
          Top = 5
          Width = 120
          Height = 15
          Caption = 'N'#250'mero Identificaci'#243'n'
        end
        object LblPersonaContacto: TLabel
          Left = 16
          Top = 242
          Width = 99
          Height = 15
          Caption = 'Persona Contacto'
        end
        object LblTelefonoPpal: TLabel
          Left = 16
          Top = 151
          Width = 98
          Height = 15
          Caption = 'Telefono Principal'
        end
        object LblTipoIdentificaicon: TLabel
          Left = 150
          Top = 5
          Width = 99
          Height = 15
          Caption = 'Tipo Identificacion'
        end
        object LblValorActivos: TLabel
          Left = 16
          Top = 308
          Width = 67
          Height = 15
          Caption = 'Valor Activos'
        end
        object LblValorPatrimonio: TLabel
          Left = 319
          Top = 308
          Width = 90
          Height = 15
          Caption = 'Valor Patrimonio'
        end
        object LblValorPasivos: TLabel
          Left = 170
          Top = 308
          Width = 74
          Height = 15
          Caption = 'Valor Pasivos'
        end
        object Label1: TLabel
          Left = 16
          Top = 360
          Width = 52
          Height = 15
          Caption = 'Id Cliente'
          Visible = False
        end
        object LblAlertCodigo: TLabel
          Left = 8
          Top = 5
          Width = 5
          Height = 16
          Caption = '*'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6447871
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object LblAlertIdentificaicon: TLabel
          Left = 257
          Top = 5
          Width = 5
          Height = 16
          Caption = '*'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6447871
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object LblAlertaTipoIde: TLabel
          Left = 142
          Top = 7
          Width = 5
          Height = 16
          Caption = '*'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6447871
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object DBLCTipoIde: TDBLookupComboBox
          Left = 147
          Top = 24
          Width = 94
          Height = 23
          DataField = 'id_tipo_identificacion'
          DataSource = DsCliente
          KeyField = 'id_tipo_identificacion'
          ListField = 'codigo_identificacion'
          ListSource = DsTipoId
          TabOrder = 1
        end
        object DBCodigoCliente: TDBEdit
          Left = 16
          Top = 24
          Width = 121
          Height = 23
          DataField = 'codigo_cliente'
          DataSource = DsCliente
          MaxLength = 30
          TabOrder = 0
          OnKeyPress = DBENumeroIdentificacionKeyPress
        end
        object DBENumeroIdentificacion: TDBEdit
          Left = 262
          Top = 24
          Width = 241
          Height = 23
          DataField = 'numero_identificacion'
          DataSource = DsCliente
          MaxLength = 30
          TabOrder = 2
          OnKeyPress = DBENumeroIdentificacionKeyPress
        end
        object DBEIdCliente: TDBEdit
          Left = 16
          Top = 376
          Width = 121
          Height = 23
          DataField = 'id_cliente'
          DataSource = DsCliente
          TabOrder = 12
          Visible = False
        end
        object DBENombreCliente: TDBEdit
          Left = 16
          Top = 72
          Width = 481
          Height = 23
          DataField = 'nombre_cliente'
          DataSource = DsCliente
          MaxLength = 60
          TabOrder = 3
          OnKeyPress = DBESoloLetrasKeyPress
        end
        object DBENombreRepresentante: TDBEdit
          Left = 16
          Top = 118
          Width = 481
          Height = 23
          DataField = 'nombre_representante'
          DataSource = DsCliente
          MaxLength = 60
          TabOrder = 4
          OnKeyPress = DBESoloLetrasKeyPress
        end
        object DBETelefono: TDBEdit
          Left = 16
          Top = 168
          Width = 137
          Height = 23
          DataField = 'telefono_principal'
          DataSource = DsCliente
          MaxLength = 10
          TabOrder = 5
          OnKeyPress = DBETelefonosKeyPress
        end
        object DBETelefono2: TDBEdit
          Left = 168
          Top = 168
          Width = 137
          Height = 23
          DataField = 'telefono_secundario'
          DataSource = DsCliente
          MaxLength = 10
          TabOrder = 6
          OnKeyPress = DBETelefonosKeyPress
        end
        object DBECorreo: TDBEdit
          Left = 16
          Top = 213
          Width = 489
          Height = 23
          DataField = 'email'
          DataSource = DsCliente
          MaxLength = 60
          TabOrder = 7
        end
        object DBEPersonaContacto: TDBEdit
          Left = 16
          Top = 258
          Width = 491
          Height = 23
          DataField = 'persona_contacto'
          DataSource = DsCliente
          MaxLength = 60
          TabOrder = 8
          OnKeyPress = DBESoloLetrasKeyPress
        end
        object DBEActivos: TDBEdit
          Left = 16
          Top = 326
          Width = 142
          Height = 23
          DataField = 'valor_activos'
          DataSource = DsValores
          TabOrder = 9
          OnKeyPress = DBEActivosKeyPress
        end
        object DBEPasivos: TDBEdit
          Left = 164
          Top = 326
          Width = 142
          Height = 23
          DataField = 'valor_pasivos'
          DataSource = DsValores
          TabOrder = 10
          OnKeyPress = DBEActivosKeyPress
        end
        object DBEPatrimonio: TDBEdit
          Left = 321
          Top = 326
          Width = 142
          Height = 23
          DataField = 'valor_patrimonio'
          DataSource = DsValores
          TabOrder = 11
          OnKeyPress = DBEActivosKeyPress
        end
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 449
      Width = 973
      Height = 175
      Align = alClient
      Color = clWhite
      TabOrder = 1
      object DBGrid1: TDBGrid
        Left = 1
        Top = 1
        Width = 971
        Height = 173
        Align = alClient
        DataSource = DsTodosClientes
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Arial'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'codigo_cliente'
            Title.Alignment = taCenter
            Title.Caption = 'CODIGO'
            Width = 116
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nombre_cliente'
            Title.Alignment = taCenter
            Title.Caption = 'CLIENTE'
            Width = 293
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'numero_identificacion'
            Title.Alignment = taCenter
            Title.Caption = 'IDENTIFICACION'
            Width = 303
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'tipo_id'
            Title.Alignment = taCenter
            Title.Caption = 'TIPO IDE'
            Width = 79
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'telefono_principal'
            Title.Alignment = taCenter
            Title.Caption = 'TELEFONO PRINCIPAL'
            Width = 158
            Visible = True
          end>
      end
    end
    object PnlTitulo: TPanel
      Left = 1
      Top = 1
      Width = 973
      Height = 32
      Align = alTop
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 2
      object LblTitulo: TLabel
        Left = 575
        Top = 8
        Width = 166
        Height = 19
        Caption = 'DATOS DEL CLIENTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object DsCliente: TDataSource
    Left = 776
    Top = 8
  end
  object DsTipoId: TDataSource
    Left = 817
    Top = 9
  end
  object DsValores: TDataSource
    Left = 857
    Top = 9
  end
  object DsTodosClientes: TDataSource
    AutoEdit = False
    Left = 889
    Top = 9
  end
end
