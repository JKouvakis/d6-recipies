unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TForm4 = class(TForm)
    RichEdit1: TRichEdit;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm4.FormShow(Sender: TObject);
begin
  RichEdit1.Clear;
  Form4.Caption:= Form2.Combobox3.text;
  RichEdit1.Lines.Add('Ingridients');
  RichEdit1.Lines.Add('===========');
  RichEdit1.Lines.AddStrings(Form2.Memo1.Lines);
  RichEdit1.Lines.Add(' ');
  RichEdit1.Lines.Add('Execution');
  RichEdit1.Lines.Add('=========');
  RichEdit1.Lines.AddStrings(Form2.Memo2.Lines);
end;

end.
