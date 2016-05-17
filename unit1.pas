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
  MyArray:      array of array of Integer;
  He,Wi:        integer;
  PosX,PosY:    integer;
  i,j:          integer;
  MyArrayLV:    integer;//Vortex count
  MyArrayLP:    integer;//Path count
  SoV:          integer;//SizeOfVertex
begin
  SetLength(MyArray, 3, 3);  //first numeric is the vortex number,
  //second numeric is the path count
  MyArray[0,0]:=  1;
  MyArray[0,1]:=  2;
  MyArray[0,2]:=  0;

  MyArray[1,0]:= -1;
  MyArray[1,1]:=  0;
  MyArray[1,2]:=  1;

  MyArray[2,0]:=  0;
  MyArray[2,1]:= -2;
  MyArray[2,2]:= -1;


  MyArrayLV :=Length(MyArray);//Vortex count
  MyArrayLP :=Length(MyArray[Low(MyArray)]); //Path count
  //ShowMessage('Path count is '+IntToStr(MyArrayLP)+' and Vortex count is '+IntToStr(MyArrayLV));
  //Initialize our Pen step size
  PosX :=0;
  PosY :=100;
  SoV  :=50;

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

 {
  For i:=0 to 5 Do// MyArrayLV-1 Do
  Begin

    PosX := PosX+60;
    if (i mod 2 = 0) then
      PosY := PosY + Round(60/2)*i
      else
      PosY := PosY - Round(60/2)*i;
    Image1.Canvas.Rectangle (PosX,PosY,PosX+SoV,PosY+SoV);
  end;
  }
  For j:=0 to MyArrayLP-1 Do
  Begin


  end;

  //Image1.Canvas.Arc(0,0, 200,200, 200,0, 0,0);

  For i:=0 to MyArrayLV-1 Do
  Begin
    If i > 0 then
    Begin
      For j:=0 to MyArrayLP-1 Do
      Begin

      end;
    end;
  end;

  i:=0;
  j:=0;
  For j:=0 To MyArrayLP-1 Do
  Begin
    For i:=0 To MyArrayLV-1 Do
    Begin
    if j=0 then
    begin

      //draw vortexes
      PosX := PosX+60;
      if (i mod 2 = 0) then
        PosY := PosY + Round(60/2)*i
        else
        PosY := PosY - Round(60/2)*i;
      Image1.Canvas.Rectangle (PosX,PosY,PosX+SoV,PosY+SoV);
    end;
      //draw arcs
    end;
  end;
  //Do smth here
end;

end.

