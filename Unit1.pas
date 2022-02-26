unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ABSMain, StdCtrls, DB, ExtCtrls, jpeg;

type
  TForm1 = class(TForm)
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ABSDatabase1: TABSDatabase;
    ABSQuery1: TABSQuery;
    Memo1: TMemo;
    Memo2: TMemo;
    Button1: TButton;
    ABSTable1: TABSTable;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    GroupBox1: TGroupBox;
    Image1: TImage;
    Button2: TButton;
    OpenDialog1: TOpenDialog;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  a: string;
implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var
  i: integer;
begin
  ABSDATAbase1.Connected := true;
  if Radiobutton1.Checked = true then
    a:='True'
  else
    a:='False';
  ABSQuery1.SQL.Add('SELECT * From Category1 WHERE food="' + a + '" order by Name;');
  ABSQuery1.Open;
  ComboBox1.Clear;
  For i:=0 to ABSQuery1.RecordCount -1 do
    begin
      Combobox1.Items.Add(ABSQuery1.FieldValues['Name']);
      ABSQuery1.Next;
    end;
  Combobox1.ItemIndex:=0;
  Combobox1change(Form1);
  ABSQuery1.Close;
end;

procedure TForm1.Button1Click(Sender: TObject);
var jpg: 	TJpegImage;
    bs:   TStream;
begin
  ABSQuery1.SQL.Clear;
  ABSTable1.Insert;
  ABSTable1.FieldValues['Name']:=Edit1.Text;
  ABSTable1.FieldValues['Preptm']:=Edit2.Text;
  ABSTable1.FieldValues['Cooktm']:=Edit3.Text;
  ABSTable1.FieldValues['Serves']:=Edit4.Text;
  ABSTable1.FieldValues['Category1']:=Combobox1.Text;
  ABSTable1.FieldValues['Category2']:=Combobox2.Text;
  ABSTable1.FieldValues['Igrid']:=Memo1.Text;
  ABSTable1.FieldValues['Exec']:=Memo2.Text;
  ABSTable1.FieldValues['Food']:=Radiobutton1.Checked;

  if Image1.Picture.Height>0 then
    begin
      jpg := TJPEGImage.Create;
      jpg.Assign(Image1.Picture);
      try
        bs := ABSTable1.CreateBlobStream(ABSTable1.FieldByName('Image'),bmWrite);
        jpg.SaveToStream(bs);
      except
        MessageDlg('Invalid BLOB field value. This is not an jpeg file!',mtError,[mbOk],0);
      end;
    end;

  ABSTable1.Post;

  bs.Free;
  jpg.Free;

  RadioButton1.Checked := true;
  Combobox1.ItemIndex := 0;
  Combobox1change(form1);
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  Edit4.Clear;
  Memo1.Clear;
  Memo2.Clear;
  Image1.Picture.Assign(nil);
  ABSTable1.Refresh;
  Label5.Caption := inttostr(ABSTable1.RecordCount);
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
var
 i: integer;
begin
  ABSQuery1.SQL.Add('SELECT DISTINCT Category2 From recipies WHERE Category1 = "' + Combobox1.Text + '" AND Food="' + a + '"order by Category2;');
  ABSQuery1.Open;
  ComboBox2.Clear;
  if ABSQuery1.RecordCount > 0 then
  For i:=0 to ABSQuery1.RecordCount -1 do
    begin
      Combobox2.Items.Add(ABSQuery1.FieldValues['Category2']);
      ABSQuery1.Next;
    end;
  Combobox2.ItemIndex:=0;
  ABSQuery1.Close;
end;


procedure TForm1.RadioButton1Click(Sender: TObject);
begin

  Formcreate(form1);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  Formcreate(form1);
  ABSTable1.Active := true;
  ABSTable1.Refresh;
  Label5.Caption := inttostr(ABSTable1.RecordCount);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
 jpg: 	TJpegImage;
begin
 if (OpenDialog1.Execute) then
  begin
	 jpg := TJpegImage.Create;
   try
		 jpg.LoadFromFile(OpenDialog1.FileName);
   except
     MessageDlg('Invalid JPEG file.',mtError,[mbOk],0);
		 jpg.Free;
     Exit;
   end;
   Image1.Picture.Assign(jpg);
  end;
end;

end.
