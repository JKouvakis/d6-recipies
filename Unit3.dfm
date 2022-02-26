object Form3: TForm3
  Left = 189
  Top = 221
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Form3'
  ClientHeight = 297
  ClientWidth = 688
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesktopCenter
  OnHide = FormHide
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 20
    Top = 240
    Width = 69
    Height = 13
    Caption = 'Prepare Time :'
  end
  object Label2: TLabel
    Left = 244
    Top = 240
    Width = 57
    Height = 13
    Caption = 'Cook Time :'
  end
  object Label3: TLabel
    Left = 464
    Top = 240
    Width = 39
    Height = 13
    Caption = 'Serves :'
  end
  object DBNavigator1: TDBNavigator
    Left = 12
    Top = 268
    Width = 660
    Height = 25
    DataSource = DataSource1
    TabOrder = 6
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 4
    Width = 669
    Height = 129
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Name'
        Width = 230
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Category1'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Category2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Food'
        Visible = True
      end>
  end
  object DBMemo1: TDBMemo
    Left = 8
    Top = 140
    Width = 317
    Height = 89
    DataField = 'Igrid'
    DataSource = DataSource1
    TabOrder = 1
  end
  object DBMemo2: TDBMemo
    Left = 360
    Top = 140
    Width = 317
    Height = 89
    DataField = 'Exec'
    DataSource = DataSource1
    TabOrder = 2
  end
  object DBEdit1: TDBEdit
    Left = 92
    Top = 236
    Width = 121
    Height = 21
    DataField = 'Preptm'
    DataSource = DataSource1
    TabOrder = 3
  end
  object DBEdit2: TDBEdit
    Left = 304
    Top = 236
    Width = 121
    Height = 21
    DataField = 'Cooktm'
    DataSource = DataSource1
    TabOrder = 4
  end
  object DBEdit3: TDBEdit
    Left = 508
    Top = 236
    Width = 121
    Height = 21
    DataField = 'Serves'
    DataSource = DataSource1
    TabOrder = 5
  end
  object ABSTable1: TABSTable
    CurrentVersion = '4.75 '
    DatabaseName = 'data'
    InMemory = False
    ReadOnly = False
    Active = True
    TableName = 'recipies'
    Exclusive = False
    Left = 48
    Top = 96
  end
  object ABSDatabase1: TABSDatabase
    CurrentVersion = '4.75 '
    DatabaseFileName = '.\data\data.abs'
    DatabaseName = 'data'
    Exclusive = False
    MaxConnections = 500
    MultiUser = False
    SessionName = 'Default'
    Left = 16
    Top = 96
  end
  object DataSource1: TDataSource
    DataSet = ABSTable1
    Left = 80
    Top = 96
  end
end
