unit JogoDaVelha;

interface

type
    Tabuleiro = Record
       m: array [0..2, 0..2] of string;
    End;

    Jogador = Record
      nome   : string;
      simbolo: string;
    End;

    TJogador2 = array[0..1] of Jogador;

function zerar(var t: tabuleiro): tabuleiro;
function imprimir(t: tabuleiro): tabuleiro;
procedure criar_jogadores(var jogadores: TJogador2);

implementation

function zerar(var t: tabuleiro): tabuleiro;
var i, j: integer;
begin
  for i := 0 to 2 do
     begin
       for j := 0 to 2 do
           t.m[i][j] := ' ';
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
  writeln(' ');
end;

procedure criar_jogadores(jogadores: TJogador2);
begin
  jogadores[0].nome := 'A';
  jogadores[0].simbolo := 'X';

  jogadores[1].nome := 'B';
  jogadores[1].simbolo := 'O';
end;

end.
