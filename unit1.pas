unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Grids, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Image1: TImage;
    Memo1: TMemo;
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
  i,j,jj, jjc:  integer;
  MyArrayLV:    integer;//Vortex count
  MyArrayLP:    integer;//Path count
  MyArrayLV0X:  array of integer;//Vortex X coord
  MyArrayLV0Y:  array of integer;//Vortex Y coord
  SoV:          integer;//SizeOfVertex
  SignX, SignY: integer;

begin
  SetLength(MyArray, 3, 3);  //first numeric is the vortex number,
  //second numeric is the path count
  MyArray[0,0]:=  1;
  MyArray[0,1]:=  2;
  MyArray[0,2]:=  0;

  MyArray[1,0]:= -1;
  MyArray[1,1]:=  0;
  MyArray[1,2]:=  1;//1

  MyArray[2,0]:=  0;
  MyArray[2,1]:= -2;
  MyArray[2,2]:= -1;//-1


  MyArrayLV   :=Length(MyArray);//Vortex count
  SetLength(MyArrayLV0X, Length(MyArray));
  SetLength(MyArrayLV0Y, Length(MyArray));
  MyArrayLP   :=Length(MyArray[Low(MyArray)]); //Path count
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
        MyArrayLV0X[i]:= PosX;
        Memo1.Text:= Memo1.Text+'vortex '+IntToStr(i)+' x coord is '+IntToStr(MyArrayLV0X[i]);
        if (i mod 2 = 0) then
        begin
          PosY := PosY + Round(60/2)*i;
          MyArrayLV0Y[i]:= PosY;
          Memo1.Text:= Memo1.Text+' y coord is '+IntToStr(MyArrayLV0Y[i]);
        end
          else
        begin
          PosY := PosY - Round(60/2)*i;
          MyArrayLV0Y[i]:= PosY;
          Memo1.Text:= Memo1.Text+' y coord is '+IntToStr(MyArrayLV0Y[i]);
        end;
      Memo1.Text:=Memo1.Text+Chr(13)+Chr(10);
      Image1.Canvas.Rectangle (PosX,PosY,PosX+SoV,PosY+SoV);
      end;

      //check paths and draw lines between vortexes
      if (j>0) then
      begin
        jj:=j;
        //ShowMessage('MyArray['+IntToStr(j)+IntToStr(i)+'] is '+IntToStr(MyArray[j,i])
          //+' , and MyArray['+IntToStr(j-1)+IntToStr(i)+'] is '+IntToStr(MyArray[j-1,i]));
        For jjc:=jj-1 DownTo 0 Do
        begin
          if (MyArray[jj,i]=(-1)*MyArray[jjc,i]) and  (MyArray[jj,i]<>0) Then
          begin
            //ShowMessage('MyArray['+IntToStr(jj)+IntToStr(i)+'] is '+IntToStr(MyArray[jj,i])
              //+' , and MyArray['+IntToStr(jjc)+IntToStr(i)+'] is '+IntToStr(MyArray[jjc,i]));
            Image1.Canvas.Line(MyArrayLV0X[jj],MyArrayLV0Y[jj], MyArrayLV0X[jjc],MyArrayLV0Y[jjc]);
            //!! -->> Write here Path number under the Line
            if (MyArray[jj,i]>0) Then
            begin//not tested yet
              ShowMessage('C-C-Plus');
              if (MyArrayLV0X[jjc]<MyArrayLV0X[jj]) then
                SignX:= -1
                else
                SignX:= +1;
              if (MyArrayLV0Y[jjc]<MyArrayLV0Y[jj]) then
                SignY:= -1
                else
                SignY:= +1;
              Image1.Canvas.Rectangle(MyArrayLV0X[jjc],MyArrayLV0Y[jjc],MyArrayLV0X[jjc]+SignX*5,MyArrayLV0Y[jjc]+SignY*5);//not tested yet
            end
            else
            begin
              ShowMessage('C-C-Minus');
              if (MyArrayLV0X[jjc]<MyArrayLV0X[jj]) then
                SignX:= -1
                else
                SignX:= +1;
              if (MyArrayLV0Y[jjc]<MyArrayLV0Y[jj]) then
                SignY:= -1
                else
                SignY:= +1;
              Image1.Canvas.Rectangle(MyArrayLV0X[jj],MyArrayLV0Y[jj],MyArrayLV0X[jj]+SignX*5,MyArrayLV0Y[jj]+SignY*5);
            end;
          end;
        end;
      end;
    end;
  end;
end;

end.

