unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs;

type

  { TForm1 }

  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var
  MyArray: array of array of Integer;
begin
  SetLength(MyArray, 3, 3);
  MyArray[0,0]:=  1;
  MyArray[0,1]:= -1;
  MyArray[0,2]:=  0;
  MyArray[1,0]:=  2;
  MyArray[1,1]:= -2;
  MyArray[1,2]:=  0;
  MyArray[3,0]:=  0;
  MyArray[3,1]:=  1;
  MyArray[3,2]:= -1;
end;

end.

