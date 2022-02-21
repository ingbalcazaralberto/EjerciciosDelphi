object FrmSalarioSemanal: TFrmSalarioSemanal
  Left = 658
  Top = 331
  Width = 621
  Height = 128
  Caption = 'Salario Semanal'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 15
  object PnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 613
    Height = 97
    Align = alClient
    Color = clWhite
    TabOrder = 0
    object LblNombre: TLabel
      Left = 14
      Top = 14
      Width = 136
      Height = 15
      Caption = 'Nombre del Empleado:'
    end
    object LblHorasTrabajadas: TLabel
      Left = 14
      Top = 40
      Width = 136
      Height = 15
      Caption = 'Horas Trabajadas: '
    end
    object EdtNombreEmpleado: TEdit
      Left = 149
      Top = 11
      Width = 444
      Height = 23
      TabOrder = 0
      OnKeyPress = EdtNombreEmpleadoKeyPress
    end
    object EdtHorasTrabajadas: TEdit
      Left = 148
      Top = 37
      Width = 43
      Height = 23
      MaxLength = 3
      TabOrder = 1
      OnKeyPress = EdtHorasTrabajadasKeyPress
    end
    object BtnCalcuarSalario: TButton
      Left = 146
      Top = 62
      Width = 157
      Height = 25
      Caption = 'Calcular Salario'
      TabOrder = 2
      OnClick = BtnCalcuarSalarioClick
    end
  end
end
