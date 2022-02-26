object Form1: TForm1
  Left = 215
  Top = 190
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Add Recipie'
  ClientHeight = 345
  ClientWidth = 707
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 296
    Top = 52
    Width = 44
    Height = 13
    Caption = 'Prep time'
  end
  object Label2: TLabel
    Left = 296
    Top = 76
    Width = 47
    Height = 13
    Caption = 'Cook time'
  end
  object Label3: TLabel
    Left = 296
    Top = 100
    Width = 33
    Height = 13
    Caption = 'Serves'
  end
  object Label4: TLabel
    Left = 288
    Top = 16
    Width = 84
    Height = 13
    Caption = 'Num of Recipies :'
  end
  object Label5: TLabel
    Left = 380
    Top = 16
    Width = 39
    Height = 13
    Caption = 'Label5'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object RadioButton1: TRadioButton
    Left = 24
    Top = 16
    Width = 113
    Height = 17
    Caption = 'Food'
    Checked = True
    TabOrder = 0
    TabStop = True
    OnClick = RadioButton1Click
  end
  object RadioButton2: TRadioButton
    Left = 156
    Top = 16
    Width = 113
    Height = 17
    Caption = 'Desserts'
    TabOrder = 1
    OnClick = RadioButton1Click
  end
  object ComboBox1: TComboBox
    Left = 24
    Top = 48
    Width = 257
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 2
    OnChange = ComboBox1Change
  end
  object ComboBox2: TComboBox
    Left = 24
    Top = 72
    Width = 257
    Height = 21
    ItemHeight = 13
    TabOrder = 3
  end
  object Memo1: TMemo
    Left = 24
    Top = 120
    Width = 397
    Height = 89
    ScrollBars = ssBoth
    TabOrder = 8
  end
  object Memo2: TMemo
    Left = 24
    Top = 216
    Width = 397
    Height = 89
    ScrollBars = ssBoth
    TabOrder = 9
  end
  object Button1: TButton
    Left = 180
    Top = 312
    Width = 75
    Height = 25
    Caption = 'Add'
    TabOrder = 10
    OnClick = Button1Click
  end
  object Edit2: TEdit
    Left = 352
    Top = 48
    Width = 65
    Height = 21
    TabOrder = 5
  end
  object Edit3: TEdit
    Left = 352
    Top = 72
    Width = 65
    Height = 21
    TabOrder = 6
  end
  object Edit4: TEdit
    Left = 352
    Top = 96
    Width = 65
    Height = 21
    TabOrder = 7
  end
  object Edit1: TEdit
    Left = 24
    Top = 96
    Width = 257
    Height = 21
    TabOrder = 4
  end
  object GroupBox1: TGroupBox
    Left = 432
    Top = 37
    Width = 260
    Height = 270
    Caption = 'Image : '
    TabOrder = 11
    object Image1: TImage
      Left = 2
      Top = 15
      Width = 256
      Height = 253
      Align = alClient
      Center = True
      Proportional = True
      Stretch = True
    end
  end
  object Button2: TButton
    Left = 512
    Top = 16
    Width = 113
    Height = 17
    Caption = 'Load Image'
    TabOrder = 12
    OnClick = Button2Click
  end
  object ABSDatabase1: TABSDatabase
    CurrentVersion = '4.75 '
    DatabaseFileName = '.\data\data.abs'
    DatabaseName = 'data'
    Exclusive = False
    MaxConnections = 500
    MultiUser = False
    SessionName = 'Default'
    Left = 212
    Top = 124
  end
  object ABSQuery1: TABSQuery
    CurrentVersion = '4.75 '
    DatabaseName = 'data'
    InMemory = False
    ReadOnly = False
    Left = 240
    Top = 124
  end
  object ABSTable1: TABSTable
    CurrentVersion = '4.75 '
    DatabaseName = 'data'
    InMemory = False
    ReadOnly = False
    Active = True
    TableName = 'recipies'
    Exclusive = False
    Left = 268
    Top = 124
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Jpeg Images|*.jpg'
    Left = 464
    Top = 12
  end
end
