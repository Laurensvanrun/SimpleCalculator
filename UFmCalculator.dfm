object CalculatorForm: TCalculatorForm
  Left = 0
  Top = 0
  Caption = 'CalculatorForm'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LabelResult: TLabel
    Left = 8
    Top = 8
    Width = 20
    Height = 39
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ButtonAdd: TButton
    Left = 135
    Top = 61
    Width = 75
    Height = 25
    Caption = '+'
    TabOrder = 0
    OnClick = ButtonAddClick
  end
  object ButtonSubstract: TButton
    Left = 216
    Top = 61
    Width = 75
    Height = 25
    Caption = '-'
    TabOrder = 1
    OnClick = ButtonSubstractClick
  end
  object EditValue: TEdit
    Left = 8
    Top = 63
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 2
    Text = '0'
  end
  object ButtonFactorial: TButton
    Left = 297
    Top = 61
    Width = 75
    Height = 25
    Caption = 'n!'
    TabOrder = 3
    OnClick = ButtonFactorialClick
  end
  object ButtonClear: TButton
    Left = 375
    Top = 8
    Width = 75
    Height = 39
    Caption = 'CE'
    TabOrder = 4
    OnClick = ButtonClearClick
  end
end
