object FrmPrincipal: TFrmPrincipal
  Left = 700
  Top = 380
  Width = 438
  Height = 154
  Caption = 'Serie Fibonacci'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object PnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 430
    Height = 123
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 0
    object LblEtiqueta1: TLabel
      Left = 14
      Top = 13
      Width = 161
      Height = 15
      Caption = 'Digite un n'#250'mero entre 1 y 20'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object EdtNumero: TEdit
      Left = 14
      Top = 29
      Width = 33
      Height = 23
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      MaxLength = 2
      ParentFont = False
      TabOrder = 0
      OnKeyPress = EdtNumeroKeyPress
    end
    object BtnSerieFibonacci: TButton
      Left = 14
      Top = 54
      Width = 163
      Height = 25
      Caption = 'Generar Serie Fibonacci'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BtnSerieFibonacciClick
    end
    object EdtListaNumeros: TEdit
      Left = 14
      Top = 86
      Width = 401
      Height = 23
      BevelOuter = bvNone
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
  end
end
