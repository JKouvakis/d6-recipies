unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    foodclk: TRadioButton;
    desertclk: TRadioButton;
    menu: TImage;
    recipielst: TListBox;
    foodimg: TImage;
    desertimg: TImage;
    exitshp: TShape;
    exit: TLabel;
    procedure foodclkClick(Sender: TObject);
    procedure desertclkClick(Sender: TObject);
    procedure exitshpMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure exitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.foodclkClick(Sender: TObject);
begin
  If foodclk.Checked = true then
    begin
      foodimg.Visible :=true;
      desertimg.Visible := false;
    end;
end;

procedure TForm1.desertclkClick(Sender: TObject);
begin
  If desertclk.Checked = true then
    begin
      foodimg.Visible :=false;
      desertimg.Visible := true;
    end;
end;

procedure TForm1.exitshpMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Form1.Close;
end;

procedure TForm1.exitClick(Sender: TObject);
begin
  Form1.Close;
end;

end.
