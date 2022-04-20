unit JogoDaVelha;

interface

type

     Tabuleiro = Record
        m: array [0..2, 0..2] of string;
     End;


function zerar(var t: tabuleiro): tabuleiro;
function imprimir(t: tabuleiro): tabuleiro;

//procedure Platinado(const a:string; //constante
//                    var b:string;        //valor
//                    c:string);    //referência

implementation

function zerar(var t: tabuleiro): tabuleiro;
var i, j: integer;
begin
  for i := 0 to 2 do
     begin
       for j := 0 to 2 do
           t.m[i][j] := 'X';
     end;
end;

function imprimir(t: tabuleiro): tabuleiro;
var i: integer;
begin
  for i := 0 to 2 do
      begin
        write(t.m[i][0]);
        write(' | ');
        write(t.m[i][1]);
        write(' | ');
        writeln(t.m[i][2]);

        if (i < 2) then
           writeln('---------');
      end;
  writeln('    ');
end;

//procedure Platinado(const a:string; //constante
//                    var b:string;        //valor
//                    c:string);    //referência
//begin
//  //a := '1';
//  b := 'bola casinha';
//  c := 'chuveiro';
//end;
end.
