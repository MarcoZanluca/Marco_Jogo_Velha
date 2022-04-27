unit JogoDaVelha;

interface

uses
  SysUtils
  ,Math
  ;
type
    TipoTabuleiro = class
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


function zerar(tabuleiro: TipoTabuleiro): TipoTabuleiro;
function imprimir(tabuleiro: TipoTabuleiro): TipoTabuleiro;

procedure criar_jogadores(jogadores: TipoJogador2);
function aguardar_jogada(jogador: TipoJogador): TipoJogada;
function realizar_jogada(tabuleiro: TipoTabuleiro; jogada: TipoJogada; jogador: TipoJogador): boolean;

function tabuleiro_cheio(tabuleiro: TipoTabuleiro): boolean;
function jogo_acabou(tabuleiro: TipoTabuleiro): boolean;

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
  jogadores[0].nome := 'X';
  jogadores[0].simbolo := 'X';

  jogadores[1].nome := 'Bolinha';
  jogadores[1].simbolo := 'O';
end;

function aguardar_jogada(jogador: TipoJogador): TipoJogada;
begin
  Result := TipoJogada.Create;

  writeln('Vez de ' + jogador.nome + ' => Linha: ' );
  read(Result.i);

  writeln('Vez de '+ jogador.nome + ' => Coluna: ' );
  read(Result.j);
end;

function realizar_jogada(tabuleiro: TipoTabuleiro; jogada: TipoJogada; jogador: TipoJogador): boolean;
begin
  result:= true;
  If   (tabuleiro.matriz[jogada.i][jogada.j] <> ' ') then
       result := false;

  If   result then
       begin
         tabuleiro.matriz[jogada.i][jogada.j] := jogador.simbolo;
       end;
end;

function tabuleiro_cheio(tabuleiro: TipoTabuleiro): boolean;
var i, j: integer;
begin
  result := true;
  for   i := 0 to 2 do
        begin
          for   j := 0 to 2 do
                begin
                  if  tabuleiro.matriz[i][j] = ' ' Then
                      result := false;
                end;
        end;
end;

function jogo_acabou(tabuleiro: TipoTabuleiro): boolean;
begin

result := false;


//Diagonal 1
  if   ((tabuleiro.matriz[0][0] = tabuleiro.matriz[1][1]) and (tabuleiro.matriz[0][0] = tabuleiro.matriz[2][2]) and (tabuleiro.matriz[0][0] <> ' ')) then
       result := true;

//Diagonal 2
  if   ((tabuleiro.matriz[0][2] = tabuleiro.matriz[1][1]) and (tabuleiro.matriz[0][2] = tabuleiro.matriz[2][0]) and (tabuleiro.matriz[0][2] <> ' ')) then
       result := true;

//Coluna 1
  if   ((tabuleiro.matriz[0][0] = tabuleiro.matriz[1][0]) and (tabuleiro.matriz[0][0] = tabuleiro.matriz[2][0]) and (tabuleiro.matriz[0][0] <> ' ')) then
       result := true;

//Coluna 2
  if   ((tabuleiro.matriz[0][1] = tabuleiro.matriz[1][1]) and (tabuleiro.matriz[0][1] = tabuleiro.matriz[2][1]) and (tabuleiro.matriz[0][1] <> ' ')) then
       result := true;

//Coluna 3
  if   ((tabuleiro.matriz[0][2] = tabuleiro.matriz[1][2]) and (tabuleiro.matriz[0][2] = tabuleiro.matriz[2][2]) and (tabuleiro.matriz[0][2] <> ' ')) then
       result := true;

//Linha 1
  if   ((tabuleiro.matriz[0][0] = tabuleiro.matriz[0][1]) and (tabuleiro.matriz[0][0] = tabuleiro.matriz[0][2]) and (tabuleiro.matriz[0][0] <> ' ')) then
       result := true;

//Linha 2
  if   ((tabuleiro.matriz[1][0] = tabuleiro.matriz[1][1]) and (tabuleiro.matriz[1][0] = tabuleiro.matriz[1][2]) and (tabuleiro.matriz[1][0] <> ' ')) then
       result := true;

//Linha 3
  if   ((tabuleiro.matriz[2][0] = tabuleiro.matriz[2][1]) and (tabuleiro.matriz[2][0] = tabuleiro.matriz[2][2]) and (tabuleiro.matriz[2][0] <> ' ')) then
       begin
         result := true;
       end;
end;
end.
