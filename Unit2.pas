unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ABSMain, DB, ExtCtrls, jpeg;

type
  TForm2 = class(TForm)
    ComboBox2: TComboBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    ABSDatabase1: TABSDatabase;
    ABSQuery1: TABSQuery;
    ABSTable1: TABSTable;
    Edit2: TEdit;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label3: TLabel;
    Label2: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Memo1: TMemo;
    Memo2: TMemo;
    ComboBox3: TComboBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    GroupBox1: TGroupBox;
    Image1: TImage;
    Image2: TImage;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  a: string;

implementation

uses Unit1, Unit3, Unit4;

{$R *.dfm}

procedure TForm2.FormCreate(Sender: TObject);
var
  i: integer;
begin
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
  Combobox1change(form2);
  ABSQuery1.Close;
end;

procedure TForm2.ComboBox1Change(Sender: TObject);
var
 i: integer;
begin
  ABSQuery1.SQL.Add('SELECT DISTINCT Category2 From recipies WHERE Category1 = "' + Combobox1.Text + '" AND Food="' + a + '" order by Category2;');
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
  Combobox2Change(Form2);
end;

procedure TForm2.ComboBox2Change(Sender: TObject);
var
 i: integer;
begin
  ABSQuery1.SQL.Add('SELECT Name From recipies WHERE Category2 = "' + Combobox2.Text + '" AND Category1 = "' + Combobox1.Text + '" AND Food="' + a + '" order by Name;');
  ABSQuery1.Open;
  ComboBox3.Clear;
  if ABSQuery1.RecordCount > 0 then
  For i:=0 to ABSQuery1.RecordCount -1 do
    begin
      Combobox3.Items.Add(ABSQuery1.FieldValues['Name']);
      ABSQuery1.Next;
    end;
  Combobox3.ItemIndex:=0;
  ABSQuery1.Close;
  Combobox3Change(Form2);
end;

procedure TForm2.ComboBox3Change(Sender: TObject);
var
 i:   integer;
 jpg: TJpegImage;
 bs:  TStream;
begin
  ABSQuery1.SQL.Add('SELECT * From recipies WHERE Name = "' + Combobox3.Text + '";');
  ABSQuery1.Open;

  If ABSQuery1.FieldValues['Preptm']<>null then
    Edit2.Text:=ABSQuery1.FieldValues['Preptm'];
  If ABSQuery1.FieldValues['Cooktm']<>null then
    Edit3.Text:=ABSQuery1.FieldValues['Cooktm'];
  If ABSQuery1.FieldValues['Serves']<>null then
    Edit4.text:= ABSQuery1.FieldValues['Serves'];
  Memo1.text:= ABSquery1.FieldValues['Igrid'];
  Memo2.text:= ABSquery1.FieldValues['Exec'];

 jpg := TJpegImage.Create;
 try
  bs := ABSquery1.CreateBlobStream(ABSquery1.FieldByName('Image'),bmRead);
  Image1.Picture.Assign(nil);
  if (bs.Size > 0) then
   begin
	  jpg.LoadFromStream(bs);
    Image1.Picture.Assign(jpg);
   end
  else
   Image1.Picture := Image2.Picture;
  bs.Free;
 except
  MessageDlg('Invalid BLOB field value. This is not an jpeg file!',mtError,[mbOk],0);
  jpg.Free;
  Exit;
 end;
 jpg.Free;
 
  ABSQuery1.Close;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  Form1.Show;
end;

procedure TForm2.RadioButton1Click(Sender: TObject);
begin
  Formcreate(form2);
end;

procedure TForm2.Button2Click(Sender: TObject);
var
  ct1: string;
  ch: boolean;
begin
  ct1:= InputBox('Category Name', 'Name : ', '');
  if ct1<>'' then
    begin
      if MessageDlg('Does '+ct1+' belong to food?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        ch:=true
      else
        ch:=false;

      ABSTable1.Insert;
      ABSTable1.FieldValues['Name']:=ct1;
      ABSTable1.FieldValues['Food']:=ch;
      ABSTable1.Post;
   end;
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  Form3.Show;
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
  Form4.Show;
end;

end.
