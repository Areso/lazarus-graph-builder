unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Grids;

type

  { TForm1 }

  TForm1 = class(TForm)
    Image1: TImage;
    Shape1: TShape;
    Shape2: TShape;
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
  MyArray:   array of array of Integer;
  He,Wi:     integer;
  PosX,PosY: integer;
  i,j:       integer;
  MyArrayLV: integer;//Vortex count
  MyArrayLP: integer;//Path count
begin
  SetLength(MyArray, 3, 3);  //first numeric is the vortex number, second numeric
  //is the path count
  MyArray[0,0]:=  1;
  MyArray[0,1]:=  2;
  MyArray[0,2]:=  0;
//  MyArray[0,3]:=3;
  MyArray[1,0]:= -1;
  MyArray[1,1]:= -2;
  MyArray[1,2]:=  1;
//  MyArray[1,3]:=3;
  MyArray[2,0]:=  0;
  MyArray[2,1]:=  0;
  MyArray[2,2]:= -1;
//  MyArray[2,3]:=3;

  MyArrayLV :=Length(MyArray);//Path count
  MyArrayLP :=Length(MyArray[Low(MyArray)]); //Vortex count
  ShowMessage('Path count is '+IntToStr(MyArrayLP)+' and Vortex count is '+IntToStr(MyArrayLV));
  //Initialize our Pen step size
  PosX:=40;
  PosY:=40;

  //check Image1.Canvas size
  He:=Image1.Height;
  Wi:=Image1.Width;

  //fill Image1.Canvas with white color
  Image1.Canvas.Brush.Color := clWhite;
  Image1.Canvas.Rectangle (0,0,Wi,He);

  //changing color to red
  Image1.Canvas.Brush.Color := clRed;
  //let's begin
  //For MyArray[i]:=0 to
  Image1.Canvas.Rectangle (0,0,120,8);
end;

end.

