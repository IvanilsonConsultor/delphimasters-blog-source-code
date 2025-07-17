object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Threads no Delphi'
  ClientHeight = 213
  ClientWidth = 390
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 140
    Width = 52
    Height = 13
    Caption = 'Resultado:'
  end
  object ButtonBuscarDados: TButton
    Left = 24
    Top = 24
    Width = 150
    Height = 25
    Caption = 'Buscar Dados'
    TabOrder = 0
    OnClick = ButtonBuscarDadosClick
  end
  object ButtonExecutarFeedback: TButton
    Left = 24
    Top = 60
    Width = 150
    Height = 25
    Caption = 'Executar Feedback'
    TabOrder = 1
    OnClick = ButtonExecutarFeedbackClick
  end
  object ButtonExecutarTTask: TButton
    Left = 24
    Top = 96
    Width = 150
    Height = 25
    Caption = 'Executar com TTask'
    TabOrder = 2
    OnClick = ButtonExecutarTTaskClick
  end
  object Memo1: TMemo
    Left = 200
    Top = 24
    Width = 180
    Height = 150
    TabOrder = 3
  end
end
