unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Image1: TImage;
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
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
  i,j,ii:       integer;
  PathDrawed:   integer;
  MyArrayLV:    integer;//Vortex count
  MyArrayLP:    integer;//Path count
  MyArrayLV0X:  array of integer;//Vortex X coord
  MyArrayLV0Y:  array of integer;//Vortex Y coord
  SoV:          integer;//SizeOfVertex

  BiasV:        integer;//value of vertical bias for vortexes
  BiasH:        integer;//value of horizontal bias for vortexes
begin

  SetLength(MyArray, 6, 7);  //first numeric is the vortex number,
  //second numeric is the path count
  MyArray[0,0]:= -1;
  MyArray[0,1]:= -1;
  MyArray[0,2]:=  0;
  MyArray[0,3]:=  0;
  MyArray[0,4]:=  0;
  MyArray[0,5]:=  0;
  MyArray[0,6]:=  0;

  MyArray[1,0]:=  1;
  MyArray[1,1]:=  0;
  MyArray[1,2]:= -1;
  MyArray[1,3]:= -1;
  MyArray[1,4]:=  0;
  MyArray[1,5]:=  0;
  MyArray[1,6]:=  0;

  MyArray[2,0]:=  0;
  MyArray[2,1]:=  0;
  MyArray[2,2]:=  0;
  MyArray[2,3]:=  1;
  MyArray[2,4]:= -1;
  MyArray[2,5]:= -1;
  MyArray[2,6]:=  0;

  MyArray[3,0]:=  0;
  MyArray[3,1]:=  0;
  MyArray[3,2]:=  0;
  MyArray[3,3]:=  0;
  MyArray[3,4]:=  1;
  MyArray[3,5]:=  0;
  MyArray[3,6]:= -1;

  MyArray[4,0]:=  0;
  MyArray[4,1]:=  0;
  MyArray[4,2]:=  0;
  MyArray[4,3]:=  0;
  MyArray[4,4]:=  0;
  MyArray[4,5]:=  1;
  MyArray[4,6]:=  0;

  MyArray[5,0]:=  0;
  MyArray[5,1]:=  1;
  MyArray[5,2]:=  1;
  MyArray[5,3]:=  0;
  MyArray[5,4]:=  0;
  MyArray[5,5]:=  0;
  MyArray[5,6]:=  1;

  MyArrayLV   :=Length(MyArray);//Vortex count
  SetLength(MyArrayLV0X, Length(MyArray));
  SetLength(MyArrayLV0Y, Length(MyArray));
  MyArrayLP   :=Length(MyArray[Low(MyArray)]); //Path count
  //ShowMessage('Path count is '+IntToStr(MyArrayLP)+' and Vortex count is '+IntToStr(MyArrayLV));

  //Initialize bias value
  BiasV :=90;
  BiasH :=60; //60

  //Initialize our Pen step size
  PosX  :=-BiasH;
  PosY  := BiasV*2;
  SoV   := 50;

  //check Image1.Canvas size
  He:=Image1.Height;
  Wi:=Image1.Width;

  //fill Image1.Canvas with white color
  Image1.Canvas.Brush.Color := clWhite;
  Image1.Canvas.Rectangle (0,0,Wi,He);

  //changing color to red
  Image1.Canvas.Brush.Color := clRed;
  //let's begin

  i:=0;
  j:=0;
  For j:=0 To MyArrayLP-1 Do
  Begin
    For i:=0 To MyArrayLV-1 Do
    Begin
      if j=0 then
      begin
        //draw vortexes
        PosX := PosX+BiasH;
        MyArrayLV0X[i]:= PosX;
        Memo1.Text:= Memo1.Text+'vortex '+IntToStr(i)+' x coord is '+IntToStr(MyArrayLV0X[i]);
        if (i mod 2 = 0) then
        begin
          //PosY := PosY + Round(BiasV/2)*i;
          PosY := PosY + Round(BiasV/2)*i+i*i;
          MyArrayLV0Y[i]:= PosY;
          Memo1.Text:= Memo1.Text+' y coord is '+IntToStr(MyArrayLV0Y[i]);
        end
          else
        begin
          PosY := PosY - Round(BiasV/2)*i-i*i;
          MyArrayLV0Y[i]:= PosY;
          Memo1.Text:= Memo1.Text+' y coord is '+IntToStr(MyArrayLV0Y[i]);
        end;
      Memo1.Text:=Memo1.Text+Chr(13)+Chr(10);
      Image1.Canvas.Rectangle (PosX,PosY,PosX+SoV,PosY+SoV);
      Image1.Canvas.TextOut(PosX+5,PosY+5,IntToStr(i));
      end;
    end;
  end;


  i:=0;
  j:=0;
  For i:=0 To MyArrayLP-1 Do
  begin
    For j:=0 To MyArrayLV-1 Do
    begin
       Memo2.Text:=Memo2.Text+' '+IntToStr(MyArray[j,i]);
    end;
    Memo2.Text:=Memo2.Text+Chr(13)+Chr(10);
  end;

  i:=0;
  j:=0;
  For i:=0 To MyArrayLV-1 Do
  begin
    For j:=0 To MyArrayLP-1 Do
    begin
       Memo3.Text:=Memo3.Text+' '+IntToStr(MyArray[i,j]);
    end;
    Memo3.Text:=Memo3.Text+Chr(13)+Chr(10);
  end;

  i:=0;
  j:=0;
  ii:=0;
  PathDrawed:=0;

  For i:=0 To MyArrayLV-2 Do
  begin
    For j:=0 To MyArrayLP-1 Do
    begin
       for ii:=i to MyArrayLV-1 Do
       begin
           if (MyArray[i,j]=(-1)*MyArray[ii,j]) and (MyArray[i,j]<>0) then
           begin
             //ShowMessage(IntToStr(i)+' '+IntToStr(j)+'and compared with '+IntToStr(ii)+IntToStr(j));
             PathDrawed:=PathDrawed+1;
             Image1.Canvas.Line(MyArrayLV0X[i],MyArrayLV0Y[i],MyArrayLV0X[ii],MyArrayLV0Y[ii]);
           end;
         end;
       end;
    end;
 //ShowMessage(IntToStr(PathDrawed));
 end;
end.

