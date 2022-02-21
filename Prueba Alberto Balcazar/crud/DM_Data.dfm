object DmData: TDmData
  OldCreateOrder = False
  Left = 868
  Top = 345
  Height = 241
  Width = 289
  object ADOConnecion: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;User ID=root;Data' +
      ' Source=BD;Initial Catalog=bd_prueba'
    LoginPrompt = False
    Left = 40
    Top = 8
  end
  object ADOQClientes: TADOQuery
    Connection = ADOConnecion
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      '')
    Left = 41
    Top = 59
  end
  object ADOQActivos: TADOQuery
    Connection = ADOConnecion
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from cat_tipo_identificacion')
    Left = 161
    Top = 59
  end
  object ADOQTipoIdentificacion: TADOQuery
    Connection = ADOConnecion
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select id_tipo_identificacion,codigo_identificacion,descripcion_' +
        'identificacion,longitud_identificacion from cat_tipo_identificac' +
        'ion')
    Left = 49
    Top = 107
  end
  object ADOTClientes: TADOTable
    Connection = ADOConnecion
    CursorType = ctStatic
    OnCalcFields = ADOTClientesCalcFields
    TableName = 'clientes'
    Left = 160
    Top = 8
    object ADOTClientescodigo_cliente: TWideStringField
      FieldName = 'codigo_cliente'
      Size = 30
    end
    object ADOTClientesnombre_cliente: TWideStringField
      FieldName = 'nombre_cliente'
      Size = 60
    end
    object ADOTClientesnombre_representante: TWideStringField
      FieldName = 'nombre_representante'
      Size = 60
    end
    object ADOTClientestelefono_principal: TWideStringField
      FieldName = 'telefono_principal'
      Size = 10
    end
    object ADOTClientestelefono_secundario: TWideStringField
      FieldName = 'telefono_secundario'
      Size = 10
    end
    object ADOTClientesemail: TWideStringField
      FieldName = 'email'
      Size = 60
    end
    object ADOTClientespersona_contacto: TWideStringField
      FieldName = 'persona_contacto'
      Size = 60
    end
    object ADOTClientesid_tipo_identificacion: TIntegerField
      FieldName = 'id_tipo_identificacion'
    end
    object ADOTClientesnumero_identificacion: TWideStringField
      FieldName = 'numero_identificacion'
      Size = 30
    end
    object ADOTClientestipo_id: TStringField
      FieldKind = fkCalculated
      FieldName = 'tipo_id'
      LookupKeyFields = 'id_tipo_identificacion'
      LookupResultField = 'codigo_identificacion'
      KeyFields = 'tipo_id'
      Size = 3
      Calculated = True
    end
  end
end
