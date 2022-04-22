unit JogoDaVelha;

interface

uses
  SysUtils
  ,Math
  ;
type
    TipoTabuleiro = class {TODO -oDouglas -cTreinamento : Mudar para classe}
       matriz: array [0..2, 0..2] of string;
    End;

    TipoJogador = class
      nome   : string;
      simbolo: string;
    End;

    TipoJogador2 = array[0..1] of TipoJogador;

    TipoJogada = class
      i: integer;
      j: integer;
    End;


function zerar(tabuleiro: TipoTabuleiro): TipoTabuleiro;  {TODO -oDouglas -cTreinamento : Mudei os tipos se vira}
function imprimir(tabuleiro: TipoTabuleiro): TipoTabuleiro;
procedure criar_jogadores(jogadores: TipoJogador2);

function aguardar_jogada(jogador: TipoJogador): TipoJogada;

implementation

function zerar(tabuleiro: TipoTabuleiro): TipoTabuleiro;
var i, j: integer;
begin
  for i := 0 to 2 do
     begin
       for j := 0 to 2 do
           tabuleiro.matriz[i][j] := ' ';
     end;
end;

function imprimir(tabuleiro: TipoTabuleiro): TipoTabuleiro;
var i: integer;
begin
  for i := 0 to 2 do
      begin
        write(tabuleiro.matriz[i][0]);
        write(' | ');
        write(tabuleiro.matriz[i][1]);
        write(' | ');
        writeln(tabuleiro.matriz[i][2]);

        if (i < 2) then
           writeln('---------');
      end;
  writeln(' ');
end;

procedure criar_jogadores(jogadores: TipoJogador2);
begin
  jogadores[0].nome := 'A';
  jogadores[0].simbolo := 'X';

  jogadores[1].nome := 'B';
  jogadores[1].simbolo := 'O';
end;

function aguardar_jogada(jogador: TipoJogador): TipoJogada;
var jogada: TipoJogada;
begin
  jogada := TipoJogada.Create;

  writeln('Jogador '+ jogador.nome + ' => Linha: ' );
  read(jogada.i);

  writeln('Jogador '+ jogador.nome + ' => Coluna: ' );
  read(jogada.j);

  result := jogada;
end;

end.
